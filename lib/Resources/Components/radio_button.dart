import 'package:flutter/material.dart';

import '../../Resources/Constants/global_variables.dart';

class CustomRadioButton extends StatelessWidget {
  Axis? direction;
  final String label;
  bool value;
  final Color textColor;
  Function callBack;
  CustomRadioButton(
      {super.key,
      required this.value,
      required this.label,
      required this.textColor,
      required this.callBack,
      this.direction = Axis.vertical});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callBack();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Flex(
          direction: direction!,
          mainAxisSize: direction == Axis.horizontal
              ? MainAxisSize.max
              : MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: TextStyle(color: textColor),
            ),
            const SizedBox(height: 0, width: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              decoration: BoxDecoration(
                  color: AppColors.kTextFormWhiteColor,
                  borderRadius: BorderRadius.circular(kDefaultPadding)),
              child: Icon(
                value == true
                    ? Icons.check_circle
                    : Icons.radio_button_unchecked,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
