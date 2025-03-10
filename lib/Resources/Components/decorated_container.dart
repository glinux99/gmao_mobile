import 'package:flutter/material.dart';

class DecoratedContainer extends StatelessWidget {
  Color? backColor;
  final Widget child;

  DecoratedContainer(
      {super.key, this.backColor = Colors.grey, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: backColor,
      ),
      child: child,
    );
  }
}
