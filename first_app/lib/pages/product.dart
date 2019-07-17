import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dragonus Detailus'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Text('Detailus!'),
              RaisedButton(
                child: Text('BACK'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
        ));
  }
}
