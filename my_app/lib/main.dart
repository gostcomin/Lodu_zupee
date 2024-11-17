import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/App/Routes/HomeRoutes.dart';
import 'package:flutter/services.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'App/Binding/AuthServiceBinding.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // Lock the orientation to portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,

    DeviceOrientation.portraitDown,
  ]);
  //Remove this method to stop OneSignal Debugging
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);

  OneSignal.initialize("bce12f81-d8fe-4579-b3b7-cea49ef8c924"); // app id needs to be in config file

// The promptForPushNotificationsWithUserResponse function will show the iOS or Android push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
  OneSignal.Notifications.requestPermission(true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        InitialBinding().dependencies();
      }),
      title: 'Zupee',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFF101722), // Set background color
      ),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
