import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final Size size;
  const AppLogo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.zero,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(1000),
          child: Container() // Image.asset("Assets/Images/logo_h_black.png"),
          ),
    );
  }
}

class DisplayImage extends StatelessWidget {
  final Size size;
  final String imagePath;
  final double radius;
  const DisplayImage(
      {super.key,
      required this.size,
      required this.imagePath,
      required this.radius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: Image.asset(imagePath),
      ),
    );
  }
}
