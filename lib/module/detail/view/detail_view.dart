import 'package:flutter/material.dart';
import 'package:store_app_v1/core.dart';
import '../controller/detail_controller.dart';

class DetailView extends StatefulWidget {
  int id;
  DetailView({Key? key, required this.id}) : super(key: key);

  Widget build(context, DetailController controller) {
    controller.view = this;
    controller.getDetail(id);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail'),
          centerTitle: true,
        ),
        body: controller.image == ""
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: SizedBox(
                        width: width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 250.0,
                              width: width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(controller.image),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.title,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Text(
                                    controller.category,
                                    style: const TextStyle(
                                      fontSize: 10.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Text(
                                    "\$${controller.price}",
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  Text(
                                    controller.description,
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    left: 10,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(width, 60),
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Pesan",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                ],
              ));
  }

  @override
  State<DetailView> createState() => DetailController();
}
