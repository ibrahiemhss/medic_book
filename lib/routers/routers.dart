import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:medic_book/routers/route_handlers.dart';

class Routes {
  //  Home
  static String root = "/";
  // user settings
  static String setting = "/setting";
  // log in
  static String login = "/login";
  // register
  static String register = "/register";
  // search for
  static String search = "/search";
  // leaderboard
  static String leaderboard = "/leaderboard";
  // aboutUs
  static String aboutUs = "/aboutUs";
  // splash
  static String splash = "/splash";

  static void configureRoutes(Router router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: rootHandler);
    router.define(setting, handler: settingRouteHandler);
    router.define(login, handler: loginRouterHandler);
    router.define(register, handler: registerRouterHandler);
    router.define(search, handler: searchRouterHandler);
    router.define(leaderboard, handler: leaderboardRouterHandler);
    router.define(aboutUs, handler: aboutUsRouterHandler);
    router.define(splash, handler: splashRouterHandler);
    // router.define(demoSimpleFixedTrans,
    //     handler: demoRouteHandler, transitionType: TransitionType.inFromLeft);
  }
}
