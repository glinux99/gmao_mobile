import 'package:flutter/material.dart';

import '../../../Resources/Components/texts.dart';
import '../../../Resources/Constants/responsive.dart';

class AppBarWidget extends StatelessWidget {
  final Color backColor, textColor;
  String? title;
  IconData? icon;
  List<Widget>? actions;
  AppBarWidget(
      {super.key,
      required this.backColor,
      required this.textColor,
      this.title = "",
      this.icon = Icons.arrow_back_ios,
      this.actions = const []});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(double.maxFinite, 120),
      child: Container(
        padding: EdgeInsets.only(
            top: Responsive.isWeb(context) ? 32 : 64,
            left: 16,
            right: 16,
            bottom: 16),
        decoration: BoxDecoration(color: backColor),
        child: Row(
          children: [
            if (!Responsive.isWeb(context))
              GestureDetector(
                  onTap: () {
                    if (icon == Icons.menu) {
                      // print('opening drawer');
                      Scaffold.of(context).openDrawer();
                      return;
                    }
                    Navigator.pop(context);
                  },
                  child: Icon(icon!, color: textColor, size: 30)),
            if (!Responsive.isWeb(context))
              const SizedBox(
                width: 16,
              ),
            TextWidgets.textBold(
                title: title!, fontSize: 24, textColor: textColor),
            ...actions!
          ],
        ),
      ),
    );
  }
}
