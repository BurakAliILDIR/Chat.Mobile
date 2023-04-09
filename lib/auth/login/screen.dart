import 'package:flutter/material.dart';
import 'package:projects/auth/login/service.dart';
import 'package:projects/auth/login/view_model.dart';

import '../../const/consts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController UsernameOrMailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                "Giriş",
                style: TextStyle(fontSize: 40),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: UsernameOrMailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Kullanıcı Adı veya E-mail',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Parola',
                ),
              ),
            ),
            TextButton(
              child: const Text(
                'Parolamı Unuttum',
              ),
              onPressed: () {
                //forgot password screen
              },
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Giriş'),
                onPressed: () async {
                  var loginViewModel = LoginViewModel();

                  loginViewModel.usernameOrEmail =
                      UsernameOrMailController.text;
                  loginViewModel.password = passwordController.text;

                  LoginService.Login(loginViewModel);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Hesabın yok mu?'),
                TextButton(
                  child: const Text(
                    'Kayıt Ol',
                    style: TextStyle(fontSize: 15),
                  ),
                  onPressed: () {
                    //signup screen
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
