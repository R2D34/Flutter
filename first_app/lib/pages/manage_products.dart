import 'package:flutter/material.dart';

import 'package:first_app/pages/product_edit.dart';
import 'package:first_app/pages/product_list.dart';

class ManageProductsPage extends StatelessWidget {
  final Function updateProduct;
  final Function addProduct;
  final Function deleteProduct;
  final List<Map<String, dynamic>> products;
  ManageProductsPage(this.addProduct, this.updateProduct, this.deleteProduct, this.products);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(automaticallyImplyLeading: false, title: Text('Choose')),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Home'),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/products');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: _buildSideDrawer(context),
        appBar: AppBar(
          title: Text('Product Manager'),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(icon: Icon(Icons.dashboard), text: 'Summon a dragon'),
              Tab(icon: Icon(Icons.line_style), text: 'Dragon\'s Stable'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ProductEditPage(addProduct: addProduct),
            ProductListPage(products, updateProduct),
          ],
        ),
      ),
    );
  }
}
