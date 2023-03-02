import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final RxString fullname = RxString('');
  final RxString email = RxString('');
  final RxString password = RxString('');

  Future<void> registerUser() async {
    try {
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      await userCredential.user!.updateDisplayName(fullname.value);

      Get.offNamed('/main');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
