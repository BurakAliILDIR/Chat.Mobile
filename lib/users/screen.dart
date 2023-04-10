import 'package:flutter/material.dart';
import 'package:projects/users/response.dart';
import 'package:projects/users/service.dart';

import '../chat/screen.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kullanıcılar"),
      ),
      body: FutureBuilder<GetAllUserResponse>(
        future: UsersService.GetUsers(),
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            List<Widget> widgets = [];
            for (Data data in (snapshot.data?.data as List<Data>)) {
              widgets.add(ListTile(
                title: Text(data.userName.toString()),
                subtitle: Text(data.email.toString()),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatPage(
                        userName: data.userName.toString(),
                        email: data.email.toString(),
                        phoneNumber: data.phoneNumber.toString(),
                      ),
                    ),
                  )
                },
              ));
            }
            return ListView(
              children: widgets,
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              semanticsLabel: 'Kişiler yükleniyor...',
            ),
          );
        },
      ),
    );
  }
}
