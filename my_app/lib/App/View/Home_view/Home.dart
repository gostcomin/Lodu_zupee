import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Home extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text('Hello Home'),
        ),
      ),
    );
  }
}
