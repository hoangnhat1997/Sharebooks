import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() async {
    super.onReady();

    await 2.delay();
    if (auth.currentUser != null) {
      Get.offNamed('/main');
      print(auth.currentUser);
    } else {
      Get.offNamed('/login');
    }
  }
}
