import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

import 'package:sharebooks_app/src/controllers/controllers.dart';

class PostScreen extends GetView<PostController> {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            'Create post',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Get.offNamed('/main'),
            color: Colors.black,
          ),
          actions: <Widget>[
            Container(
              margin: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () => {controller.createPost()},
                style: controller.statusContent.value != '' ||
                        controller.file.value != null
                    ? const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.blue),
                      )
                    : const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.black26),
                      ),
                child: const Text('Post'),
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, bottom: 20.0, top: 10.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 45,
                    width: 45,
                    child: ExtendedImage.network(
                      controller.appController.auth.currentUser!.photoURL!,
                      fit: BoxFit.cover,
                      shape: BoxShape.circle,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      controller.appController.auth.currentUser!.displayName!,
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.only(left: 10),
                height: 30,
                child: TextField(
                  decoration: const InputDecoration.collapsed(
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 146, 204, 233),
                        fontSize: 20.0),
                    hintText: 'Your thinking...',
                  ),
                  style: const TextStyle(fontSize: 18.0),
                  onChanged: (String val) {
                    controller.statusContent.value = val;
                  },
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20.0, bottom: 20.0),
              alignment: Alignment.centerLeft,
              height: 50,
              child: controller.file.value != null
                  ? Image.file(controller.file.value!)
                  : Container(),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(bottom: 40.0, left: 30.0),
              child: IconButton(
                icon: const Icon(
                  Icons.image,
                  size: 35.0,
                ),
                onPressed: () {
                  controller.selectAvatar();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
