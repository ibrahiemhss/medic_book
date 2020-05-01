import 'package:flutter/material.dart';
import 'package:medic_book/helpers/Adapt.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medic_book/helpers/constants.dart';
import 'package:medic_book/routers/application.dart';
import 'package:fluro/fluro.dart';

class MineNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("mine"),
      centerTitle: true,
      elevation: 0,
      actions: <Widget>[
        IconButton(
          alignment: Alignment.centerLeft,
          onPressed: () {
            Application.router.navigateTo(
              context,
              "/setting",
              transition: TransitionType.native,
              // transitionDuration: const Duration(milliseconds: 300),
            );
          },
          icon: SvgPicture.asset(
            MyAssets.iconSetting,
            width: Adapt.width(Constants.appBarIconSize + 4.0),
            height: Adapt.height(Constants.appBarIconSize + 4.0),
          ),
        )
      ],
    );
  }
}
