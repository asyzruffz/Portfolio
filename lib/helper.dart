import 'package:url_launcher/url_launcher.dart';

class Helper {
  static Future<void> goUrl(String url) async {
    Uri uri = Uri.parse(url);
    await launchUrl(uri);
  }
}
