import 'package:flutter/material.dart';
import 'package:store_app_v1/core.dart';
import 'package:store_app_v1/token.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SizedBox(
      width: width,
      height: height,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: height / 10,
              alignment: Alignment.center,
              child: const Text(
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            formCard(controller.nameController, "username"),
            formCard(controller.passwordController, "password"),
            SizedBox(
              height: height / 20,
            ),
            button(() async {
              controller.login();
              if (TokenManager().token == "") {
                throw Exception("Error login");
              } else {
                await Future.delayed(const Duration(seconds: 2));
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const HomeView()));
              }
            }, "Login")
          ],
        ),
      ),
    ));
  }

  @override
  State<LoginView> createState() => LoginController();
}
