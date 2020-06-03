import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  RoundButton({@required this.icon, @required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(width: 44.0, height: 44.0),
      fillColor: Color(0x29827F8E),
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
    );
  }
}
