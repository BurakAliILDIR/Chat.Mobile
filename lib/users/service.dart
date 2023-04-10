import 'package:projects/helper/auth_helper.dart';

import '../const/consts.dart';
import '../helper/helper.dart';
import 'model.dart';

class UsersService {
  static Future<List<User>> GetUsers() async {
    final dio = await Helper.GetDio();

    final response = await dio.get(Endpoints.Users);

    var data = response.data;

    AuthHelper.JwtSolve();

    return data;
  }
}
