import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BookDetailsController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final RxList<QueryDocumentSnapshot<Map<String, dynamic>>> dataPostBooks =
      RxList<QueryDocumentSnapshot<Map<String, dynamic>>>.empty();
  final RxBool favourite = RxBool(false);

  @override
  void onReady() {
    super.onReady();
    getPostBooks();
  }

  fetchPaymentIntentClientSecret() {}

  void toggleFavourite() {
    favourite.value = !favourite.value;
    print(favourite.value);
  }

  Future getPostBooks() async {
    try {
      await firestore
          .collection('postBooks')
          .get()
          .then((value) => dataPostBooks.addAll(value.docs));
    } catch (e) {
      await EasyLoading.showError('Failed with Error');
    } finally {}
  }
}
