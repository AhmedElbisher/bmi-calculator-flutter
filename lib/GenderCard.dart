import 'package:flutter/material.dart';

import 'Constants.dart';

class GenderCard extends StatelessWidget {
  GenderCard({this.genderIcon, this.genderString});
  final String genderString;
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 40,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          genderString,
          style: KNormalTextStyle,
        )
      ],
    );
  }
}
