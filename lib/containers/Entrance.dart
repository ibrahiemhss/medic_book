import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medic_book/models/common.dart';
import 'package:provider/provider.dart';
import 'package:medic_book/stores/homeStore.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:medic_book/helpers/Adapt.dart';
import 'package:medic_book/helpers/constants.dart'
    show AppColors, Constants, MyAssets, Urls;

import './FirstScreen.dart';
import './Mine.dart';
import 'package:medic_book/widgets/NavBar/FirstScreenNavBar.dart';
import 'package:medic_book/widgets/NavBar/MineNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Login.dart';

class Entrance extends StatefulWidget {
  @override
  _EntranceState createState() => _EntranceState();
}

class _EntranceState extends State<Entrance> {
  int _activeIndex = 0;
  List<Widget> _pages;
  List _navBars;
  String _localVersion;

  //Count, click the back button to exit the program
  int _lastClickTime = 0;
  final List<String> _svgAssetUrl = [MyAssets.iconHome, MyAssets.iconMyself];

  initState() {
    super.initState();
    // 2 pages of the first screen
    _pages = <Widget>[FirstScreen(), Mine(), Login()];
    // Navigation Bar
    _navBars = [FirstScreenNavBar(), MineNavBar(),FirstScreenNavBar(),];


  }

// Bottom navigation tab
  SvgPicture bottomIcon(int index) {
    return SvgPicture.asset(_svgAssetUrl[index],
        width: Adapt.width(Constants.bottomIconWidth),
        height: Adapt.height(Constants.bottomIconHeight),
        color: Color(
            _activeIndex == index ? AppColors.mainColor : AppColors.lightGray));
  }

  // Double-click the back button to exit the application
  Future<bool> _doubleExit() {
    int nowTime = DateTime.now().microsecondsSinceEpoch;
    if (_lastClickTime != 0 && nowTime - _lastClickTime > 1500) {
      return Future.value(true);
    } else {
      _lastClickTime = DateTime.now().microsecondsSinceEpoch;
      Future.delayed(const Duration(milliseconds: 1500), () {
        _lastClickTime = 0;
      });
      return Future.value(false);
    }
  }


  // Jump link
  _launchURL() async {
    //
    const url = Urls.baseURL;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
          onWillPop: _doubleExit,
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: _navBars[_activeIndex],
            ),
            body: IndexedStack(
              index: _activeIndex,
              children: _pages,
            ),
            bottomNavigationBar: CupertinoTabBar(
              backgroundColor: Color(AppColors.themeColor),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: bottomIcon(0)),
                BottomNavigationBarItem(icon: bottomIcon(1)),
              ],
              currentIndex: _activeIndex,
              onTap: (int index) {
                setState(() {
                  _activeIndex = index;
                });
              },
            ),
          ),
        );

  }
}
