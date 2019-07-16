import 'package:flutter/material.dart';

class Products extends StatelessWidget{
  final List<String> products;

  Products(this.products){
    print('Products widget constructor');
  }


Widget _buildProductItem(BuildContext context, int index){
  return Card(
                      child: Column(
                        children: <Widget>[
                          Image.asset('assets/Pixel_Night_Town.gif',),
                          Text(products[index]),
                        ],
                      ),
                    );
                  
}
  @override
  Widget build(BuildContext context) {
    print('Products build method');
    return ListView.builder(
              itemBuilder: _buildProductItem,
              itemCount: products.length,
              );
  }
}