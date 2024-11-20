import 'package:get/get.dart';
import 'package:my_app/App/View/Home_view/Home.dart';
import 'package:my_app/App/View/Leaderboard_view/leaderboard.dart';
import 'package:my_app/App/View/Log_view/Log.dart';
import 'package:my_app/App/View/Otp_view/Otp.dart';
import 'package:my_app/App/View/ReferEarn_View/ReferAndEarn.dart';
import 'package:my_app/App/View/Splash_view/Splash.dart';

import '../Binding/ControllerBinding.dart';

class AppRoutes {
  // Initial route
  static const initialRoute = '/Splash';

  // Named routes
  static const splash = '/Splash';
  static const login = '/login';
  static const otp = '/otp';
  static const home = '/home';
  static const leaderboard = '/leaderboard';
  static const referearn = '/referearn';

  // GetPages for routing
  static final pages = [
    GetPage(name: splash, page: () => Splash(), binding: CallVersionBinding()),
    GetPage(name: login, page: () => Login(), binding: AllBindings()),
    GetPage(name: otp, page: () => Otp(), binding: OtpBinding()),
    GetPage(name: home, page: () => Home()),
    GetPage(name: leaderboard, page: () => Leaderboard()),
    GetPage(name: referearn, page: () => ReferAndEarnPage()),
  ];
}
