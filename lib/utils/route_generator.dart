import 'package:tinycat99/ui/contact_webview_screen.dart';
import 'package:tinycat99/ui/home_link_screen.dart';
import 'package:tinycat99/ui/main_screen.dart';
import 'package:tinycat99/ui/not_found_page.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route authorizedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/Main':
        return _buildRoute(settings, Main());
      case '/home':
        return _buildRoute(settings, HomeLinkScreen());
      case '/support':
        return _buildRoute(settings, ContactWebview());
      default:
        return _buildRouteDialog(settings, NotFoundPage());
    }
  }

  static MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }

  static MaterialPageRoute _buildRouteDialog(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      fullscreenDialog: true,
      builder: (BuildContext context) => builder,
    );
  }
}
