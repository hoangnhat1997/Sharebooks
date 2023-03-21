import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sharebooks_app/src/controllers/postBook/post_book_controller.dart';

class PostBookScreen extends GetView<PostBookController> {
  const PostBookScreen({super.key});

  double? get screenWidth => WidgetsBinding.instance.window.physicalSize.width;
  double? get screenHeight =>
      WidgetsBinding.instance.window.physicalSize.height;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios_new),
                    onPressed: () {
                      Get.offNamed('/main');
                    },
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Post Book',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                        onPressed: () => {controller.createPost()},
                        child: const Text('Post')),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 10.0),
                alignment: Alignment.center,
                child: SizedBox(
                  height: 240,
                  width: 170,
                  child: controller.file.value != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.file(
                            controller.file.value!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1.5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          height: 100,
                          width: 100,
                          child: IconButton(
                            icon: const Icon(
                              Icons.add,
                              size: 30.0,
                            ),
                            onPressed: () {
                              controller.selectPostBook();
                            },
                          ),
                        ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25.0, top: 35.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Book\'s Name',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 25, right: 25),
                child: TextField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    hintText: 'Name is ',
                  ),
                  onChanged: (String val) {
                    controller.name.value = val;
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25.0, top: 15.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Caterogy',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 25.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: Text(
                      'Select Item',
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: controller.items.value
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: controller.selectedValue.value,
                    onChanged: (value) {
                      controller.selectedValue.value = value as String;
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25.0, top: 15.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Description',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: 5, bottom: 5, left: 25, right: 25),
                child: TextField(
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.blueGrey),
                    hintText: 'Description',
                  ),
                  onChanged: (String val) {
                    controller.description.value = val;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
