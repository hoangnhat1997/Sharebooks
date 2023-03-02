import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class TypeBook extends StatelessWidget {
  const TypeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0),
      height: 140,
      width: 240,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ExtendedImage.network(
          'https://blog-cdn.reedsy.com/directories/admin/featured_image/541/amazon-book-promotion-001f5d.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
