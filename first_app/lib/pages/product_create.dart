import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String titleValue = '';
  String descriptionValue = '';
  double priceValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(labelText: 'Name of Dragon'),
            onChanged: (String value) {
              setState(() {
                titleValue = value;
              });
            },
          ),
          TextField(
            maxLines: 4,
            decoration: InputDecoration(labelText: 'Description of Dragon'),
            onChanged: (String value) {
              setState(() {
                descriptionValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(labelText: 'Price'),
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                priceValue = double.parse(value);
              });
            },
          ),
        ],
      ),
    );
  }
}
