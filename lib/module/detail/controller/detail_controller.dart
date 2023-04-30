import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:store_app_v1/state_util.dart';
import '../view/detail_view.dart';

class DetailController extends State<DetailView> implements MvcController {
  static late DetailController instance;
  late DetailView view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  String title = "";
  double price = 0;
  String description = "";
  String category = "";
  String image = "";

  getDetail(int id) async {
    var response = await Dio().get(
      "https://fakestoreapi.com/products/$id",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    if (mounted) {
      Map obj = response.data;
      title = obj['title'];
      price = obj['price'];
      description = obj['description'];
      category = obj['category'];
      image = obj['image'];
      setState(() {});
    }
  }
}
