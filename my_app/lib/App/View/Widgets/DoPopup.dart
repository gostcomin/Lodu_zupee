import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DoPopup extends StatelessWidget {

  final String message;
  const DoPopup({
    super.key,
    required this.message,
  });
  // Text(message)
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: Get.height * .14,
        width: Get.width * .9,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.network(
              'https://lottie.host/ddc5ce64-c487-4cd4-aa26-03e833c759b0/H5hqjWi9eg.json',
              height: Get.height * .09,
              fit: BoxFit.fitHeight,
            ),
            Text(message, style: TextStyle(fontSize: 15),),
          ],
        ),
      ),
      actions: [
        Center(
          child: OutlinedButton(

            onPressed: () {
              Get.back(); // Close the dialog
            },
            child: Text('Ok'),
          ),
        ),
      ],
    );
  }
}

