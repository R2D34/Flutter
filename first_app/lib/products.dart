import 'package:flutter/material.dart';

class Products extends StatelessWidget{
  final List<String> products;

  Products(this.products){
    print('Products widget constructor');
  }

  @override
  Widget build(BuildContext context) {
    print('Products build method');
    return Column(
              children: products
                  .map(
                    (element) => Card(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/Pixel_Night_Town.gif',),
                          Text(element),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            );
  }
}