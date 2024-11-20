import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/App/View/Widgets/AppMaintenanceDialog.dart';

import '../../Config/AppData.dart';
import '../../Controllers/WidgetController/CallVersionController.dart';
import '../Widgets/DoPopup.dart';
import '../Widgets/UpdateAppDialog.dart';
import '../Widgets/UserBannedDialog.dart';

class Splash extends GetView<AppVersionController> {
  final storage = GetStorage();
  final AppVersionController appVersionController = Get.find();

  /// Checks the stored token and navigates to the appropriate screen
  Future<void> checkTokenAndNavigate() async {
    final String token = storage.read('token') ?? '';

    try {
      // API URL
      final url = Uri.parse('${AppConfig.apiUrl}splash.php');

      // Headers
      final headers = {
        'Content-Type': 'application/json',
        if (token.isNotEmpty) 'Authorization': 'Bearer $token',
      };

      // Body
      final body = jsonEncode({'token': token});

      // Make the API call
      final response = await http.post(url, headers: headers, body: body);

      // Process the response
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData['app_data']['support_url'] != null && responseData['app_data']['support_url'].isNotEmpty) {
          storage.write('support_url', responseData['app_data']['support_url'].toString());
        }

        // Check for version update
        if (responseData['app_data']['version_name'] != appVersionController.versionName.value) {
          Get.dialog(
            AppUpdatePopUp(features: [responseData['app_data']['whats_new']], version: responseData['app_data']['version_name'], updateLink: Uri.parse(responseData['app_data']['update_url'])
            ),
          );
          return;
        }
        // Check for version update
        if (responseData['app_data']['maintenance'] == 'true') {
          Get.dialog(
            ShowMaintenance()
          );
          return;
        }

        // Check if the response indicates successful login
        if (responseData['status'] == true) {
          // Update token if provided in response
          if (responseData.containsKey('token') && responseData['token'] != null) {
            storage.write('token', responseData['token']);
          }

          // Navigate based on account status
          if (responseData['user_data'] != null &&
              responseData['user_data']['account_status'] == "true") {
            Get.toNamed('/home');
          } else {
            _handleInactiveAccount();
          }
        } else {
          _handleInvalidResponse(responseData['message']);
        }
      } else {
        _handleConnectionError(response.statusCode);
      }
    } catch (e) {
      _handleUnexpectedError(e);
    }
  }

  /// Handles inactive accounts
  void _handleInactiveAccount() {
    storage.write('token', null);
    Get.dialog(
        UserBannedDialog()
    );

    Get.toNamed('/login');
  }

  /// Handles invalid responses from the server
  void _handleInvalidResponse(String? message) {
    storage.write('token', null);
    // Get.dialog(
    //   DoPopup(message: message ?? 'Invalid response from server.'),
    // );
    Get.toNamed('/login');
  }

  /// Handles connection errors
  void _handleConnectionError(int statusCode) {
    storage.write('token', null);
    Get.dialog(
      DoPopup(message: 'Unable to connect with server. HTTP Status: $statusCode'),
    );
    Get.toNamed('/login');
  }

  /// Handles unexpected errors
  void _handleUnexpectedError(Object e) {
    storage.write('token', null);
    Get.dialog(
      DoPopup(message: 'An unexpected error occurred: $e'),
    );
    Get.toNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    // Delay the navigation check by 1 second
    Future.delayed(const Duration(seconds: 1), checkTokenAndNavigate);

    return Scaffold(
      backgroundColor: Colors.black, // Added background color for better UI
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(AppConfig.logoPath),
              maxRadius: 45,
            ),
            const SizedBox(height: 20),
            const Text(
              AppConfig.appName,
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const SpinKitFadingCircle(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
