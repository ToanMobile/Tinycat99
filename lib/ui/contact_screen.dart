import 'package:tinycat99/utils/style.dart';
import 'package:tinycat99/widget/webview.dart';
import 'package:flutter/material.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Config.screenHome = false;
    return Scaffold(
      body: WebviewKuApp(Config.linkHomeSupport, true),
    );
  }
}
