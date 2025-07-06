import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skkoapp/features/auth/providers/auth_provider.dart';

class MenuGrid extends ConsumerWidget {
  const MenuGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = [
      {'icon': Icons.access_time, 'title': 'ลงเวลาปฏิบัติงาน', 'path': '/timekeeping'},
      // {'icon': Icons.beach_access, 'title': 'ระบบลา', 'path': '/leave'},
    ];

    final width = MediaQuery.of(context).size.width;

    return Center(
      child: Wrap(
        spacing: 20,
        runSpacing: 20,
        alignment: WrapAlignment.center,
        children: items.map((item) {
          return InkWell(
            onTap: () {
              context.go(item['path'] as String);
            },
            child: SizedBox(
              width: width < 600 ? width / 3.5 : 160,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Color(0xFFFE6D73),
                    child: Icon(item['icon'] as IconData, size: 40, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    item['title'] as String,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
