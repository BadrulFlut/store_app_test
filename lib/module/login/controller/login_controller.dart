import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app_v1/core.dart';
import 'package:store_app_v1/module/login/widget/dialog_error.dart';
import 'package:store_app_v1/state_util.dart';
import 'package:store_app_v1/token.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  login() async {
    try {
      var response = await Dio().post(
        "https://fakestoreapi.com/auth/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "username": nameController.text,
          "password": passwordController.text,
          //username: mor_2314
          //password: 83r5^_
        },
      );
      if (response.statusCode == 200) {
        Map obj = response.data;
        TokenManager().token = obj["token"];
        setState(() {});
      }
    } catch (error) {
      _showErrorDialog("Username atau password salah");
      setState(() {
        nameController.clear();
        passwordController.clear();
      });
    }
  }

  void _showErrorDialog(String message) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return dialogError(context, message);
      },
    );
  }
}
