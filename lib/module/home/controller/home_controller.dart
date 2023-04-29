import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app_v1/state_util.dart';
import 'package:store_app_v1/token.dart';
import '../view/home_view.dart';

class HomeController extends State<HomeView> implements MvcController {
  static late HomeController instance;
  late HomeView view;

  @override
  void initState() {
    instance = this;
    getData();
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List<Map<String, dynamic>> listData = [];

  getData() async {
    var response = await Dio().get(
      "https://fakestoreapi.com/products",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    List<dynamic> obj = response.data;
    listData = List<Map<String, dynamic>>.from(obj);
    setState(() {});
  }

  deleteToken() {
    setState(() {
      TokenManager().token = "";
      print(TokenManager().token);
    });
  }
}
