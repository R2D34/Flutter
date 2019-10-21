import 'package:first_app/widgets/products/address_tag.dart';
import 'package:flutter/material.dart';

import 'package:scoped_model/scoped_model.dart';

import '../ui_elements/title_default.dart';
import './price_tag.dart';
import '../../models/product.dart';
import '../../scoped-models/main.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard(this.product);

  Widget _buildTitlePriceRow() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: TitleDefault(product.title),
          ),
          Flexible(
            child: SizedBox(width: 50.0),
          ),
          Flexible(
            child: PriceTag(product.price.toString()),
          ),
        ],
      ),
      margin: EdgeInsets.only(top: 10.0),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.info),
            iconSize: 50.0,
            color: Theme.of(context).primaryColor,
            onPressed: () {
              model.selectProduct(product.id);
              Navigator.pushNamed<bool>(
                context,
                '/product/' + product.id,
              ).then((_) => model.selectProduct(null));
            },
          ),
          IconButton(
            icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border),
            iconSize: 50.0,
            color: Colors.red,
            onPressed: () {
              model.selectProduct(product.id);
              model.toggleProductFavoriteStatus();
            },
          ),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Hero(
            tag: product.id,
            child: FadeInImage(
              image: NetworkImage(product.image),
              placeholder: AssetImage('assets/background1.jpg'),
              height: 300.0,
              fit: BoxFit.cover,
            ),
          ),
          _buildTitlePriceRow(),
          SizedBox(height: 10.0,),
          AddressTag('The Lair of Bluescaled Dragons'),
          _buildActionButtons(context),
        ],
      ),
    );
    
  }
}
