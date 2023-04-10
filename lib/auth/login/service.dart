import 'package:projects/auth/login/view_model.dart';
import '../../const/consts.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../helper/helper.dart';

class LoginService {

  static Future<int> Login(LoginViewModel viewModel) async {

    final dio = await Helper.GetDio();

    final response = await dio.post(Endpoints.Login, data: {
      'usernameOrEmail': viewModel.UsernameOrEmail,
      'password': viewModel.Password
    });

    var data = response.data["data"];

    var storage = const FlutterSecureStorage();

    await storage.write(key: "accessToken", value: data["accessToken"]);
    await storage.write(key: "refreshToken", value: data["refreshToken"]);

    return response.data["status"];
  }
}
