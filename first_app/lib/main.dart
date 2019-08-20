import 'package:flutter/material.dart';

import 'package:first_app/pages/products.dart';
import 'package:first_app/pages/auth.dart';
import 'package:scoped_model/scoped_model.dart';

import 'pages/manage_products.dart';
import 'pages/product.dart';
import './scoped-models/main.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    print('MyApp build()');
    return ScopedModel<MainModel>(
      model: MainModel(),
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.deepPurple, accentColor: Colors.deepOrange),
        //home: AuthPage(),
        routes: {
          // When using slash as name of home directory
          // We cannot use the home property of MaterialApp
          '/': (BuildContext context) => AuthPage(),
          'products': (BuildContext context) => ProductsPage(),
          '/admin': (BuildContext context) => ManageProductsPage(),
        },
        onGenerateRoute: (RouteSettings settings) {
          final List<String> pathElements = settings.name.split('/');

          if (pathElements[0] != '') {
            return null;
          }
          if (pathElements[1] == 'product') {
            final int index = int.parse(pathElements[2]);
            return MaterialPageRoute<bool>(
              builder: (BuildContext context) =>
                  ProductPage(index),
            );
          }
          return null;
        },
        //Adding default page to go if navigation fails
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(
            builder: (BuildContext context) => ProductsPage(),
          );
        },
      ),
    );
  }
}
