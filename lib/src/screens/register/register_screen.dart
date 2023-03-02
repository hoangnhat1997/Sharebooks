import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sharebooks_app/src/controllers/register/register_controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 5),
            height: 130,
            child: Center(
              child: Text(
                'Sharebooks',
                style: TextStyle(
                  fontSize: 40,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 4
                    ..color = Colors.blue[700]!,
                ),
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 5, bottom: 5, left: 25, right: 25),
            child: TextField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.blueGrey),
                hintText: 'Username',
              ),
              onChanged: (String val) {
                controller.fullname.value = val;
              },
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 5, bottom: 5, left: 25, right: 25),
            child: TextField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.blueGrey),
                hintText: 'Email',
              ),
              onChanged: (String val) {
                controller.email.value = val;
              },
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 15, bottom: 5, left: 25, right: 25),
            child: TextField(
              decoration: const InputDecoration(
                hintStyle: TextStyle(color: Colors.blueGrey),
                hintText: 'Password',
              ),
              onChanged: (String val) {
                controller.password.value = val;
              },
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 15, bottom: 5, left: 25, right: 25),
            child: ElevatedButton(
              onPressed: () => {controller.registerUser()},
              child: const Text('Register'),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 5, bottom: 5, left: 25, right: 25),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 36,
                      )),
                ),
                const Text('OR'),
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: const Divider(
                        color: Colors.black,
                        height: 36,
                      )),
                ),
              ],
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 15, bottom: 5, left: 40, right: 40),
            child: ElevatedButton(
              style: const ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.green)),
              onPressed: () => {Get.offNamed('/login')},
              child: const Text('Login Sharebooks'),
            ),
          ),
        ],
      ),
    );
  }
}
