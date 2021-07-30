library chatwoot_flutter_webview;

import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class ChatwootWebView extends StatefulWidget {
  final String? email;
  final String? name;
  final String baseUrl;
  final bool popout;
  final bool startExpanded;
  final String websiteToken;

  const ChatwootWebView({
    required this.websiteToken,
    this.baseUrl = 'https://app.chatwoot.com',
    this.popout = false,
    this.startExpanded = false,
    this.name,
    this.email,
    Key? key,
  }) : super(key: key);

  @override
  ChatwootWebViewState createState() => ChatwootWebViewState();
}

class ChatwootWebViewState extends State<ChatwootWebView> {
  @override
  Widget build(BuildContext context) {
    return WebViewX(
      initialContent: _html,
      initialSourceType: SourceType.HTML,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

  String get _html {
    return '''
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
      <script>
        (function(d,t) {
          var BASE_URL="${widget.baseUrl}";
          var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
          g.src=BASE_URL+"/packs/js/sdk.js";
          s.parentNode.insertBefore(g,s);
          g.onload=function(){
            window.addEventListener('chatwoot:ready', function () {
                window.\$chatwoot.setUser('${widget.email}', {
                    email: '${widget.email}',
                    name: '${widget.name}'
                });
                ${widget.startExpanded ? 'window.\$chatwoot.toggle();' : ''}
            });
            window.chatwootSettings = { showPopoutButton: ${widget.popout ? 'true' : 'false'}}
            window.chatwootSDK.run({
              websiteToken: '${widget.websiteToken}',
              baseUrl: BASE_URL
            })
          }
        })(document,"script");
      </script>
</body>
</html>
''';
  }
}
