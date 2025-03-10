import 'package:flutter/material.dart';

class CustomForms extends CustomClipper {
  double? left, right, top, bottom;
  CustomForms({this.left = 1, this.right = 1, this.bottom = 1, this.top = 1});
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.moveTo(top!, size.height / bottom!);
    path.lineTo(size.width / left!, size.width / right!);
    path.lineTo(size.width / right!, size.height / top!);
    path.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
    // TODO: implement shouldRepaint
    // throw UnimplementedError();
  }

  @override
  getClip(Size size) {
    // TODO: implement getClip
    throw UnimplementedError();
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return false;
    // TODO: implement shouldReclip
    // throw UnimplementedError();
  }
}
