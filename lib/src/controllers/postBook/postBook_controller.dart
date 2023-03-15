import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../controllers.dart';

class PostBookController extends GetxController {
  final AppController appController = Get.find<AppController>();

  final RxList<String> items = RxList<String>(
      ['Self Help', 'Science Fiction', 'Love Story', 'Art', 'Novel']);
  final RxString selectedValue = RxString('Self Help');
  final RxString description = RxString('');
  final RxString name = RxString('');

  final storageRef = FirebaseStorage.instance.ref();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final Rxn<File> file = Rxn<File>();

  Future createPost() async {
    try {
      final post = <String, dynamic>{
        'user': appController.auth.currentUser!.displayName,
        'postBookDescription': description.value,
        'postBookCategory': selectedValue.value,
        'postNameBook': name.value,
        'postBookImage': '',
      };
      final DocumentReference<Map<String, dynamic>> doc =
          await firestore.collection('postBooks').add(post);

      // final path = 'postsImage/${file.value!.path.split('/').last}';
      // final storageRef = FirebaseStorage.instance.ref().child(path);
      // await storageRef.putFile(file.value!);
      // final String url = await storageRef.getDownloadURL();

      // await firestore
      //     .collection('postBooks')
      //     .doc(doc.id)
      //     .update({'postImage': url});
    } catch (e) {
      await EasyLoading.showError('Failed with Error');
    } finally {
      Get.offNamed('/main');
    }
  }
}
