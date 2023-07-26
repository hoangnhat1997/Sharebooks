import 'dart:io';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class ProfileController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final storageRef = FirebaseStorage.instance.ref();

  final Rxn<File> file = Rxn<File>();
  final RxnString avatarUrl = RxnString('');

  @override
  void onReady() {
    super.onReady();
    avatarUrl.value = auth.currentUser!.photoURL;
  }

  Future selectAvatar() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      if (result != null) {
        file.value = File(result.files.first.path!);
        await EasyLoading.show(status: 'loading...');
        await uploadAvatar();
        await EasyLoading.dismiss();
      } else {
        print('Nothing any picture');
      }
    } catch (e) {
      await EasyLoading.showError('Failed with Error');
      print(e);
    } finally {}
  }

  Future uploadAvatar() async {
    final path = 'avatar/${file.value!.path.split('/').last}';
    final storageRef = FirebaseStorage.instance.ref().child(path);
    await storageRef.putFile(file.value!);
    final String url = await storageRef.getDownloadURL();
    await auth.currentUser!.updatePhotoURL(url);
    avatarUrl.value = url;
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offNamed('/login');
    } catch (e) {
      print(e);
    }
  }
}
