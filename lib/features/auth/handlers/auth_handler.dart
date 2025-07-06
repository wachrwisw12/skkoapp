
import 'package:url_launcher/url_launcher.dart';

import '../../../config/line_login_config.dart';

Future<void> openTestUrl() async {
  print('openTestUrl() called');
  final Uri url = Uri.parse('https://www.google.com');

  if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
    print('ไม่สามารถเปิดเว็บได้');
  } else {
    print('เปิดเว็บได้ปกติ');
  }
}

Future<void> openLineLogin() async {
  final Uri url = Uri.parse(LineLoginConfig.authorizeUrl);
  print('กำลังเปิดหน้า LINE Login: $url');

  try {
    bool launched = await launchUrl(url, mode: LaunchMode.externalApplication);
    if (!launched) {
      print('ไม่สามารถเปิดหน้า Login LINE ได้');
    } else {
      print('เปิดหน้า Login LINE สำเร็จ');
    }
  } catch (e) {
    print('เกิดข้อผิดพลาดขณะพยายามเปิด LINE Login: $e');
  }
  print('LINE URL: ${LineLoginConfig.authorizeUrl}');

}