import 'package:extended_image/extended_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0),
      height: 140,
      width: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ExtendedImage.network(
          'https://m.media-amazon.com/images/I/51n3tKAbgxL._AC_SY780_.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
