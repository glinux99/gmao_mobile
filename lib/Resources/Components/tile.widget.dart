import 'package:flutter/material.dart';

import '../Constants/global_variables.dart';
import 'texts.dart';

class TileWidget extends StatelessWidget {
  final String title;
  String? description;
  Function callback;
  IconData? icon, trailingIcon;
  TileWidget(
      {super.key,
      required this.title,
      this.description,
      required this.callback,
      this.icon,
      this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: AppColors.kBlackColor.withOpacity(0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            if (icon != null)
              Card(
                  elevation: 0,
                  color: AppColors.kBlackColor.withOpacity(0.05),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(500)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(icon, size: 48, color: AppColors.kBlackColor),
                  )),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidgets.textBold(
                      title: title,
                      fontSize: 18,
                      textColor: AppColors.kBlackColor),
                  const SizedBox(height: 16),
                  TextWidgets.text300(
                      title: description ?? '',
                      fontSize: 14,
                      textColor: AppColors.kBlackColor.withOpacity(0.6)),
                ],
              ),
            ),
            if (trailingIcon != null)
              Icon(trailingIcon, color: AppColors.kPrimaryColor, size: 32),
          ],
        ),
      ),
    );
  }
}
