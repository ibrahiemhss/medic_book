import 'package:flutter/material.dart';
import 'package:getflutter/components/appbar/gf_appbar.dart';
import 'package:getflutter/components/button/gf_icon_button.dart';
import 'package:getflutter/types/gf_button_type.dart';
import 'package:medic_book/helpers/Adapt.dart';
import 'package:medic_book/helpers/constants.dart';


class BaseAppbar  {


  Widget build({BuildContext context,
    String title,Function leadingPress,bool showLeading,Widget widgetTitle,double elevation ,
    dynamic actions,
    leadingWiget,
  bool centerTitle}) {

    IconData _backIcon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.arrow_back;
        case TargetPlatform.iOS:
          return Icons.arrow_back_ios;
      //  case TargetPlatform.macOS:
        // TODO: Handle this case.
      //    break;
      }
      assert(false);
      return null;
    }
    return GFAppBar(
      centerTitle: centerTitle??false,
      backgroundColor:Color(AppColors.themeWhite),
      leading: showLeading? leadingWiget?? GFIconButton(
        icon: Icon(_backIcon(),
          color: Colors.white,
        ),
        onPressed: ()=> leadingPress(),
        type: GFButtonType.transparent,
      ):Container(),
      title: widgetTitle==null? Text(title,
          style: TextStyle(
              color: Color(AppColors.fontColorGray),
              fontSize: Adapt.px(16.0))):widgetTitle,
      elevation: elevation??0,
      actions: actions??[],
    );
  }


}
