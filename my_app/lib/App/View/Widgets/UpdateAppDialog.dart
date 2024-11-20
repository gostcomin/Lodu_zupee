
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/WidgetController/UrlLauncher.dart';


class AppUpdatePopUp extends StatelessWidget {
  final String version;
  final List<String> features;
  final Uri updateLink;

  const AppUpdatePopUp({
    super.key,
    required this.version,
    required this.features,
    required this.updateLink,
  });


  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async => false, // Prevent back button dismiss
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.zero, // Remove padding around the content
        content: Container(
          height: Get.height * 0.4,
          width: Get.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            children: [
              // Header with rocket and yellow background
              Container(
                height: Get.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    colors: [Colors.orange.shade200, Colors.yellow.shade400],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned(
                      top: 20,
                      child: Icon(
                        Icons.rocket_launch,
                        size: 70,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              // About Update Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'New Update Available',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.grey.shade800,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      version,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(height: 10),
                    ...features.map(
                          (feature) => Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '• ',
                            style: TextStyle(fontSize: 14),
                          ),
                          Expanded(
                            child: Text(
                              feature,
                              style: const TextStyle(fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              // Update Button
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    UrlLauncher.launch(updateLink.toString());
                  },
                  child: const Text(
                    'UPDATE',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
