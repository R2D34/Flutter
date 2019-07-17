import 'package:first_app/pages/products.dart';
import 'package:flutter/material.dart';

class ManageProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Manager'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('This is your Dragon tamer'),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                child: Text('Fall from the dragon'),
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => ProductsPage()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
