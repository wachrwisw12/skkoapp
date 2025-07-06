import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skkoapp/features/auth/providers/auth_provider.dart';

class HomeUserInfoCard extends ConsumerWidget {
  const HomeUserInfoCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: Row(
            children: [
              // ⭕ รูปโปรไฟล์
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
                child: const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage('assets/images/matupoom.png'),
                ),
              ),

              const SizedBox(width: 12),

              // 🟦 ชื่อ + หน่วยงาน
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('นายมาตุภูมิ ใครบุตร'),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(
                            Icons.directions_car,
                            color: Colors.blue,
                            size: 16,
                          ),
                          SizedBox(width: 6),
                          Text(
                            'หน่วยงานสุขภาพดิจิตอล',
                            style: TextStyle(fontSize: 12, color: Colors.blue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // 🔔 ไอคอนแจ้งเตือน + badge
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.grey),
                    onPressed: () async {
                      await ref.read(authProvider.notifier).logout();
                      // 👉 หากคุณใช้ GoRouter สามารถเพิ่ม:
                      // context.go('/login');
                    },
                  ),
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: const Text(
                        '3', // จำนวนแจ้งเตือน
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
