import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  void _getImage(BuildContext context, ImageSource source) {
    ImagePicker.pickImage(source: source, maxWidth: 400.0).then((File image) {
      Navigator.pop(context);
    });
  }

  void _openImagePicker(BuildContext contex) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 150.0,
            padding: EdgeInsets.all(10.0),
            child: Column(children: [
              Text('Pick an Image',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  child: Text('Use Camera'),
                  onPressed: () {
                    _getImage(context, ImageSource.camera);
                  }),
              FlatButton(
                  child: Text('Use Gallery'),
                  onPressed: () {
                    _getImage(context, ImageSource.gallery);
                  }),
            ]),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final buttonColor = Theme.of(context).accentColor;
    return Column(
      children: <Widget>[
        OutlineButton(
          borderSide:
              BorderSide(color: Theme.of(context).buttonColor, width: 2.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.camera_alt),
                SizedBox(width: 5.0),
                Text(
                  'Add Image',
                  style: TextStyle(color: Theme.of(context).buttonColor),
                )
              ]),
          onPressed: () {
            _openImagePicker(context);
          },
        )
      ],
    );
  }
}
