import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skkoapp/features/auth/page/Loginpage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:skkoapp/features/home/page/Homescreen.dart';
import 'package:skkoapp/features/timekeeping/page/Timekeeping_history_screen.dart';
import 'package:skkoapp/features/timekeeping/page/Timescreen.dart';

import '../features/auth/providers/auth_provider.dart';

GoRouter createRouter(WidgetRef ref) {
  final authNotifier = ref.watch(authProvider.notifier);
  String? getToken() => ref.read(authProvider).token;

  return GoRouter(
    initialLocation: '/',
    refreshListenable: GoRouterRefreshStream(authNotifier.stream),
    redirect: (context, state) {
      final token = getToken();
      final isLoggedIn = token != null;
      print("islogin +$isLoggedIn" );
      print("token +$isLoggedIn" );
      final isLoggingIn = state.matchedLocation == '/';
      if (!isLoggedIn && !isLoggingIn) return '/';
      if (isLoggedIn && isLoggingIn) return '/home';
      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Loginpage(),
      ),

      /// ✅ ShellRoute ที่ครอบทุกหน้าหลัง login
      ShellRoute(

        builder: (context, state, child) {
          final location = state.uri.path;
          return MainScaffold(
            location: location,
            child: child, // ✅ หน้าแต่ละหน้าจะถูกวางใน Scaffold เดียวกัน
          );
        },
        routes: [
          GoRoute(
            path: '/home',
            builder: (context, state) => const Homescreen(),
          ),
          GoRoute(
            path: '/timekeeping',
            builder: (context, state) => TimekeepingScreen(),
            routes: [
              GoRoute(
                path: 'history', // ✅ เป็น path ย่อย
                builder: (context, state) => const TimekeepingHistoryScreen(),
              ),
            ],),
          // GoRoute(
          //   path: '/leave',
          //   builder: (context, state) => LeaveScreen(),
          // ),
          GoRoute(
            path: '/details',
            builder: (context, state) => const DetailsScreen(),
          ),
        ],
      ),
    ],
  );
}


// Layout หลัก ที่มี BottomNavigationBar
class MainScaffold extends StatelessWidget {
  final Widget child;
  final String location;

  const MainScaffold({super.key, required this.child, required this.location});

  @override
  Widget build(BuildContext context) {
    final tabs = ['/home', '/profile', '/settings'];
    int currentIndex = tabs.indexWhere((path) => location.startsWith(path));

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex == -1 ? 0 : currentIndex,
        onTap: (index) {
          context.go(tabs[index]);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าแรก'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'โปรไฟล์'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'แจ้งเตือน'),
        ],
      ),
    );
  }
}

// ตัวช่วยให้ GoRouter รู้ว่า auth state เปลี่ยน
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen((_) {
      notifyListeners();
    });
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
