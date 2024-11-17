import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io';
import 'package:my_app/App/Service/OtpAuthService.dart';
import 'package:my_app/App/View/Widgets/DoPopup.dart';

class LoginController extends GetxController {
  var phoneController = TextEditingController();
  var phone = "".obs;

  @override
  void onInit() {
    super.onInit();
    phoneController.addListener(() {
      phone.value = phoneController.text;

    });
  }

  Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceId;

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor;
    }

    return deviceId;
  }

  Future<void> logphone() async {
    try {
      var header = {"Content-Type": "application/json"};
      var url = Uri.parse('https://ludobast.com/API/send_login_otp.php');
      String phone = this.phone.value;
      String? deviceId = await getDeviceId();

      if (!RegExp(r'^\d{11}$').hasMatch(phone.trim())) {
        Get.dialog(
          DoPopup(message: "Enter a valid 11-digit Phone Number"),
        );
        return;
      }


      deviceId ??= "unknown_device";
      Map<String, String> body = {
        'phone': phone,
        'ip_address': 'null',
        'device_id': deviceId,
      };
      var response =
      await http.post(url, headers: header, body: jsonEncode(body));
      if (response.statusCode == 200) {
        var responseData = jsonDecode(response.body);
        if (responseData['status'] == true) {
          Get.find<OtpAuthService>().setAuthData(responseData);
          Get.toNamed('/otp');
        } else {
          Get.dialog(
            DoPopup(message: responseData['message']),
          );
        }

      } else {
        Get.dialog(
          DoPopup(message: "Failed to send OTP. Please try again."),
        );

      }
    } on SocketException {
      Get.snackbar(backgroundColor: Colors.white, 'Network Error',
          'No internet connection. Please check your network settings.');
    } on Exception catch (e) {
      Get.snackbar(backgroundColor: Colors.white, 'Error', '$e');
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
