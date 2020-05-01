import 'package:flutter/material.dart';
import 'package:medic_book/helpers/Adapt.dart';
import 'package:medic_book/helpers/constants.dart';
import 'package:medic_book/widgets/common/CommonTitle.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> _historyData = [
      'React combat',
      '1 e',
      '2 e',
      '3 e',
      '4 e',
      '5 e',
      '6 e',
      '7 e'
    ];
    return Column(
      children: <Widget>[
        CommonTitle(
          title: 'search history',
        ),
        SizedBox(
          height: Adapt.height(16.0),
        ),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            children: _historyData
                .take(5)
                .map((String value) => Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: Adapt.width(
                            16.0,
                          ),
                          vertical: Adapt.width(6.0)),
                      margin: EdgeInsets.only(
                          bottom: Adapt.height(10.0), right: Adapt.width(10.0)),
                      decoration: BoxDecoration(
                        color: Color(AppColors.borderColor),
                        borderRadius: BorderRadius.circular(Adapt.px(20.0)),
                      ),
                      child: Text(
                        value,
                        style: TextStyle(
                            fontSize: Adapt.px(12),
                            color: Color(AppColors.fontColor)),
                      ),
                    ))
                .toList(),
          ),
        )
      ],
    );
  }
}
