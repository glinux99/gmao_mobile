import 'package:flutter/material.dart';

import '../../Resources/Constants/global_variables.dart';
import '../../main.dart';

showDatePicketCustom({required Function callback, String? helpText}) async {
  await showDatePicker(
    context: navKey.currentContext!,
    helpText: helpText,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime.now().add(const Duration(days: 3650)),
    builder: (BuildContext context, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: AppColors.kPrimaryColor,
          buttonTheme:
              const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          colorScheme: ColorScheme.light(primary: AppColors.kPrimaryColor)
              .copyWith(secondary: AppColors.kPrimaryColor),
        ),
        child: child!,
      );
    },
  ).then((value) => callback(value)).catchError((error) {});
}

showTimePicketCustom({required Function callback}) async {
  await showTimePicker(
    context: navKey.currentContext!,
    initialTime: TimeOfDay.now(),
    hourLabelText: "Heures",
    minuteLabelText: "Minutes",
    helpText: "Selectionner le temps",
    builder: (BuildContext context, child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: AppColors.kPrimaryColor,
          buttonTheme:
              const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          colorScheme: ColorScheme.light(primary: AppColors.kPrimaryColor)
              .copyWith(secondary: AppColors.kPrimaryColor),
        ),
        child: child!,
      );
    },
  ).then((value) => callback(value)).catchError((error) {});
}
