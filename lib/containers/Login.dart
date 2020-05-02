import 'package:flutter/material.dart';
import 'package:medic_book/containers/Entrance.dart';
import 'package:medic_book/routers/application.dart';
import 'package:fluro/fluro.dart';
import 'package:medic_book/helpers/constants.dart';
import 'package:fluwx/fluwx.dart' as fluwx;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailFilter = TextEditingController();
  final TextEditingController _passwordFilter = TextEditingController();

  String _email = "";
  String _password = "";

  _LoginState() {
    _emailFilter.addListener(_emailListen);
    _passwordFilter.addListener(_passwordListen);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Jump to the homepage during initialization, otherwise an error will be reported
    // Future(() {
    //   Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(builder: (context) => Entrance()),
    //       (route) => route == null);
    // });

  }


  void _emailListen() {
    if (_emailFilter.text.isEmpty) {
      _email = "";
    } else {
      _email = _emailFilter.text;
    }
  }

  void _passwordListen() {
    if (_passwordFilter.text.isEmpty) {
      _password = "";
    } else {
      _password = _passwordFilter.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: EdgeInsets.symmetric(horizontal: Constants.pageMarginSide),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Text(
            'log in',
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
                controller: _emailFilter,
                decoration: InputDecoration(
                    hintText: "(Email) Click directly to enter the main page",
                    border: InputBorder.none,
                    fillColor: Color(AppColors.themeWhiteBlue),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0)),
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
                obscureText: true,
                decoration: InputDecoration(
                    hintText: '(Password) No API access',
                    border: InputBorder.none,
                    fillColor: Color(AppColors.themeWhiteBlue),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 16.0)),
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
              child: InkWell(
                onTap: () {
                  // Prohibit jumping back to the previously registered route
                  Navigator.of(context).pushAndRemoveUntil(
                      new MaterialPageRoute(builder: (context) => Entrance()),
                      (route) => route == null);
                },
                child: Center(
                  child: Text("log in",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins-Bold",
                          fontSize: 18,
                          letterSpacing: 1.0)),
                ),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "No account yet? ",
                style: TextStyle(
                    fontFamily: "Poppins-Medium",
                    color: Color(AppColors.fontColorGray)),
              ),
              InkWell(
                onTap: () {
                  Application.router.navigateTo(
                    context,
                    "/register",
                    transition: TransitionType.native,
                  );
                },
                child: Text("Sign up now",
                    style: TextStyle(
                        color: Color(AppColors.mainColor),
                        fontFamily: "Poppins-Bold")),
              )
            ],
          )
        ]),
    );
  }
}
