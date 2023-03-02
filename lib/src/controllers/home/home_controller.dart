import 'dart:io';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';

import '../app_controller.dart';

class HomeController extends GetxController {
  final AppController appController = Get.find<AppController>();
  final storageRef = FirebaseStorage.instance.ref();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final RxList<QueryDocumentSnapshot<Map<String, dynamic>>> dataDocs =
      RxList<QueryDocumentSnapshot<Map<String, dynamic>>>.empty();

  final Rxn<File> file = Rxn<File>();
  @override
  void onReady() {
    localStore();
    getStatusData();

    super.onReady();
  }

  Future localStore() async {
    var box = await Hive.openBox('testBox');
  }

  Future getStatusData() async {
    try {
      await firestore
          .collection('posts')
          .get()
          .then((value) => dataDocs.addAll(value.docs));
    } catch (e) {
      await EasyLoading.showError('Failed with Error');
    } finally {}
  }
}
