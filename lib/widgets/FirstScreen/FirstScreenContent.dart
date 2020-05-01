import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medic_book/widgets/FirstScreen/SearchNouns.dart';

class FirstScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SearchNouns(),
      ],
    );
  }
}
