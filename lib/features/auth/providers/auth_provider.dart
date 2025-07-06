import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final _secureStorage = const FlutterSecureStorage();

/// สถานะการยืนยันตัวตน
class AuthState {
  final bool isLoading;
  final String? token;

  const AuthState({
    required this.isLoading,
    this.token,
  });

  AuthState copyWith({bool? isLoading, String? token}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      token: token ?? this.token,
    );
  }

  bool get isLoggedIn => token != null;
  // bool get isLoggedIn => token != null;
}

/// Notifier สำหรับจัดการสถานะ Auth
class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(const AuthState(isLoading: true)) {
    _loadToken();
  }

  final _streamController = StreamController<AuthState>.broadcast();

  Stream<AuthState> get stream => _streamController.stream;

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  void _emit(AuthState newState) {
    state = newState;
    _streamController.add(newState);
  }

  Future<void> _loadToken() async {
    try {
      final token = await _secureStorage.read(key: 'access_token');
      _emit(AuthState(isLoading: false, token: token));
    } catch (e) {
      _emit(const AuthState(isLoading: false, token: null));
    }
  }

  Future<void> login(String token) async {
    try {
      await _secureStorage.write(key: 'access_token', value: token);
      _emit(AuthState(isLoading: false, token: token));
    } catch (_) {
      _emit(const AuthState(isLoading: false, token: null));
    }
  }

  Future<void> logout() async {
    try {
      await _secureStorage.delete(key: 'access_token');
    } finally {
      _emit(const AuthState(isLoading: false, token: null));
    }
  }
}

/// ตัว Provider หลัก
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>(
      (ref) => AuthNotifier(),
);
