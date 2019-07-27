import 'package:flutter/material.dart';

import 'package:first_app/pages/product_create.dart';
import 'package:first_app/pages/product_list.dart';

class ManageProductsPage extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;

  ManageProductsPage(this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(automaticallyImplyLeading: false, title: Text('Choose')),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Home'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/products');
                },
              ),
            ],
          ),
        ),
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
            ProductCreatePage(addProduct),
            ProductListPage(),
          ],
        ),
      ),
    );
  }
}
