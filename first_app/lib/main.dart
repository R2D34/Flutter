import 'package:flutter/material.dart';

import 'package:first_app/pages/products.dart';
import 'package:first_app/pages/auth.dart';
import 'pages/manage_products.dart';
import 'pages/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product) {
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _products.removeAt(index);
    });
  }

  void _updateProduct(int index, Map<String, dynamic> product){
    setState(() {
     _products[index] = product; 
    });
  }

  @override
  Widget build(BuildContext context) {
    print('MyApp build()');
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple, accentColor: Colors.deepOrange),
      //home: AuthPage(),
      routes: {
        // When using slash as name of home directory
        // We cannot use the home property of MaterialApp
        '/': (BuildContext context) => AuthPage(),
        'products': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) =>
            ManageProductsPage(_addProduct, _updateProduct, _deleteProduct, _products),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');

        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
                _products[index]['title'],
                _products[index]['image'],
                _products[index]['price'],
                _products[index]['description']),
          );
        }
        return null;
      },
      //Adding default page to go if navigation fails
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductsPage(_products),
        );
      },
    );
  }
}
