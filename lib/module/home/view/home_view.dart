import 'package:flutter/material.dart';
import 'package:store_app_v1/core.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget build(context, HomeController controller) {
    controller.view = this;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Store apps"),
          centerTitle: true,
        ),
        drawer: drawer(context, controller),
        body: SizedBox(
          height: height,
          width: width,
          child: controller.listData.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.listData.length,
                  itemBuilder: (context, index) {
                    final data = controller.listData[index];
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => DetailView(id: data['id'])));
                        },
                        child: cardItem(data));
                  },
                ),
        ));
  }

  @override
  State<HomeView> createState() => HomeController();
}
