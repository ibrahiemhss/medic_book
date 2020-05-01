import 'package:flutter/material.dart';
import 'package:medic_book/helpers/Adapt.dart';
import 'package:medic_book/helpers/constants.dart';
import 'package:medic_book/widgets/Mine/ListItem.dart';
import 'package:medic_book/routers/application.dart';
import 'package:medic_book/containers/Login.dart';
import 'package:fluro/fluro.dart';

class SettingContent extends StatefulWidget {
  @override
  _SettingContentState createState() => _SettingContentState();
}

class _SettingContentState extends State<SettingContent> {
  final List<Map<String, dynamic>> _listItem = const [
    {'title': 'account number'},
    {'title': 'News', 'tip': 'info'},
    {'title': 'Notice'},
    {'title': 'clear cache', 'tip': 'cache', 'subTitle': '34M'},
    {'title': 'Feedback'},
    {'title': 'about us', 'type': 'aboutUs'}
  ];
  bool _value = true;
  // Information shown on the right
  Widget _rightWidget(String tip, Map<String, dynamic> data) {
    switch (tip) {
      case 'info':
        return Switch(
          value: _value,
          onChanged: (newValue) {
            setState(() {
              _value = newValue;
            });
          },
          activeColor: Color(AppColors.fontColor),
          activeTrackColor: Color(AppColors.mainColor),
          inactiveThumbColor: Color(AppColors.mainColor),
          inactiveTrackColor: Colors.black,
        );
      case 'cache':
        return Row(
          children: <Widget>[
            Text(
              data['subTitle'],
              style: TextStyle(
                  color: Color(AppColors.fontColor), fontSize: Adapt.px(12.0)),
            ),
            Icon(
              Icons.chevron_right,
              size: Adapt.width(24.0),
              color: Color(AppColors.fontColor),
            )
          ],
        );
      default:
        return Icon(
          Icons.chevron_right,
          size: Adapt.width(24.0),
          color: Color(AppColors.fontColor),
        );
    }
  }

  // List to operation
  void _onTap(String type) {
    switch (type) {
      case 'aboutUs':
        Application.router.navigateTo(
          context,
          "/aboutUs",
          transition: TransitionType.native,
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Column(
            children: _listItem.map((Map<String, dynamic> data) {
          return ListItem(
            height: Adapt.height(66.0),
            title: data['title'],
            rightWidget: _rightWidget(data['tip'], data),
            onTap: () {
              _onTap(data['type']);
            },
          );
        }).toList()),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Login()),
                (route) => route == null);
          },
          child: Container(
            margin: EdgeInsets.only(top: Adapt.height(120.0)),
            padding: EdgeInsets.symmetric(vertical: Adapt.height(14.0)),
            width: double.infinity,
            decoration: BoxDecoration(color: Color(AppColors.themeWhiteBlue)),
            child: Text(
              "Sign out",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(AppColors.fontColor),
                  fontSize: Adapt.px(20.0),
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    ));
  }
}
