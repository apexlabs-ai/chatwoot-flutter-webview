import 'package:chatwoot_flutter_webview/chatwoot_flutter_webview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatwoot Example'),
      ),
      body: ChatwootWebView(
        websiteToken: 'website-token',
        email: 'your-mail@gmail.com',
        name: 'Your Name',
      ),
    );
  }
}
