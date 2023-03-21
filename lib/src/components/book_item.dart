import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookItem extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> itemData;

  const BookItem(
    this.itemData, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15.0, top: 15.0, right: 15.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 120,
            child: AspectRatio(
              aspectRatio: 3 / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: ExtendedImage.network(
                  itemData.data()['postBookImage'],
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 15, left: 30),
                  child: Text(
                    itemData.data()['postNameBook'],
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15, left: 30.0),
                  child: Text(
                    itemData.data()['postBookCategory'],
                    style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20, left: 30),
                  child: Text(
                    "Sharing by " + itemData.data()['user'],
                    style: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
