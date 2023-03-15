import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sharebooks_app/src/components/components.dart';

import 'package:sharebooks_app/src/controllers/controllers.dart';
import 'package:sharebooks_app/src/screens/screens.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: Builder(
          builder: (BuildContext context) {
            switch (controller.currentIndex.value) {
              case 0:
                return const HomeScreen();
              case 2:
                return const BooksScreen();
              case 3:
                return const ProfileScreen();
              default:
                return const HomeScreen();
            }
          },
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.8,
              ),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            elevation: 0.0,
            backgroundColor: Colors.white,
            unselectedFontSize: 12.0,
            selectedFontSize: 12.0,
            currentIndex: controller.currentIndex.value,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Share',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Books',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
            onTap: (int index) {
              if (index == 1) {
                onSelectPostBottomSheet(context);
                return;
              }
              controller.currentIndex.value = index;
            },
          ),
        ),
      ),
    );
  }
}
