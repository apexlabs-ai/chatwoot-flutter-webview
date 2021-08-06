library chatwoot_flutter_webview;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class ChatwootWebView extends StatelessWidget {
  final String? email;
  final String? name;
  final String baseUrl;
  final String websiteToken;
  final void Function(String error)? onError;

  const ChatwootWebView({
    required this.websiteToken,
    this.onError,
    this.name,
    this.email,
    this.baseUrl = 'https://app.chatwoot.com',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => WebViewX(
        initialContent: baseUrl,
        initialSourceType: SourceType.URL,
        javascriptMode: JavascriptMode.unrestricted,
        onWebResourceError: (error) => onError?.call(
          error.description,
        ),
        onWebViewCreated: (controller) {
          controller.loadContent(_html, SourceType.HTML);
        },
      );

  String get _html => '''
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body bgColor="#FFF">
      <script>
        (function(d,t) {
          var BASE_URL="$baseUrl";
          var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
          g.src=BASE_URL+"/packs/js/sdk.js";
          s.parentNode.insertBefore(g,s);
          g.onload=function(){
            window.addEventListener('chatwoot:ready', function () {
                window.\$chatwoot.setUser('$email', {
                    email: '$email',
                    name: '$name'
                });
                window.\$chatwoot.toggle();
            });
            window.chatwootSettings = { showPopoutButton: true }
            window.chatwootSDK.run({
              websiteToken: '$websiteToken',
              baseUrl: BASE_URL
            })
          }
        })(document,"script");
      </script>
</body>
</html>
''';
}
