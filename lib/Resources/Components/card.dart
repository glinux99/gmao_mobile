import 'package:flutter/material.dart';

import '../../Resources/Components/texts.dart';
import '../../Resources/Constants/global_variables.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final Widget content;
  double? elevation = 0;
  Color? backColor = AppColors.kScaffoldColor;
  Color? titleColor = AppColors.kBlackColor;
  final dynamic actions;
  CardWidget(
      {super.key,
      required this.title,
      this.elevation = 0,
      required this.content,
      this.backColor,
      this.actions,
      this.titleColor});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Card(
        elevation: elevation,
        color: backColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        // elevation: 4,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        // color: AppColors.kWhiteColor.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.all(16.0),
                    child: TextWidgets.textBold(
                        title: title,
                        fontSize: 16,
                        textColor: titleColor ?? AppColors.kBlackColor),
                  ),
                ),
                actions ?? const Text(""),
              ],
            ),
            SizedBox(
              width: double.maxFinite,
              child: content,
            ),
          ],
        ),
      ),
    );
  }
}
