import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';

import '../widgets/checkin_dialog.dart';

class TimekeepingScreen extends StatefulWidget {
  const TimekeepingScreen({super.key});

  @override
  State<TimekeepingScreen> createState() => _TimekeepingScreenState();
}

class _TimekeepingScreenState extends State<TimekeepingScreen> {
  late Timer _timer;
  late DateTime _now;

  @override
  void initState() {
    super.initState();
    _now = DateTime.now();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final time = DateFormat('HH:mm:ss').format(_now);
    final date = DateFormat('EEEEที่ d MMMM y', 'th_TH').format(_now);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ลงเวลา'),
        backgroundColor: const Color(0xFF227C9D),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            const CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
            ),
            const SizedBox(height: 12),
            const Text(
              'มาตุภูมิ ใครบุตร (เหยี่ยว)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Text('แสดงเวลาการลงเวลา'),
            const SizedBox(height: 32),
            Text(
              time,
              style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.bold,
                color: Color(0xFF227C9D),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              date,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => {
                    showCheckInDialog(context, 'in')
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E88E5),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: const Text('ลงเวลาเข้า'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: () =>{
                    showCheckInDialog(context, 'out')
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFF7043),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                  child: const Text('ลงเวลาออก'),
                ),
              ],
            ),
            const SizedBox(height: 24),
            OutlinedButton(
              onPressed: () {
                context.go('/timekeeping/history');
              },
              child: const Text('ประวัติการลงเวลา'),
            ),
          ],
        ),
      ),
    );
  }
}
