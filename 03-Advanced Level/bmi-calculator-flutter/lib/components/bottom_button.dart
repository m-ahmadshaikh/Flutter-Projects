import 'package:flutter/material.dart';
import '../constants.dart';
import 'reusable_card.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  BottomButton({@required this.text, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBottomContainerColor,
      width: double.infinity,
      height: kButtonContainerHeight,
      margin: EdgeInsets.only(top: 10),
      // padding: EdgeInsets.only(bottom: 10),
      child: Center(
        child: ReusableCard(
            color: kBottomContainerColor,
            cardChild: Text(
              text,
              style: kBottomButtonFont,
            ),
            onPress: onPressed),
      ),
    );
  }
}
