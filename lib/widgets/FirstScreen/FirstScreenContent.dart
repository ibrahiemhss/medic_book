import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medic_book/containers/Login.dart';
import 'package:medic_book/widgets/FirstScreen/SearchNouns.dart';

class FirstScreenContent extends StatelessWidget {
  final bool signedIn;

  const FirstScreenContent({Key key,@required this.signedIn}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        signedIn?SearchNouns():Login(),
       // SearchNouns(),
      ],
    );
  }
}
