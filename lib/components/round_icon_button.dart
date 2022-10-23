import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({required this.icon, required this.onClick, Key? key})
      : super(key: key);
  final IconData? icon;
  final VoidCallback? onClick;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onClick,
      fillColor: const Color(0xFF4C4F5E),
      shape: const CircleBorder(),
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      child: Icon(icon),
    );
  }
}
