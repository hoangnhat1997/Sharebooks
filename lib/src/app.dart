import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:sharebooks_app/src/controllers/controllers.dart';
import 'package:sharebooks_app/src/controllers/postBook/postBook_controller.dart';
import 'package:sharebooks_app/src/screens/postBook/postBook_screen.dart';
import 'package:sharebooks_app/src/screens/screens.dart';

class ShareBooksApp extends StatelessWidget {
  const ShareBooksApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      theme: ThemeData(),
      initialRoute: '/',
      initialBinding: BindingsBuilder.put(() => AppController()),
      getPages: <GetPage>[
        GetPage(
          name: '/',
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: '/login',
          page: () => const LoginScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(LoginController());
            },
          ),
        ),
        GetPage(
          name: '/register',
          page: () => const RegisterScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(RegisterController());
            },
          ),
        ),
        GetPage(
          name: '/main',
          page: () => const MainScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(MainController());
              Get.put(HomeController());
              Get.put(ProfileController());
            },
          ),
        ),
        GetPage(
          name: '/home',
          page: () => const HomeScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(HomeController());
            },
          ),
        ),
        GetPage(
          name: '/proflie',
          page: () => const ProfileScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(ProfileController());
            },
          ),
        ),
        GetPage(
          name: '/post',
          page: () => const PostScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(PostController());
            },
          ),
        ),
        GetPage(
          name: '/postBook',
          page: () => const PostBookScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(PostBookController());
            },
          ),
        )
      ],
    );
  }
}
