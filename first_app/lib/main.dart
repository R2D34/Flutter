import 'package:flutter/material.dart';

import './product_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MyApp build()');
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple, accentColor: Colors.deepOrange),
      home: Scaffold(
        appBar: AppBar(
          title: Text('List'),
        ),
        body: ProductManager('Food'),
      ),
    );
  }
}
