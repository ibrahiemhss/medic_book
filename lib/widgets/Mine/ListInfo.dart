import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:medic_book/helpers/Adapt.dart';
import 'package:medic_book/helpers/constants.dart';
import 'package:medic_book/widgets/Mine/ListItem.dart';

class ListInfo extends StatelessWidget {
  final List<Map<String, dynamic>> _list = const [
    {'title': 'title 1'},
    {'title': 'title 2', 'tip': 'write'},
    {'title': 'title 3', 'tip': 'Top up'},
    {'title': 'title 4', 'subTitle': 'subTitle 4', 'tip': 'info'},
    {
      'title': 'title 5',
      'subTitle': 'subTitle 5',
      'tip': '2'
    },
    {'title': 'title 6', 'subTitle': 'subTitle 6'},
  ];

  // Information shown on the right
  Widget _rightWidget(String tip) {
    switch (tip) {
      case 'info':
        return Container(
          width: Adapt.width(8.0),
          height: Adapt.height(8.0),
          decoration: BoxDecoration(
              color: Color(AppColors.colorBlue2),
              borderRadius: BorderRadius.circular(Adapt.width(8.0))),
        );
      case 'write':
        return Container(
          decoration: BoxDecoration(
              border:
                  Border.all(width: 1.0, color: Color(AppColors.colorBlue2)),
              borderRadius: BorderRadius.circular(20.0)),
          padding: EdgeInsets.symmetric(
              horizontal: Adapt.width(16.0), vertical: Adapt.width(2.0)),
          child: Text(
            tip,
            style: TextStyle(
                color: Color(AppColors.colorBlue2), fontSize: Adapt.px(12.0)),
          ),
        );
      case 'Top up':
        return Container(
          decoration: BoxDecoration(
              color: Color(AppColors.mainColor),
              borderRadius: BorderRadius.circular(4.0)),
          padding: EdgeInsets.symmetric(
              horizontal: Adapt.width(14.0), vertical: Adapt.width(8.0)),
          child: Text(
            tip,
            style: TextStyle(
                color: Color(AppColors.fontColor), fontSize: Adapt.px(12.0)),
          ),
        );
      default:
        return SizedBox();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _list.map((Map<String, dynamic> data) {
        return ListItem(
          title: data['title'],
          subTitle: data['subTitle'],
          rightWidget: _rightWidget(data['tip']),
        );
      }).toList(),
    );
  }
}
