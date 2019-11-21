import 'dart:io' show Platform, exit;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tinycat99/ui/not_found_page.dart';
import 'package:tinycat99/ui/voucher_screen.dart';
import 'package:tinycat99/utils/style.dart';

import 'contact_screen.dart';
import 'home_rss_screen.dart';

class Main extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<Main> {

  int _selectedBottomIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedBottomIndex = index;
    });
  }

  bool checkTimeExit() {
    DateTime currentDate = DateTime.now();
    var dateExpire = DateTime.parse("2020-10-00 00:00:00Z");
    if (currentDate.millisecondsSinceEpoch > dateExpire.millisecondsSinceEpoch) {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    print(checkTimeExit());
    if (checkTimeExit()) {
      exit(0);
      SystemNavigator.pop();
    }
  }

  _getBottomItemWidget(int pos) {
    switch (pos) {
      case 0:
        return HomeRssScreen();
      case 1:
        return Voucher();
      case 2:
        return Contact();
      default:
        return NotFoundPage();
    }
  }

  Future<bool> _onWillPop(BuildContext context) {
    print('Home_onWillPop==' + Navigator.canPop(context).toString());
    print('Home_onWillPop111==' + Navigator.defaultRouteName);
    if (Config.screenHome) {
      return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text('Thoát ứng dụng?'),
          content: new Text('Bạn muốn thoát App!'),
          actions: <Widget>[
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('Không'),
            ),
            new FlatButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: new Text('Có'),
            ),
          ],
        ),
      ) ??
          false;
    } else if (Config.linkUrl == Config.linkHomeSupport) {
      _onItemTapped(0);
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await _onWillPop(context);
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("Tinycat99", style: StylesText.bodyRegularLeftBlack17pt,),
        ),
        body: _getBottomItemWidget(_selectedBottomIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Trang chủ'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              title: Text('Nhận khuyến mãi'),
            ),
            BottomNavigationBarItem(icon: Icon(Icons.call), title: Text('Liên hệ hỗ trợ'))
          ],
          iconSize: 30,
          currentIndex: _selectedBottomIndex,
          selectedItemColor: MyColors.colorPrimary,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
