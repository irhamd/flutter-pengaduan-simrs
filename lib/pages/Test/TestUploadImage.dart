import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:notification/service/api/Service.dart';

class TestUploadImage extends StatefulWidget {
  @override
  _TestUploadImageState createState() => _TestUploadImageState();
}

class _TestUploadImageState extends State<TestUploadImage> {
  _TestUploadImageState();

  Service service = Service();
  final _addFormKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  File _image;
  File _image_setelah;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImage_setelah() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image_setelah = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Images'),
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            child: Card(
                child: Container(
                    child: Column(
              children: <Widget>[
                Container(
                  child: Column(
                    children: <Widget>[
                      Text('Image Title'),
                      TextFormField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          hintText: 'Enter Title',
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter title';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                    child: OutlineButton(
                        onPressed: getImage, child: _buildImage())),
                Container(
                    child: OutlineButton(
                        onPressed: getImage_setelah,
                        child: _buildImage_setelah())),
                Container(
                  child: Column(
                    children: <Widget>[
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {
                          if (_addFormKey.currentState.validate()) {
                            _addFormKey.currentState.save();
                            Map<String, String> body = {
                              'title': _titleController.text
                            };
                            service.addImage(
                                body, _image.path, _image_setelah.path);
                          }
                        },
                        child: Text('Save'),
                      )
                    ],
                  ),
                ),
              ],
            ))),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (_image == null) {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Text(_image.path);
    }
  }

  Widget _buildImage_setelah() {
    if (_image_setelah == null) {
      return Padding(
        padding: EdgeInsets.all(10),
        child: Icon(
          Icons.add,
          color: Colors.grey,
        ),
      );
    } else {
      return Text(_image_setelah.path);
    }
  }
}
