import 'package:flutter/material.dart';
import 'package:medic_book/helpers/Adapt.dart';
import 'package:medic_book/widgets/Search/SearchBox.dart';
import 'package:medic_book/widgets/Search/History.dart';
import 'package:medic_book/helpers/constants.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(
            top: Adapt.height(56.0),
            left: Constants.pageMarginSide,
            right: Constants.pageMarginSide),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SearchBox(),
              SizedBox(
                height: 32.0,
              ),
              // PopularSearches(),
              History()
            ],
          ),
        ),
      ),
    );
  }
}
