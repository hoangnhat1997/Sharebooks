import 'package:flutter/material.dart';

class ShowDialog extends StatelessWidget {
  final String err;
  const ShowDialog(
    this.err, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(err),
          ],
        ),
      ),
      actions: <Widget>[
        MaterialButton(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          color: Colors.blue,
          child: const Text(
            'Ok',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
