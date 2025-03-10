import 'package:flutter/material.dart';

import '../../../Resources/Constants/global_variables.dart';

class ProgressWidget extends StatefulWidget {
  const ProgressWidget({super.key});

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animCtrller;
  // final animation = Tween(begin: 0, end: 100).animate(_animCtrller);
  @override
  void initState() {
    super.initState();
    // _animCtrller = AnimationController(
    //     vsync: this, duration: const Duration(milliseconds: 100))
    //   // ..addListener(() {
    //   //   // setState(() {});
    //   // })
    //   ..addStatusListener((status) {
    //     if (status == AnimationStatus.completed) {
    //       _animCtrller.reverse();
    //     } else if (status == AnimationStatus.dismissed) {
    //       _animCtrller.forward();
    //     }
    //   });

    // _animCtrller.forward();
  }

  @override
  void dispose() {
    _animCtrller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 10,
      child: LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.kPrimaryColor),
        value: _animCtrller.value,
        backgroundColor: Colors.transparent,
        // strokeWidth: 8,
      ),
    );
  }
}
