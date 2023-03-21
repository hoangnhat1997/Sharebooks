import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';

class TypeBook extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> itemData;

  const TypeBook(
    this.itemData, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 15.0),
          height: 140,
          width: 240,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ExtendedImage.network(
              itemData.data()['categoryImage'],
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Text(
            itemData.data()['categoryName'],
            style: const TextStyle(
                fontFamily: AutofillHints.birthday,
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Colors.blueAccent),
          ),
        )
      ],
    );
  }
}
