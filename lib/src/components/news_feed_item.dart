import 'package:flutter/material.dart';
import 'package:extended_image/extended_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NewsFeedItem extends StatelessWidget {
  final QueryDocumentSnapshot<Map<String, dynamic>> itemData;

  const NewsFeedItem(
    this.itemData, {
    super.key,
  });
  double? get screenWidth => WidgetsBinding.instance.window.physicalSize.width;

  double? get screenHeight =>
      WidgetsBinding.instance.window.physicalSize.height;
  @override
  Widget build(BuildContext context) {
    print(itemData);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 1.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
                width: 30,
                child: ExtendedImage.network(
                  itemData.data()['posterUrl'],
                  fit: BoxFit.cover,
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(itemData.data()['user'].toString()),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
          child: Text(itemData.data()['postContent'].toString()),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ExtendedImage.network(
            itemData.data()['postImage'],
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: IconButton(
                icon: const Icon(Icons.heart_broken_sharp),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 20,
              width: 20,
              child: IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {},
              ),
            ),
            SizedBox(
              height: 20,
              width: 20,
              child: IconButton(
                icon: const Icon(Icons.message),
                onPressed: () {},
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 35.0, right: 35.0, top: 10),
                child: const Divider(
                  color: Colors.black,
                  height: 36,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
