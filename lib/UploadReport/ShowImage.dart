import 'package:flutter/material.dart';

class ShowImage extends StatelessWidget {
  ShowImage({this.image});

  String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1,
      child: Image(
        image: NetworkImage(image),
        fit: BoxFit.fill,
      ),
    );
  }
}
