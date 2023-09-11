import 'dart:io';
import 'package:capstone2/upload_document_page.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'HashSignButtons.dart';
import 'generate_keys_page.dart';
import 'hash_document_page.dart';
import 'login_page.dart';
import 'SignerPage.dart';
import 'Verifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Document Hashing App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/generate-keys': (context) => GenerateKeysPage(),
        '/upload-document': (context) => UploadDocumentPage(),
        '/hash': (context) {
          final selectedFile = ModalRoute.of(context)!.settings.arguments as File?;
          return Scaffold(
              appBar: AppBar(
                title: Text('Hash Document'),
              ),
              body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(
                  'Selected File: ${selectedFile?.path ?? "No file selected"}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  if (selectedFile != null)
              HashSignButtons(selectedFile: selectedFile),

          ],
          ),
          ),
          );
        },
        '/signer': (context) {
          final selectedFile = ModalRoute.of(context)!.settings.arguments as File?;
          return selectedFile != null
              ? SignerPage(selectedFile: selectedFile!)
              : Scaffold(
            appBar: AppBar(
              title: Text('Signer Page'),
            ),
            body: Center(
              child: Text(
                'No file selected',
                style: TextStyle(fontSize: 24),
              ),
            ),
          );
        },
        '/verifier': (context) {
          final selectedFile = ModalRoute.of(context)!.settings.arguments as File?;
          final verificationKey = ''; // Provide the verification key
          return selectedFile != null
              ? VerifierPage(selectedFile: selectedFile, verificationKey: verificationKey)
              : Scaffold(
            appBar: AppBar(
              title: Text('Verifier Page'),
            ),
            body: Center(
              child: Text(
                'No file selected',
                style: TextStyle(fontSize: 24),
              ),
            ),
          );
        },
      },
    );
  }
}