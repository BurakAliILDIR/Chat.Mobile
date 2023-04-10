import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthHelper {
  static dynamic JwtSolve() async {
    var storage = const FlutterSecureStorage();

    final token = await storage.read(key: "accessToken");

    final jwt = JWT.decode(token!);

    print(' --- Payload: ${jwt.payload}');

    return jwt;
  }
}
