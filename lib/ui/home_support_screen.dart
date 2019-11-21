import 'package:tinycat99/utils/style.dart';
import 'package:tinycat99/widget/webview.dart';
import 'package:flutter/material.dart';

class HomeSupportScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeSupportState();
  }
}

class HomeSupportState extends State<HomeSupportScreen> {

  @override
  Widget build(BuildContext context) => WebviewKuApp(Config.linkHomeSupport, true);
}
