import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:extended_image/extended_image.dart';

import 'package:sharebooks_app/src/controllers/controllers.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  double? get screenWidth => WidgetsBinding.instance.window.physicalSize.width;
  double? get screenHeight =>
      WidgetsBinding.instance.window.physicalSize.height;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: ListView(
          children: [
            Stack(
              children: <Widget>[
                SizedBox(
                  height: 180,
                  width: screenWidth,
                  child: ExtendedImage.network(
                    'https://cdn.britannica.com/36/178136-050-7F77D46B/village-Alpine-valley-canton-Saint-Moritz-Engadin.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 3.0),
                      borderRadius: BorderRadius.circular(60)),
                  margin: const EdgeInsets.only(top: 100, left: 20),
                  child: controller.avatarUrl.value != null
                      ? Stack(
                          children: [
                            SizedBox(
                              height: 115,
                              width: 115,
                              child: ExtendedImage.network(
                                controller.avatarUrl.value!,
                                fit: BoxFit.cover,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 90,
                              child: SizedBox(
                                height: 22,
                                width: 22,
                                child: GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Icon(
                                      Icons.camera_alt,
                                      size: 16.0,
                                    ),
                                  ),
                                  onTap: () => controller.selectAvatar(),
                                ),
                              ),
                            )
                          ],
                        )
                      : Stack(
                          children: <Widget>[
                            SizedBox(
                              height: 115,
                              width: 115,
                              child: Image.asset('assets/images/no_avatar.png'),
                            ),
                          ],
                        ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                left: 60.0,
                right: 40.0,
              ),
              child: Text(
                ' ${controller.auth.currentUser!.displayName}',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(
                  left: 60.0, right: 40.0, top: 5, bottom: 10.0),
              child: Text(
                '${controller.auth.currentUser!.email}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: const <Widget>[
                    Text(
                      'Posted',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '7',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const <Widget>[
                    Text(
                      'Shared',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '22',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: const <Widget>[
                    Text(
                      'Followed',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '112',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 15.0, top: 20, bottom: 5.0),
              child: const Text(
                'About',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 15, right: 15),
              child: const Text(
                'You can build apps with Flutter using any text editor combined with Flutter’s command-line tools. However, we recommend using one of our editor plugins for an even better experience. These plugins provide you with code completion, syntax highlighting, widget editing assists, run & debug support, and more.',
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 60.0, right: 60.0, top: 100),
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                ),
                onPressed: () => {controller.signOut()},
                child: const Text('Sign Out'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
