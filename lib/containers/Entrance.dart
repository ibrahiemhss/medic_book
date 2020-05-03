import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medic_book/helpers/Adapt.dart';
import 'package:medic_book/helpers/constants.dart'
    show AppColors, Constants, MyAssets, Urls;
import 'package:medic_book/stores/homeStore.dart';
import 'package:provider/provider.dart';

import './FirstScreen.dart';
import './Mine.dart';
import 'package:medic_book/widgets/NavBar/FirstScreenNavBar.dart';
import 'package:medic_book/widgets/NavBar/MineNavBar.dart';

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
  HomeStore homeStore;
  bool _second_enter=false;
  //Count, click the back button to exit the program
  int _lastClickTime = 0;
  final List<String> _svgAssetUrl = [MyAssets.iconHome, MyAssets.iconMyself];

  initState() {
    super.initState();
    homeStore = Provider.of<HomeStore>(this.context, listen: false);
    Provider.of<HomeStore>(this.context, listen: false).checkIsSecondEnter();
    // 2 pages of the first screen
    _pages = <Widget>[
      FirstScreen(),
      Mine(),
      Login(
        secondEnter: _second_enter,
      )
    ];
    // Navigation Bar
    _navBars = [
      FirstScreenNavBar(),
      MineNavBar(),
      FirstScreenNavBar(),
    ];
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


  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) {
      _activeIndex =  homeStore.pageIndex;
      _second_enter=homeStore.secondEnter;
      print("Entrance Observer \n"
          "get second_enter =${homeStore.secondEnter}"
          "\n"
          "get changed page index =${homeStore.pageIndex}"
          "");

      if(!_second_enter){
        return Login(secondEnter: false,);
      }else{
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
                print("onClick page index =$index");
                homeStore.setPageIndex(index);

              },
            ),
          ),
        );
      }

      },
    );

  }
}
