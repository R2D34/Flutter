import 'package:flutter/material.dart';

import 'package:first_app/pages/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('MyApp build()');
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.deepPurple, accentColor: Colors.deepOrange),
      home: AuthPage() 
    );
  }
}
