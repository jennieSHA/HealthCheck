import 'package:flutter/material.dart';

class BodyParts extends StatelessWidget {
  List<String> bodyPart = [
    "Head",
    "Eye",
    "Depression",
    "Throat",
    "Hearing",
    "Muscle Pain",
    "Mouth",
    "Teeth",
    "Skin",
    "Pain",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12.0),
        child: GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: bodyPart.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4.0, mainAxisSpacing: 4.0),
          itemBuilder: (BuildContext context, int index) {
            return Card(
                color: Colors.lightGreen,
                child: Center(
                    child: Text(
                  bodyPart[index],
                  style: TextStyle(fontSize: 25),
                )));
          },
        ));
  }
}
