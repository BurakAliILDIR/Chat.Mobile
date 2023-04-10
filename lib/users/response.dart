class GetAllUserResponse {
  int? status;
  String? message;
  List<Data>? data;

  GetAllUserResponse({this.status, this.message, this.data});

  GetAllUserResponse.fromJson(Map<String, dynamic> json) {
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

  @override
  String toString() {
    return 'GetAllUserResponse{status: $status, message: $message, data: $data}';
  }
}

class Data {
  String? userName;
  String? email;
  String? phoneNumber;

  Data({this.userName, this.email, this.phoneNumber});

  Data.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }

  @override
  String toString() {
    return 'Data{userName: $userName, email: $email, phoneNumber: $phoneNumber}';
  }
}
