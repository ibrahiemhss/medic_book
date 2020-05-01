import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medic_book/containers/Entrance.dart';
import 'package:medic_book/helpers/constants.dart' show AppColors;
import 'package:flutter/services.dart';
import 'package:fluro/fluro.dart';
import 'package:medic_book/routers/routers.dart';
import 'package:medic_book/routers/application.dart';
import 'package:provider/provider.dart';
import 'package:medic_book/stores/registerStore.dart';
import 'package:medic_book/stores/loginStore.dart';
import 'package:medic_book/stores/homeStore.dart';
import 'package:medic_book/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //initialize get injection
  await di.init();
  // Modify the system status bar color
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        Color(AppColors.themeColor), // navigation bar color
    statusBarColor: Color(AppColors.themeColor), // status bar color
  ));
  runApp(MultiProvider(
    providers: [
      Provider<RegisterStore>(
        lazy: true,
        create: (_) => RegisterStore(),
      ),
      Provider<LoginStore>(
        lazy: true,
        create: (_) => LoginStore(),
      ),
      Provider<HomeStore>(
        lazy: true,
        create: (_) => HomeStore(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medic Book',
      theme: ThemeData(
          primaryColor: Color(AppColors.themeColor),
          accentColor: Color(AppColors.themeColor),
          scaffoldBackgroundColor: Color(AppColors.themeColor)),
      home: Entrance(),
      onGenerateRoute: Application.router.generator,
    );
  }
}
