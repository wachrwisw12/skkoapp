class AuthService {
  // จำลองการ login
  Future<String> login({required String username, required String password}) async {
    // จำลอง delay เหมือนติดต่อ server
    await Future.delayed(const Duration(seconds: 1));

    // จำลองว่าถ้า username = admin และ password = 1234 จะ login สำเร็จ
    if (username == 'admin' && password == '1234') {
      // return 'FAKE_TOKEN_1234'; // token mock
      return 'FAKE_TOKEN_1234'; // token mock
    } else {
      throw Exception('ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง');
    }
  }

  // จำลองการ logout
  Future<void> Logout() async {
    await Future.delayed(const Duration(milliseconds: 300));
    // ไม่มีอะไรต้องทำ เพราะเป็น mockdd
  }
}
