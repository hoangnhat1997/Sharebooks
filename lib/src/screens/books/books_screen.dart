import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharebooks_app/src/components/components.dart';
import 'package:sharebooks_app/src/controllers/controllers.dart';

class BooksScreen extends GetView<BooksController> {
  const BooksScreen({super.key});

  double get widthAxis => 0;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 50, bottom: 10, left: 40.0),
              height: 30,
              child: Text(
                'Books',
                style: TextStyle(
                  fontSize: 25,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..color = Colors.blue[700]!,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              height: 180,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.dataBooksCategory.length,
                  itemBuilder: (context, index) =>
                      TypeBook(controller.dataBooksCategory[index])),
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 25.0, left: 10, bottom: 10.0),
              child: const Text(
                'Sharing Book',
                style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 140,
                child: ListView.builder(
                    padding: const EdgeInsets.only(top: 5.0),
                    itemCount: controller.dataPostBooks.length,
                    itemBuilder: (context, index) =>
                        BookItem(controller.dataPostBooks[index])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
