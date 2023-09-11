import 'dart:io';
import 'package:flutter/material.dart';

class VerifierPage extends StatefulWidget {
  final String verificationKey;

  VerifierPage({required this.verificationKey, required File selectedFile});

  @override
  _VerifierPageState createState() => _VerifierPageState();
}

class _VerifierPageState extends State<VerifierPage> {
  File? _selectedFile;
  bool _isVerifying = false;
  bool _verificationResult = false;

  void _uploadDocument() async {
    // Implement your file upload logic here
    // Set the _selectedFile variable with the uploaded file

    // Placeholder implementation
    setState(() {
      _selectedFile = File('path/to/uploaded/file');
    });
  }

  void _verifyDocument() {
    if (_selectedFile == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Please upload a document for verification.'),
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
      return;
    }

    setState(() {
      _isVerifying = true;
    });

    // Implement your document verification logic here
    // Compare the selectedFile with the previously uploaded file
    // Use the provided verificationKey to verify the document
    // Set _verificationResult based on the verification outcome

    // Placeholder implementation
    _verificationResult = true;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Verification Result'),
        content: Text(_verificationResult ? 'Verification Successful' : 'Verification Failed'),
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

    setState(() {
      _isVerifying = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verifier Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isVerifying ? null : _uploadDocument,
              child: Text('Upload Document'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isVerifying ? null : _verifyDocument,
              child: Text('Verify Document'),
            ),
            SizedBox(height: 16),
            if (_selectedFile != null)
              Text(
                'Uploaded File: ${_selectedFile!.path}',
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
