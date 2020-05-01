import 'package:flutter/material.dart';
import 'package:medic_book/helpers/constants.dart';
import 'package:fluro/fluro.dart';
import 'package:medic_book/routers/application.dart';

import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:medic_book/stores/registerStore.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();
  final TextEditingController _confirmPasswordFilter = TextEditingController();
  final TextEditingController _nameFilter = TextEditingController();

  RegisterStore registerStore;
  String _email = '';
  String _password = '';

  _RegisterState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
    _confirmPasswordFilter.addListener(_confirmPasswordListen);
    _nameFilter.addListener(_nameListen);
  }

  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = '';
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = '';
    } else {
      _password = _passwordFilter.text;
    }
  }

  void _confirmPasswordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = '';
    } else {
      _password = _passwordFilter.text;
    }
  }

  void _nameListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = '';
    } else {
      _password = _passwordFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Register ٍStore
    registerStore = Provider.of<RegisterStore>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 80.0, bottom: 40.0),
          margin: EdgeInsets.symmetric(horizontal: Constants.pageMarginSide),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'register',
                  style: TextStyle(
                    color: Color(AppColors.fontColor),
                    fontSize: 24.0,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0, top: 60.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: TextField(
                      cursorColor: Colors.white,
                      autofocus: true,
                      controller: _nameFilter,
                      decoration: InputDecoration(
                          errorText: 'Username can not be empty',
                          hintText: 'username',
                          border: InputBorder.none,
                          fillColor: Color(AppColors.themeWhiteBlue),
                          filled: true,
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 16.0)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: TextField(
                      onChanged: (value) {
                        print(value);
                      },
                      controller: _passwordFilter,
                      decoration: InputDecoration(
                          errorText: 'E-mail can not be empty',
                          hintText: 'mailbox',
                          border: InputBorder.none,
                          fillColor: Color(AppColors.themeWhiteBlue),
                          filled: true,
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 16.0)),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: TextField(
                      controller: _passwordFilter,
                      decoration: InputDecoration(
                          errorText: 'Password cannot be empty',
                          hintText: 'password',
                          border: InputBorder.none,
                          fillColor: Color(AppColors.themeWhiteBlue),
                          filled: true,
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 16.0)),
                      obscureText: true,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: TextField(
                      controller: _confirmPasswordFilter,
                      decoration: InputDecoration(
                          errorText: 'Confirm that the password is inconsistent with the password',
                          hintText: 'confirm password',
                          border: InputBorder.none,
                          fillColor: Color(AppColors.themeWhiteBlue),
                          filled: true,
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 16.0)),
                      obscureText: true,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 40.0),
                  height: 48.0,
                  decoration: BoxDecoration(
                      color: Color(AppColors.mainColor),
                      borderRadius: BorderRadius.circular(4.0)),
                  child: Material(
                    color: Colors.transparent,
                    child: Observer(
                      builder: (_) => InkWell(
                            onTap: () {
                              registerStore.handleRegister();
                            },
                            child: Center(
                              child: Text('register',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Poppins-Bold',
                                      fontSize: 18,
                                      letterSpacing: 1.0)),
                            ),
                          ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Existing account? ',
                      style: TextStyle(
                          fontFamily: 'Poppins-Medium',
                          color: Color(AppColors.fontColorGray)),
                    ),
                    InkWell(
                      onTap: () {
                        Application.router.navigateTo(
                          context,
                          '/login',
                          transition: TransitionType.native,
                        );
                      },
                      child: Text('log in',
                          style: TextStyle(
                              color: Color(AppColors.mainColor),
                              fontFamily: 'Poppins-Bold')),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
