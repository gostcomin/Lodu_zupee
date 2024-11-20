import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Home extends GetView {
  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, // Prevent default back navigation
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          // Show a confirmation dialog
          bool? shouldExit = await Get.dialog<bool>(
            AlertDialog(
              title: Text("Exit App"),
              content: Text("Are you sure you want to close the app?"),
              actions: [
                TextButton(
                  onPressed: () => Get.back(result: false), // Cancel
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () => Get.back(result: true), // Confirm exit
                  child: Text("Exit"),
                ),
              ],
            ),
          );

          // Handle null result safely
          if (shouldExit == true) {
            SystemNavigator.pop(); // Close the app
          }
        } // Prevent further bubbling
      },
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Safely handle storage write
                    storage.write('token', null); // Clear stored token
                    Get.snackbar('Logout', 'Successful.');
                    Get.toNamed('/login');
                  },
                  child: Text('Logout'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Safely navigate to refer screen

                    Get.toNamed('/referearn');
                  },
                  child: Text('Refer'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
