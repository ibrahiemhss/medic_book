import 'package:flutter/material.dart';
import 'package:medic_book/widgets/Setting/SettingContent.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set up'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SettingContent(),
    );
  }
}
