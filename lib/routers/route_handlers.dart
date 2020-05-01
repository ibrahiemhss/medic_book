import 'package:medic_book/containers/Setting.dart';
import 'package:medic_book/containers/Entrance.dart';
import 'package:medic_book/containers/Login.dart';
import 'package:medic_book/containers/Register.dart';
import 'package:medic_book/containers/Search.dart';
import 'package:medic_book/containers/Leaderboard.dart';
import 'package:medic_book/containers/AboutUs.dart';
import 'package:medic_book/containers/SplashPage.dart';

// import 'package:flutter/painting.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:medic_book/helpers/fluro_convert_util.dart';

Handler rootHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Entrance();
});

// My setup route
Handler settingRouteHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  // String message = params["message"]?.first;
  // String colorHex = params["color_hex"]?.first;
  return Setting();
});


// login
Handler loginRouterHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Login();
});

// registered
Handler registerRouterHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Register();
});
// search for
Handler searchRouterHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Search();
});
// Leaderboard
Handler leaderboardRouterHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Leaderboard();
});

// about us
Handler aboutUsRouterHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AboutUs();
});

// Splash screen
Handler splashRouterHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SplashPage();
});

// var demoFunctionHandler = Handler(
//     type: HandlerType.function,
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//       String message = params["message"]?.first;
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text(
//               "Hey Hey!",
//               style: TextStyle(
//                 color: const Color(0xFF00D6F7),
//                 fontFamily: "Lazer84",
//                 fontSize: 22.0,
//               ),
//             ),
//             content: Text("$message"),
//             actions: <Widget>[
//               Padding(
//                 padding: EdgeInsets.only(bottom: 8.0, right: 8.0),
//                 child: FlatButton(
//                   onPressed: () {
//                     Navigator.of(context).pop(true);
//                   },
//                   child: Text("OK"),
//                 ),
//               ),
//             ],
//           );
//         },
//       );
//     });

/// Handles deep links into the app
/// To test on Android:
///
/// `adb shell am start -W -a android.intent.action.VIEW -d "fluro://deeplink?path=/message&mesage=fluro%20rocks%21%21" com.theyakka.fluro`
// var deepLinkHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//   String colorHex = params["color_hex"]?.first;
//   String result = params["result"]?.first;
//   Color color = Color(0xFFFFFFFF);
//   if (colorHex != null && colorHex.length > 0) {
//     color = Color(ColorHelpers.fromHexString(colorHex));
//   }
//   return DemoSimpleComponent(
//       message: "DEEEEEP LINK!!!", color: color, result: result);
// });
