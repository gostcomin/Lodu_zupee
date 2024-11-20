import 'package:get/get.dart';
import 'package:my_app/App/Controllers/WidgetController/CallVersionController.dart';
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

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignController>(() => SignController());
  }
}

class CallVersionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppVersionController>(() => AppVersionController());
  }
}