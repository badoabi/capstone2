import 'dart:io' show File;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadDocumentPage extends StatefulWidget {
  @override
  _UploadDocumentPageState createState() => _UploadDocumentPageState();
}

class _UploadDocumentPageState extends State<UploadDocumentPage> {
  File? _image;

  Future<void> _getImage() async {
    final pickedImage =
    await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Document'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await _getImage();
                },
                child: Text('Upload Document'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _image != null
                    ? () {
                  Navigator.pushNamed(context, '/hash',
                      arguments: _image);
                }
                    : null,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
