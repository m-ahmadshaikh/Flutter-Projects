import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final cardChild;
  final Function onPress;

  ReusableCard({@required this.color, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onPress,
        child: Container(
          child: cardChild,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: this.color,
          ),
          margin: EdgeInsets.all(15),
        ));
  }
}
