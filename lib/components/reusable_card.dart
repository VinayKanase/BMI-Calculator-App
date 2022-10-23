import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Color? colour;
  final Widget? cardChild;
  final VoidCallback? onPress;
  const ReuseableCard(
      {Key? key, required this.colour, this.cardChild, this.onPress})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChild,
      ),
    );
  }
}
