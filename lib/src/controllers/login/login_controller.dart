import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../components/components.dart';

class LoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final RxString email = RxString('');
  final RxString password = RxString('');

  Future<void> _showMyDialog(String err) async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return ShowDialog(err);
      },
    );
  }

  Future<void> loginUser() async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      Get.offNamed('/main');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _showMyDialog('No user found for that email.');
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        _showMyDialog('Wrong password provided for that user.');
        print('Wrong password provided for that user.');
      }
    }
  }
}
