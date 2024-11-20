import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionController extends GetxController {
  // Observable variables
  var versionName = ''.obs;
  var versionCode = ''.obs;

  // Method to fetch app version details
  Future<void> fetchAppVersion() async {
    try {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();
      this.versionName.value = packageInfo.version; // App version name
      this.versionCode.value = packageInfo.buildNumber; // App build number/code
    } catch (e) {
      // Handle errors if needed
      print("Error fetching app version: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchAppVersion(); // Fetch details on controller initialization
  }
}
