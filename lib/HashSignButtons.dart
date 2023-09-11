import 'dart:io';
import 'package:capstone2/SignerPage.dart';
import 'package:flutter/material.dart';

class HashSignButtons extends StatefulWidget {
  final File selectedFile;

  HashSignButtons({required this.selectedFile});

  @override
  _HashSignButtonsState createState() => _HashSignButtonsState();
}

class _HashSignButtonsState extends State<HashSignButtons> {
  bool _isHashing = false;
  bool _isHashed = false;

  void _hashDocument() {
    setState(() {
      _isHashing = true;
    });

    // Perform document hashing logic here
    // For demonstration purposes, a delay of 2 seconds is added
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isHashing = false;
        _isHashed = true;
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Document Hashed'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    });
  }

  void _openSignerPage() {
    if (_isHashed) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignerPage(selectedFile: widget.selectedFile),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please hash the document first.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _isHashing ? null : _hashDocument,
          child: Text('Hash Document'),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: _isHashing ? null : _openSignerPage,
          child: Text('Sign Document'),
        ),
      ],
    );
  }
}
