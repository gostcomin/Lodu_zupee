import 'package:get/get.dart';
import '../Controllers/LoginController.dart';
import '../Controllers/OtpController.dart';
import '../Controllers/RegisterController.dart';

class AllBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
  }
}

class SingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignController>(() => SignController());
  }
}
