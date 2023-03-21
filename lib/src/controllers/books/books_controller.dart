import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BooksController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final RxList<QueryDocumentSnapshot<Map<String, dynamic>>> dataBooksCategory =
      RxList<QueryDocumentSnapshot<Map<String, dynamic>>>.empty();
  final RxList<QueryDocumentSnapshot<Map<String, dynamic>>> dataPostBooks =
      RxList<QueryDocumentSnapshot<Map<String, dynamic>>>.empty();

  @override
  void onReady() {
    super.onReady();
    getBooksCategory();
    getPostBooks();
  }

  Future getBooksCategory() async {
    try {
      await firestore
          .collection('booksCategory')
          .get()
          .then((value) => dataBooksCategory.addAll(value.docs));
    } catch (e) {
      await EasyLoading.showError('Failed with Error');
    } finally {}
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
