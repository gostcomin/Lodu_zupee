import 'package:get/get.dart';

class Userauthservice extends GetxService {
  var token = "".obs;
  void setAuthData(Map<String, dynamic> data) {
    token.value = data['token'] ?? "";
  }
}
