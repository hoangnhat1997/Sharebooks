import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:extended_image/extended_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../controllers/controllers.dart';

class BookDetailsScreen extends GetView<BookDetailsController> {
  BookDetailsScreen({super.key});

  double? get screenWidth => WidgetsBinding.instance.window.physicalSize.width;
  double? get screenHeight =>
      WidgetsBinding.instance.window.physicalSize.height;
  final QueryDocumentSnapshot<Map<String, dynamic>> itemData = Get.arguments;

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
                  Container(
                    alignment: Alignment.centerLeft,
                    width: (0.1 * screenWidth!).toDouble(),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios_new),
                      onPressed: () {
                        Get.offNamed('/main');
                      },
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'Book Details',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),
                      ),
                    ),
                  ),
                  Container(
                    width: (0.1 * screenWidth!).toDouble(),
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 10.0),
                alignment: Alignment.center,
                child: SizedBox(
                  height: 240,
                  width: 170,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: ExtendedImage.network(
                      itemData.data()['postBookImage'],
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 35.0),
                alignment: Alignment.center,
                child: Text(
                  itemData.data()['postNameBook'],
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25.0, top: 35.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Caterogy: ${itemData.data()['postBookCategory']}',
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.red),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 25.0),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25.0, top: 25.0),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Description',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25.0, top: 15.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  itemData.data()['postBookDescription'],
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 25.0, top: 25.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Sharing by ${itemData.data()['user']}',
                  style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0))),
                      height: 45,
                      width: 55,
                      child: GestureDetector(
                        child: controller.favourite.value
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                              ),
                        onTap: () {
                          controller.toggleFavourite();
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 40.0,
                      width: (0.20 * screenWidth!).toDouble(),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 59, 235, 255),
                            Color.fromARGB(255, 99, 174, 255),
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                      child: GestureDetector(
                        onTap: () => {},
                        child: Text(
                          'Receiving',
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                              letterSpacing: .5,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
