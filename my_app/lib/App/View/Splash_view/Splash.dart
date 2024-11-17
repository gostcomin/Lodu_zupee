import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;



class Splash extends GetView {

  final storage = GetStorage();

  Future<void> checkTokenAndNavigate() async {
    String? token = storage.read('token');

    if (token != null) {
      try {
        final url = Uri.parse('https://ludobast.com/API/splash.php');
        final headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };
        final body = jsonEncode({'token': token});

        final response = await http.post(url, headers: headers, body: body);

        if (response.statusCode == 200) {
          print('hi');
          final responseData = jsonDecode(response.body);
          print('Device ID sent successfully: ${response.body}');
          if (responseData['status'] && responseData['status'] == true) {
            // Update token if present in the response
            if (responseData.containsKey('token') &&
                responseData['token'] != null) {
              storage.write('token', responseData['token']);
            }

            // Navigate based on account status
            if (responseData['user_data'] != false &&
                responseData['user_data']['account_status'] == "true") {
              Get.toNamed('/home');
            } else {
              storage.write('token', null);
              Get.snackbar('Account Inactive', 'Your account is not active.');
              Get.toNamed('/login');
            }
          } else {
            storage.write('token', null);
            Get.snackbar('Error',
                responseData['message'] ?? 'Invalid response from server.');
            Get.toNamed('/login');
          }
        } else {
          storage.write('token', null);
          Get.snackbar('Error',
              'Failed to validate token. HTTP status: ${response.statusCode}');
          Get.toNamed('/login');
        }
      } catch (e) {
        storage.write('token', null);
        Get.snackbar('Error', 'An error occurred: $e');
        Get.toNamed('/login');
      }
    } else {
      storage.write('token', null);
      Get.toNamed('/login');
    }
  }


  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 1), () => checkTokenAndNavigate());

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('lib/App/Assets/pngegg.png'),
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
                size: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

