import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
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
          child: BottomNavyBar(
            showElevation: true,
            selectedIndex: controller.currentIndex.value,
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: const Icon(Icons.home),
                title: const Text('Home'),
              ),
              BottomNavyBarItem(
                icon: const Icon(Icons.add),
                title: const Text('Share'),
                activeColor: Colors.pinkAccent,
              ),
              BottomNavyBarItem(
                icon: const Icon(Icons.book),
                title: const Text('Books'),
              ),
              BottomNavyBarItem(
                icon: const Icon(Icons.person),
                title: const Text('Profile'),
                activeColor: Colors.black87,
              ),
            ],
            onItemSelected: (index) {
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
