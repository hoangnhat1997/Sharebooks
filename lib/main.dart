import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:sharebooks_app/src/app.dart';
import 'package:sharebooks_app/.env';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Stripe.publishableKey = stripePublishableKey;
  await Stripe.instance.applySettings();

  await Hive.initFlutter();

  await Firebase.initializeApp();

  runApp(const ShareBooksApp());
}
