import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';

Future<void> showCheckInDialog(BuildContext context, String mode) async {
  try {
    // ขอสิทธิ์ตำแหน่ง
    final permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }

    // ดึงตำแหน่งปัจจุบัน
    final position = await Geolocator.getCurrentPosition();
    final LatLng currentLatLng = LatLng(position.latitude, position.longitude);

    final now = DateTime.now();
    final timeStr = DateFormat.Hm().format(now);
    final dateStr = DateFormat.yMMMMEEEEd('th').format(now);

    final isCheckIn = mode == 'in';
    final confirmText = isCheckIn ? 'ลงเวลาเข้างาน' : 'ลงเวลาออกงาน';

    // if (!context.mounted) return;

    showDialog<String>(
      context: context,
      builder:
          (BuildContext context) => AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const Text('AlertDialog description'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'Cancel'),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );



  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('เกิดข้อผิดพลาด: $e')));
    }
  }
}
