import 'package:get/get.dart';

class OtpAuthService extends GetxService {
  var signingMode = "".obs;
  var token = "".obs;
  void setAuthData(Map<String, dynamic> data) {
    signingMode.value = data['signing_mode'] ?? "";
    token.value = data['token'] ?? "";
  }
}
