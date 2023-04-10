import 'package:flutter/material.dart';
import 'package:projects/users/service.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  var response;

  @override
  Future<void> initState() async {
    response = await UsersService.GetUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcılar"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("Data"),
          );
        },
        itemCount: (response["data"]).length,
      ),
    );
  }
}
