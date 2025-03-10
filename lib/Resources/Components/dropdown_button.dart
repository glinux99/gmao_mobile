import 'package:flutter/material.dart';

import '../../Resources/Constants/global_variables.dart';

class CustomDropdownButton extends StatelessWidget {
  final String hintText;
  String? value;
  final List items;
  Function callBack;
  Color? textColor = AppColors.kWhiteColor.withOpacity(0.7);
  Color? dropdownColor = AppColors.kBlackLightColor;
  Color? backColor = AppColors.kTextFormWhiteColor;
  bool? displayLabel;
  String? displayColumn, indexColumn;
  CustomDropdownButton(
      {super.key,
      required this.value,
      required this.hintText,
      required this.callBack,
      this.textColor,
      this.dropdownColor,
      this.backColor,
      required this.items,
      this.displayLabel = true,
      this.displayColumn,
      this.indexColumn});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (displayLabel == true)
            Text(
              hintText,
              style: TextStyle(color: textColor),
            ),
          const SizedBox(
            height: 0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: backColor,
                borderRadius: BorderRadius.circular(kDefaultPadding / 4)),
            child: DropdownButton(
              hint: Text(
                hintText,
                style: TextStyle(color: textColor?.withOpacity(0.5)),
              ),
              underline: Container(),
              dropdownColor: dropdownColor,
              isExpanded: true,
              items: items.map((element) {
                return DropdownMenuItem(
                  value: indexColumn != null
                      ? element[indexColumn].toString()
                      : element,
                  child: Text(
                    displayColumn != null
                        ? element[displayColumn].toString()
                        : element,
                    style: TextStyle(color: textColor),
                  ),
                );
              }).toList(),
              onChanged: (selectedValue) {
                // print(selectedValue.toString());
                value = selectedValue.toString();
                callBack(value);
              },
              value: value,
            ),
          ),
        ],
      ),
    );
  }
}
