import 'package:projects/chat/response.dart';

import '../const/consts.dart';
import '../helper/helper.dart';

class ChatService {
  static Future<GetMessagesResponse> GetMessages(String receiveId) async {
    final dio = await Helper.GetDio();

    final response =
        await dio.post(Endpoints.Meets, data: {"receiveId": receiveId});

    var data = response.data;

    data = GetMessagesResponse.fromJson(data);
    return data;
  }
}
