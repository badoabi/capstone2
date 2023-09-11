import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:capstone2/upload_document_page.dart';

class GenerateKeysPage extends StatefulWidget {
  @override
  _GenerateKeysPageState createState() => _GenerateKeysPageState();
}

class _GenerateKeysPageState extends State<GenerateKeysPage> {
  String publicKey = '';

  String generatePublicKey(String privateKey) {
    final bytes = utf8.encode(privateKey);
    final sha256Result = sha256.convert(bytes);
    return sha256Result.toString();
  }

  String generatePrivateKey() {
    final random = Random.secure();
    final values = List<int>.generate(16, (i) => random.nextInt(255));
    return base64Url.encode(values);
  }

  void generateKeys() {
    final privateKey = generatePrivateKey();
    final publicKey = generatePublicKey(privateKey);

    setState(() {
      this.publicKey = publicKey;
    });
  }

  @override
  void initState() {
    super.initState();
    generateKeys();
  }

  void copyPublicKeyToClipboard() {
    Clipboard.setData(ClipboardData(text: publicKey));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Public key copied to clipboard'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate Keys'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            Text(
              'Generate Keys',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: generateKeys,
              child: Text('Generate Keys'),
            ),
            SizedBox(height: 20),
            Text(
              'Public Key:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SelectableText(
              publicKey,
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: copyPublicKeyToClipboard,
              child: Text('Copy Public Key'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UploadDocumentPage(),
                  ),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
