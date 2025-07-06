import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skkoapp/features/home/widgets/home_user_info_card.dart';
import 'package:skkoapp/features/home/widgets/menu_grid.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {'icon': Icons.access_time, 'label': 'ลงเวลาปฏิบัติงาน', 'path': '/time'},
      {'icon': Icons.beach_access, 'label': 'ระบบลา', 'path': '/leave'},
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        leading: Padding(padding: EdgeInsets.all(5)),
        title: const Text("หน้าแรก"),
        backgroundColor:Color(0xFF227C9D),
      ),
      body: Column(
        children: [
          HomeUserInfoCard(),
          Expanded(child: MenuGrid()),
        ],
      ),
    );
  }
}

/// The details screen
class DetailsScreen extends StatelessWidget {
  /// Constructs a [DetailsScreen]
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('/'),
          child: const Text('Go back to the Home screen'),
        ),
      ),
    );
  }
}
