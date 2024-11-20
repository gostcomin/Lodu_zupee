import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  /// Launch a URL directly
  static Future<void> launch(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }
}