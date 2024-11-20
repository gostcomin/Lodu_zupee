// initial_binding.dart
import 'package:get/get.dart';
import 'package:my_app/App/Service/OtpAuthService.dart';
import '../Service/UserAuthService.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpAuthService>(() => OtpAuthService(), fenix: true, );
    Get.lazyPut<Userauthservice>(() => Userauthservice(), fenix: true);
  }
}
