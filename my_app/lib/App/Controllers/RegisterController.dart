import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:flutter/widgets.dart';
import 'package:get_storage/get_storage.dart';


import '../Service/UserAuthService.dart';

class SignController extends GetxController {
  final nameController = TextEditingController();
  final refercodeController = TextEditingController();
  final emailController = TextEditingController();
  final otpController = TextEditingController();
  final storage = GetStorage();

  var name = "".obs;
  var email = "".obs;
  var refercode = "".obs;

  @override
  void onInit() {
    super.onInit();

    // Listening to field changes
    nameController.addListener(() => name.value = nameController.text);
    emailController.addListener(() => email.value = emailController.text);
    refercodeController
        .addListener(() => refercode.value = refercodeController.text);
  }

  Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    }
    return null;
  }

  Future<void> registerUser() async {
    try {
      final url = Uri.parse('https://ludobast.com/API/register.php');
      final deviceId = await getDeviceId();

      // Validation checks
      if (name.value.isEmpty) throw Exception('Name cannot be empty');
      if (email.value.isEmpty) throw Exception('Email cannot be empty');

      final token = Get.find<Userauthservice>().token.value;
      if (token.isEmpty) throw Exception('Token not found');

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final body = {
        'full_name': name.value,
        'email': email.value,
        'refercode': refercode.value.isEmpty ? 'null' : refercode.value,
        'country': 'BD',
        'device_id': deviceId ?? 'unknown_device',
        'password': null,
      };

      final response = await http.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData['status'] == true) {
          if (responseData.containsKey('token')) {
            storage.write('token', responseData['token']);
            storage.write('isRegistered', true); // Store registration status
          }
          Get.toNamed('/home');
        } else {
          Get.snackbar('Error',
              responseData['message'] ?? 'Failed to register. Try again.',
              backgroundColor: Colors.yellow);
        }
      } else {
        Get.snackbar('Error', 'Failed to register. Server error.');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
    }
  }

  @override
  void onClose() {
    // Dispose controllers to free memory
    nameController.dispose();
    refercodeController.dispose();
    emailController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
