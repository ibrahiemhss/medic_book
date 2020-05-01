import 'package:flutter/material.dart';
import 'package:medic_book/helpers/Adapt.dart';

//import 'package:medic_book/helpers/constants.dart';
import 'package:medic_book/widgets/Mine/BasicInfo.dart';
import 'package:medic_book/widgets/Mine/ListInfo.dart';

class MineContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BasicInfo(),
            SizedBox(
              height: Adapt.height(16.0),
            ),
            ListInfo()
          ],
        ),
      ),
    );
  }
}
