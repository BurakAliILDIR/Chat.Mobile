class User {
  String? userName;
  String? email;
  String? phoneNumber;

  User({this.userName, this.email, this.phoneNumber});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}