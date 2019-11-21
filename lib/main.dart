import 'package:tinycat99/ui/main_screen.dart';
import 'package:tinycat99/ui/not_found_page.dart';
import 'package:tinycat99/utils/route_generator.dart';
import 'package:tinycat99/utils/style.dart';
import 'package:flutter/material.dart';

import 'utils/style.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            platform: TargetPlatform.iOS,
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.white,
            appBarTheme: AppBarTheme(
              color: MyColors.colorPrimary,
              iconTheme: new IconThemeData(color: Colors.white),
            ),
            primaryTextTheme: TextTheme(
                title: TextStyle(
                    color: Colors.white
                )
            ),
            iconTheme: IconThemeData(color: Colors.white, size: 28),
            backgroundColor: Colors.white,
            fontFamily: Config.defaultFont),
        home: Main(),
        onGenerateRoute: RouteGenerator.authorizedRoute,
        onUnknownRoute: (RouteSettings rs) => new MaterialPageRoute(
            fullscreenDialog: false, builder: (context) => new NotFoundPage()));
  }
}
