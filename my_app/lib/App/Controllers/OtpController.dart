import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/App/Config/AppData.dart';
import 'dart:convert';
import 'package:my_app/App/Service/OtpAuthService.dart';
import 'package:get_storage/get_storage.dart';

import '../Service/UserAuthService.dart';
import '../View/Widgets/DoPopup.dart';
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
      var url = Uri.parse('${AppConfig.apiUrl}validate_and_login.php');
      String otp = this.otp.value;
      final authService = Get.find<OtpAuthService>();

      if (otp.isEmpty || !RegExp(r'^\d{6}$').hasMatch(otp.trim())) {
        Get.dialog(
          DoPopup(message: "Enter valid OTP Code"),
        );
        return;
      }

      String? token = authService.token.value;

      // Ensure the token exists
      if (token.isEmpty) {
        Get.dialog(
          DoPopup(message: "We are unable to authenticate you, Please try again later."),
        );
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
          Get.dialog(
            DoPopup(message: responseData['message']),
          );
        }
      } else {
        Get.snackbar('Error', 'Failed to verify OTP. Please try again.',
            backgroundColor: Colors.yellow);
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e',
          backgroundColor: Colors.yellow, duration: const Duration(minutes: 5));
    }
  }

  @override
  void onClose() {
    otp_controller.dispose();
    super.onClose();
  }
}
