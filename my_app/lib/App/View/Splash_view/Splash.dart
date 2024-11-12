import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends GetView {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed('/log');
    });
    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('lib/App/Assets/logo.jpg'),
              maxRadius: 45,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Zupee',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: SpinKitFadingCircle(
                color: Colors.white,
                size: 70.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}