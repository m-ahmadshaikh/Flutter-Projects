import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;
  RoundIconButton({@required this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon),
        onPressed: () {
          onPress();
        },
        elevation: 0,
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
        constraints: BoxConstraints.tightFor(
          width: 53.0,
          height: 53.0,
        ));
  }
}
