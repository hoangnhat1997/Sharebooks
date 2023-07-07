import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

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

  Future<void> onGooglePayResult(paymentResult) async {
    final response = await fetchPaymentIntentClientSecret();
    final clientSecret = response['clientSecret'];
    final token =
        paymentResult['paymentMethodData']['tokenizationData']['token'];
    final tokenJson = Map.castFrom(json.decode(token));

    // final params = PaymentMethodParams.cardFromToken(
    //   token: tokenJson['id'],
    //   paymentMethodData: Card,
    // );
    // // Confirm Google pay payment method
    // await Stripe.instance.confirmPayment(
    //   data: params,
    //   paymentIntentClientSecret: '',
    // );
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
