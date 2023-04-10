import 'dart:convert';

import 'package:projects/helper/auth_helper.dart';
import 'package:projects/users/response.dart';

import '../const/consts.dart';
import '../helper/helper.dart';

class UsersService {
  static Future<GetAllUserResponse> GetUsers() async {
    final dio = await Helper.GetDio();

    final response = await dio.get(Endpoints.Users);

    var data = response.data;

    AuthHelper.JwtSolve();

    data = GetAllUserResponse.fromJson(data);
    return data;
  }
}
