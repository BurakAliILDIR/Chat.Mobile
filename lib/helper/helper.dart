import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:projects/helper/auth_helper.dart';
import '../const/consts.dart';

class Helper {
  static Future<Dio> GetDio() async {
    final accessToken = await AuthHelper.GetAccessToken();
    print(accessToken);
    final options = BaseOptions(
        baseUrl: Endpoints.DevBaseApiUrl,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 3),
        headers: {
          Headers.contentTypeHeader: Headers.jsonContentType,
          Headers.acceptHeader: Headers.jsonContentType,
          "Authorization": "Bearer ${accessToken!}"
        });

    return Dio(options);
  }
}
