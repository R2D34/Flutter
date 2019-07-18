import 'package:flutter/material.dart';

class ProductCreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Fus ro dah!'),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: Text('Here comes the Dragonborn\' Spell'),
                );
              });
        },
      ),
    );
  }
}
