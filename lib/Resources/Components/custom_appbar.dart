import 'package:flutter/material.dart';

import '../Constants/global_variables.dart';


customAppbar(context, {String? title, VoidCallback? onTap, List<Widget>? actions}) {
  return AppBar(
    title: Text(title ?? "title"),
    backgroundColor: AppColors.kPrimaryColor,
    actions: actions,
    elevation: 0,
    leading: IconButton(
      onPressed: onTap ??
          () {
            Navigator.pop(context);
          },
      icon: const Icon(
        Icons.arrow_back,
      ),
    ),
  );
}
