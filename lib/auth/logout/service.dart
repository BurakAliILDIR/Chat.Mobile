import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LogoutService {
  Future<void> Logout() async {
    var storage = const FlutterSecureStorage();

    await storage.delete(key: "accessToken");
    await storage.delete(key: "refreshToken");
  }
}
