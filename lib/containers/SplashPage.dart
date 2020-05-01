import 'dart:async';
import 'package:flutter/material.dart';
import 'package:medic_book/containers/Entrance.dart';
import 'package:medic_book/helpers/Adapt.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  num _time = 6;
  Timer _timer;

  @override
  Widget build(BuildContext context) {
    Adapt.instance = Adapt.getInstance()..init(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/image_splash.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top: Adapt.getInstance().setPx(15.0) +
                Adapt.getInstance().getPadTopH,
            right: Adapt.getInstance().setPx(15.0),
            child: GestureDetector(
              onTap: _goToHome,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Adapt.getInstance().setPx(8.0),
                    vertical: Adapt.getInstance().setPx(4.0)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color.fromRGBO(0, 0, 0, 0.8)),
                child: Text(
                  "${_time}s jump over",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Adapt.getInstance().setPx(14.0),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() {
        _time = _time - 1;
      });
      // Countdown
      if (_time == 1) {
        _goToHome();
      }
    });
    // _countDown();
  }

// Skip to homepage
  void _goToHome() {
    _timer.cancel();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Entrance()),
        (route) => route == null);
  }
}
