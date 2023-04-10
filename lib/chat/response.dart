class GetMessagesResponse {
  int? status;
  String? message;
  List<Data>? data;

  GetMessagesResponse({this.status, this.message, this.data});

  GetMessagesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? receiverId;
  String? senderId;
  String? text;
  String? createdAt;

  Data({this.receiverId, this.senderId, this.text, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    receiverId = json['receiverId'];
    senderId = json['senderId'];
    text = json['text'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['receiverId'] = receiverId;
    data['senderId'] = senderId;
    data['text'] = text;
    data['createdAt'] = createdAt;
    return data;
  }
}
