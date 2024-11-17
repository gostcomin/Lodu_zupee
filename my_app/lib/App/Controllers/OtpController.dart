import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:my_app/App/Service/OtpAuthService.dart';
import 'package:get_storage/get_storage.dart';

import '../Service/UserAuthService.dart';
import '../View/Widgets/Sign.dart';

class OtpController extends GetxController {
  var otp_controller = TextEditingController();
  var otp = "".obs;
  final storage = GetStorage();
  @override
  void onInit() {
    super.onInit();
    otp_controller.addListener(() {
      otp.value = otp_controller.text;
    });
  }

  Future<void> verifyOtp() async {
    try {
      var url = Uri.parse('https://ludobast.com/API/validate_and_login.php');
      String otp = this.otp.value;
      final authService = Get.find<OtpAuthService>();

      if (otp.isEmpty) {
        throw Exception('OTP cannot be empty');
      }

      String? token = authService.token.value;

      // Ensure the token exists
      if (token == Null || token.isEmpty) {
        print("Token not found");
        return;
      }

      // Set headers with Authorization
      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      Map<String, dynamic> body = {
        'otp': otp,
        'signing_mode': authService.signingMode.value,
        'token': authService.token.value
      };

      var response =
      await http.post(url, headers: headers, body: jsonEncode(body));

      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        Get.find<Userauthservice>().setAuthData(responseData);

        if (responseData['status'] == 'true') {
          // Update token in GetStorage
          if (responseData.containsKey('token')) {
            storage.write('token', responseData['token']);
          }

          // Handle signing_mode
          String signingMode = responseData['signing_mode'];
          if (signingMode == 'register') {
            // Show the registration bottom sheet
            Get.bottomSheet(
              Container(
                color: Colors.white,
                // height: 300,
                child: Center(child: Sign()),
              ),
            );
          } else if (signingMode == 'login') {
            Get.toNamed('/home');
          }
        } else {
          print(responseData.toString());
          Get.snackbar('Error', responseData['message'],
              backgroundColor: Colors.yellow);
        }
      } else {
        Get.snackbar('Error', 'Failed to verify OTP. Please try again.',
            backgroundColor: Colors.yellow);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e',
          backgroundColor: Colors.yellow, duration: Duration(minutes: 5));
    }
  }

  @override
  void onClose() {
    otp_controller.dispose();
    super.onClose();
  }
}
