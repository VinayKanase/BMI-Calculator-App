import 'package:flutter/material.dart';
import '../constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconContent({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          text,
          style: kTextStyle,
        ),
      ],
    );
  }
}
