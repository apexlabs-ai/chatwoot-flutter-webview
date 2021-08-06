import 'package:chatwoot_flutter_webview/chatwoot_flutter_webview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatwootDemoPage(),
    ),
  );
}

class ChatwootDemoPage extends StatelessWidget {
  ChatwootDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatwoot Example'),
      ),
      body: ChatwootWebView(
        user: 'user-ident'
        hash: 'identifier hash'
        websiteToken: 'website-token',
        email: 'your-mail@gmail.com',
        name: 'Your Name',
      ),
    );
  }
}
