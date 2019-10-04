import 'package:flutter/material.dart';

import 'package:first_app/pages/products.dart';
import 'package:first_app/pages/auth.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:map_view/map_view.dart';

import 'pages/manage_products.dart';
import 'pages/product.dart';
import './scoped-models/main.dart';
import './models/product.dart';
import './widgets/helpers/custom_route.dart';

void main() {
  //MapView.setApiKey('AIzaSyCzvJ5yU2S8y6Er96gpY5EIMx7HIGgUNHo');
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final MainModel _model = MainModel();
  bool _isAuthenticated = false;

  @override
  void initState() {
    _model.autoAuthenticate();
    _model.userSubject.listen((bool isAuthenticated) {
      setState(() {
        _isAuthenticated = isAuthenticated;
      }); 
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('MyApp build()');
    return ScopedModel<MainModel>(
      model: _model,
      child: MaterialApp(
        title: 'OlxLikeShop',
        theme: ThemeData(
            primarySwatch: Colors.deepPurple, accentColor: Colors.deepOrange),
        //home: AuthPage(),
        routes: {
          // When using slash as name of home directory
          // We cannot use the home property of MaterialApp
          '/': (BuildContext context) =>
              !_isAuthenticated ? AuthPage() : ProductsPage(_model),
          '/admin': (BuildContext context) => !_isAuthenticated ? AuthPage() : ManageProductsPage(_model),
        },
        onGenerateRoute: (RouteSettings settings) {
          if (!_isAuthenticated){
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) => AuthPage(),
            );
          }
          final List<String> pathElements = settings.name.split('/');

          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final String productId = pathElements[2];
            final Product product =
                _model.allProducts.firstWhere((Product product) {
              return product.id == productId;
            });
            return CustomRoute<bool>(
              builder: (BuildContext context) => !_isAuthenticated ? AuthPage() : ProductPage(product),
            );
          }
          return null;
        },
        //Adding default page to go if navigation fails
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => !_isAuthenticated ? AuthPage() : ProductsPage(_model),
          );
        },
      ),
    );
  }
}
