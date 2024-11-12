import 'package:get/get.dart';
import 'package:my_app/App/View/Home_view/Home.dart';
import 'package:my_app/App/View/Log_view/Log.dart';
import 'package:my_app/App/View/Otp_view/Otp.dart';
import 'package:my_app/App/View/Splash_view/Splash.dart';

class AppRoutes {
  // Initial route
  static const initialRoute = '/Splash';

  // Named routes
  static const splash = '/Splash';
  static const log = '/log';
  static const otp = '/otp';
  static const home = '/home';

  // GetPages for routing
  static final pages = [
    GetPage(name: splash, page: () => Splash()),
    GetPage(name: log, page: () => Log()),
    GetPage(name: otp, page: () => Otp()),
    GetPage(name: home, page: () => Home()),
  ];
}