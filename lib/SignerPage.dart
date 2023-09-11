import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignerPage extends StatefulWidget {
  final File selectedFile;

  SignerPage({required this.selectedFile});

  @override
  _SignerPageState createState() => _SignerPageState();
}

class _SignerPageState extends State<SignerPage> {
  bool _isSigning = false;

  void _signDocument() {

    setState(() {
      _isSigning = true;
    });


    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Document Signed'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _isSigning = false;
              });
              Navigator.pop(context);
              Navigator.pushNamed(context, '/verifier',
                  arguments: widget.selectedFile);
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Document'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isSigning ? null : _signDocument,
              child: Text('Sign Document'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}