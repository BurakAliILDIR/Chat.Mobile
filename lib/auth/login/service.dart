import 'package:projects/auth/login/view_model.dart';

import 'package:http/http.dart' as http;
import '../../const/consts.dart';

class LoginService {
  static Future<void> Login(LoginViewModel viewModel) async {
    var url = Uri.https(Endpoints.DevBaseApiUrl, Endpoints.Login, {
      'usernameOrEmail': viewModel.usernameOrEmail,
      'password': viewModel.password
    });
    var response = await http.post(url);
  }
}
