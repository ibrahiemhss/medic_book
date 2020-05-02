import 'package:flutter/material.dart';
import 'package:medic_book/helpers/Adapt.dart';
import 'package:medic_book/helpers/constants.dart';
import 'package:medic_book/widgets/common/SearchInputBox.dart';


class SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: SearchInputBox(),
        ),
        GestureDetector(
          child: Container(
            padding: EdgeInsets.only(
                left: Adapt.width(16.0),
                top: Adapt.width(16.0),
                bottom: Adapt.height(16.0)),
            child: Text(
              "cancel",
              style: TextStyle(
                color: Color(AppColors.fontColorGray),
                fontSize: Adapt.px(14.0),
              ),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
