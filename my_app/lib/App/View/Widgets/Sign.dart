import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/RegisterController.dart';



class Sign extends GetView<SignController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignController());
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom:
            MediaQuery.of(context).viewInsets.bottom, // Adjusts for keyboard
      ),
      child: Center(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'SignUp',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              SizedBox(height: 20),
              TextField(
                controller: controller.nameController,
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  labelText: 'Enter your Name',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controller.emailController,
                decoration: InputDecoration(
                  labelText: 'Enter your E-mail address',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: controller.refercodeController,
                decoration: InputDecoration(
                  labelText: 'Promo Code (Optional)',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.registerUser(); // Close bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.green[800],
                ),
                child: Text(
                  'DONE',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
