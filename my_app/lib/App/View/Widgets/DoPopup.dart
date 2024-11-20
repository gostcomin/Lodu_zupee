import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DoPopup extends StatelessWidget {
  final String message;

  const DoPopup({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        // Use padding or constraints based on content
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Adjust the height based on content
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.network(
              'https://lottie.host/ddc5ce64-c487-4cd4-aa26-03e833c759b0/H5hqjWi9eg.json',
              height: 50, // Adjust this based on preferred animation size
              fit: BoxFit.fitHeight,
            ),
            SizedBox(height: 10),
            Text(
              message,
              style: TextStyle(fontSize: 15),
              textAlign: TextAlign.center, // Center align the message text
            ),
          ],
        ),
      ),
      actions: [
        Center(
          child: OutlinedButton(
            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: Text('OK'),
          ),
        ),
      ],
    );
  }
}
