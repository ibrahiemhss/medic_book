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

class Entrance extends StatefulWidget {
  @override
  _EntranceState createState() => _EntranceState();
}

class _EntranceState extends State<Entrance> {
  // Version Information
  VersionData versionData;
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
    _pages = <Widget>[FirstScreen(), Mine()];
    // Navigation Bar
    _navBars = [FirstScreenNavBar(), MineNavBar()];
    /**
     * Get local version information
     */
    _loadVersion();

    Future(() {
      /**
       * Send a request to obtain version information
       * Get data, check version number
       * */
      Provider.of<HomeStore>(context).getVersion();
    });
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

  // Get locally stored version information
  _loadVersion() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _localVersion = prefs.getString('app_veriosn') ?? '1.0.0';
    });
  }

  // Save version information
  _saveVersion(String appVeriosn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('app_veriosn', appVeriosn);
    setState(() {
      _localVersion = appVeriosn;
    });
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
    return Observer(
      builder: (_) {
        String _version = Provider.of<HomeStore>(context,listen: false)?.versionData?.version;
        List<String> _versionList =
            Provider.of<HomeStore>(context)?.versionData?.data;

        if (_version != null && _version != _localVersion) {
          // Version update popup
          Future.delayed(Duration.zero, () {
            showDialog(
                context: context,
                builder: (_) => Scaffold(
                      backgroundColor: Colors.transparent,
                      body: Center(
                        child: Container(
                          width: 320.0,
                          height: 420.0,
                          padding: EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'New version upgrade',
                                style: TextStyle(
                                    color: Color(0xff202326), fontSize: 24.0),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: _versionList
                                        .map((String info) => Text(
                                              info,
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
                                                  fontSize: 18.0, height: 1.3),
                                            ))
                                        .toList(),
                                  ),
                                ),
                              ),
                              RaisedButton(
                                elevation: 0.0,
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50.0,
                                  child: Text(
                                    'Not updating',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(height: 2.0),
                                  ),
                                ),
                                onPressed: () {
                                  _saveVersion(_version);
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                },
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              RaisedButton(
                                elevation: 0.0,
                                child: SizedBox(
                                  width: double.infinity,
                                  height: 50.0,
                                  child: Text(
                                    'update immediately',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white, height: 2.0),
                                  ),
                                ),
                                color: Color(AppColors.mainColor),
                                onPressed: () {
                                  _saveVersion(_version);
                                  _launchURL();
                                  Navigator.of(context, rootNavigator: true)
                                      .pop();
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
          });
        }
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
      },
    );
  }
}
