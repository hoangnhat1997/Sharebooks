import 'dart:io';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../app_controller.dart';

class PostController extends GetxController {
  final AppController appController = Get.find<AppController>();
  final storageRef = FirebaseStorage.instance.ref();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final RxString statusContent = RxString('');
  final Rxn<File> file = Rxn<File>();

  Future selectAvatar() async {
    try {
      final result = await FilePicker.platform.pickFiles(allowMultiple: true);

      if (result != null) {
        file.value = File(result.files.first.path!);
        await EasyLoading.show(status: 'loading...');

        await EasyLoading.dismiss();
      } else {
        print('Nothing any picture');
      }
    } catch (e) {
      await EasyLoading.showError('Failed with Error');
      print(e);
    } finally {}
  }

  Future createPost() async {
    try {
      final post = <String, dynamic>{
        'user': appController.auth.currentUser!.displayName,
        'postContent': statusContent.value,
        'postImage': '',
        'posterUrl': appController.auth.currentUser!.photoURL,
      };
      final DocumentReference<Map<String, dynamic>> doc =
          await firestore.collection('posts').add(post);

      final path = 'postsImage/${file.value!.path.split('/').last}';
      final storageRef = FirebaseStorage.instance.ref().child(path);
      await storageRef.putFile(file.value!);
      final String url = await storageRef.getDownloadURL();

      await firestore
          .collection('posts')
          .doc(doc.id)
          .update({'postImage': url});
    } catch (e) {
      await EasyLoading.showError('Failed with Error');
    } finally {
      Get.offNamed('/main');
    }
  }
}
