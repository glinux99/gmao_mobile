import '../../Resources/Constants/global_variables.dart';
import 'package:flutter/material.dart';

class ModalProgress extends StatelessWidget {
  final Widget child;
  Color? progressColor = AppColors.kPrimaryColor;
  final bool isAsync;
  ModalProgress(
      {super.key,
      required this.child,
      this.progressColor,
      required this.isAsync});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kTransparentColor,
      body: child,
    );
  }
}
