import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

void onSelectPostBottomSheet(context) {
  showMaterialModalBottomSheet(
    useRootNavigator: true,
    expand: false,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => SizedBox(
      height: 150,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        // color: Colors.white,
        child: Column(
          children: <Widget>[
            ListTile(
              title: const Text('Your thinking... '),
              onTap: () => Get.offNamed('/post'),
            ),
            ListTile(
              title: const Text('Share your book'),
              onTap: () => Get.offNamed('/postBook'),
            ),
          ],
        ),
      ),
    ),
  );
}
