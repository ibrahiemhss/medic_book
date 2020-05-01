import 'package:flutter/material.dart';
import 'package:medic_book/widgets/common/CommonTitle.dart';
import 'dart:math';

const List<String> _searchNouns = ['Go', '1', '2', '3', '4'];

const List<int> _searchColors = [
  0xfff7CA0DA,
  0xfff7BE585,
  0xfffFF6B84,
  0xfffCE75E9,
  0xfffEBB096
];

class SearchNouns extends StatelessWidget {
  final List<Widget> _textChildren = _searchNouns.map((String value) {
    int _randomNumber = Random().nextInt(_searchColors.length);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          border: Border.all(color: Color(_searchColors[_randomNumber]))),
      child: Text(
        value,
        style: TextStyle(
            color: Color(_searchColors[_randomNumber]), fontSize: 12.0),
      ),
    );
  }).toList();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 24.0),
        CommonTitle(
          title: 'Search noun',
          hiddenSubTitle: true,
        ),
        SizedBox(height: 24.0),
        Container(
          child: Wrap(
            spacing: 10.0,
            runSpacing: 12.0,
            direction: Axis.horizontal,
            alignment: WrapAlignment.spaceBetween,
            children: _textChildren,
          ),
          width: MediaQuery.of(context).size.width,
        )
      ],
    );
  }
}
