import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharebooks_app/src/components/components.dart';
import 'package:sharebooks_app/src/controllers/controllers.dart';

class BooksScreen extends GetView<BooksController> {
  const BooksScreen({super.key});

  double get widthAxis => 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 20, bottom: 5, left: 40.0),
            height: 30,
            child: Text(
              'Books',
              style: TextStyle(
                fontSize: 25,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 3
                  ..color = Colors.blue[700]!,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5.0),
            height: 140,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => const TypeBook()),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 20.0, left: 10),
            child: const Text(
              'Daily recommendation',
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            height: 140,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => const BookItem()),
          ),
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(top: 20.0, left: 10),
            child: const Text(
              'Your Favourite',
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0, bottom: 10.0),
            height: 140,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) => const BookItem()),
          ),
        ],
      ),
    );
  }
}
