import 'package:flutter/material.dart';
import 'package:medic_book/helpers/constants.dart';
import 'package:medic_book/helpers/Adapt.dart';
import 'package:flutter_svg/svg.dart';

class CommonTitle extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool hiddenSubTitle;

  CommonTitle({@required this.title, this.onTap, this.hiddenSubTitle = false})
      : assert(title != null);

  Widget get _subTitle {
    if (hiddenSubTitle) {
      // Equivalent to returning an empty label
      return SizedBox();
    }
    return GestureDetector(
      onTap: this.onTap,
      child: Row(
        children: <Widget>[
          Text(
            'All',
            style: TextStyle(
                fontSize: Adapt.px(12), color: Color(AppColors.lightGray)),
          ),
          SizedBox(
            width: 9.0,
          ),
          SvgPicture.asset(
            'assets/icon/icon_right.svg',
            width: Adapt.width(6.0),
            height: Adapt.height(10.0),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            this.title,
            style: TextStyle(
                fontSize: Adapt.px(18),
                color: Color(AppColors.fontColor),
                fontWeight: FontWeight.w400),
          ),
          _subTitle
        ],
      ),
    );
  }
}
