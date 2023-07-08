import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

import 'package:sharebooks_app/src/components/components.dart';
import 'package:sharebooks_app/src/controllers/controllers.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(top: 45, bottom: 0, left: 15.0),
              height: 30,
              child: Text(
                'Sharebooks',
                style: TextStyle(
                  fontSize: 25,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 3
                    ..color = Colors.blue[700]!,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, bottom: 5.0, top: 10.0),
              child: Row(
                children: [
                  controller.appController.auth.currentUser!.photoURL != null
                      ? SizedBox(
                          height: 40,
                          width: 40,
                          child: ExtendedImage.network(
                            controller
                                .appController.auth.currentUser!.photoURL!,
                            fit: BoxFit.cover,
                            shape: BoxShape.circle,
                          ),
                        )
                      : SizedBox(
                          height: 40,
                          width: 40,
                          child: Image.asset('assets/images/no_avatar.png'),
                        ),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        padding: const EdgeInsets.only(left: 10),
                        height: 35,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black26),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: const Text('Your thinking...'),
                      ),
                      onTap: () => Get.offNamed('/post'),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.image),
                    onPressed: () {
                      Get.offNamed('/post');
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 10.0),
                itemCount: controller.dataDocs.length,
                itemBuilder: (BuildContext context, int index) =>
                    NewsFeedItem(controller.dataDocs[index]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
