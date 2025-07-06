import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skkoapp/features/auth/providers/auth_provider.dart';

class LoginFakeButton extends StatelessWidget {
  const LoginFakeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return ElevatedButton(
          onPressed: () async {
             await ref.read(authProvider.notifier).login('FAKE_TOKEN_FOR_TESTING');
          },
          child: const Text('Login ปลอม'),
        );
      },
    );
  }
}
