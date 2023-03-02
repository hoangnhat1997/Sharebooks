import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class PostBookScreen extends StatelessWidget {
  const PostBookScreen({super.key});

  double? get screenWidth => WidgetsBinding.instance.window.physicalSize.width;
  double? get screenHeight =>
      WidgetsBinding.instance.window.physicalSize.height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Post Book',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Get.offNamed('/main'),
            color: Colors.black,
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    width: 150,
                    child: ExtendedImage.network(
                      'https://cdn.britannica.com/36/178136-050-7F77D46B/village-Alpine-valley-canton-Saint-Moritz-Engadin.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10),
              child: const Text('Post Book'),
            )
          ],
        ),
      ),
    );
  }
}
