import 'package:flutter/material.dart';

import './products.dart';

class ProductManager extends StatefulWidget {
  final String startingProduct;

  ProductManager(this.startingProduct){
print('Products manager constructor');
  }

  @override
  State<StatefulWidget> createState() {
    print('Producst Manager createState()');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _products = [];

  @override
  void initState() {
    print('ProductManagerStatte initState()');
    _products.add(widget.startingProduct);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('ProductMangareState build()');
    return Column(children: [
      Container(
        margin: EdgeInsets.all(10.0),
        child: RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            setState(() {
              _products.add('Dragons Claw');
            });
          },
          child: Text('Add product'),
        ),
      ),
      Products(_products)
    ]);
  }
}
