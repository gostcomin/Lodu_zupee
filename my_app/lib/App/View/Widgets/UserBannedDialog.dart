import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../Controllers/WidgetController/UrlLauncher.dart';

class UserBannedDialog extends StatelessWidget {
  final storage = GetStorage();

  UserBannedDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Prevent back button dismiss
      child: AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Banned Icon
            Icon(
              Icons.block,
              size: Get.height * 0.1,
              color: Colors.red,
            ),
            SizedBox(height: 5),
            // English Text
            Text(
              "Your Account is Banned",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            // Bengali Text
            Text(
              "আপনার অ্যাকাউন্ট নিষিদ্ধ করা হয়েছে",
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            // Contact Support Button
            ElevatedButton(
              onPressed: () {
                String? supportUrl = storage.read('support_url') ?? '';
                if (supportUrl.isNotEmpty) {
                  UrlLauncher.launch(supportUrl);
                } else {
                  Get.snackbar('Error', 'No support URL found');
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),

              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.support_agent, size: 18, color: Colors.white),
                  SizedBox(width: 5),
                  Text(
                    "CONTACT US",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1),
            // Exit Button
            ElevatedButton(
              onPressed: () {
                exit(0);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.close, size: 18, color: Colors.white),
                  SizedBox(width: 5),
                  Text(
                    "EXIT",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
