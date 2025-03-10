import 'package:flutter/material.dart';

import '../Constants/global_variables.dart';
import 'texts.dart';

class ListTitleWidget extends StatefulWidget {
  String? title, subtitle;
  dynamic trailing, leading;
  ListTitleWidget(
      {super.key, this.title, this.leading, this.trailing, this.subtitle});

  @override
  State<ListTitleWidget> createState() => _ListTitleWidgetState();
}

class _ListTitleWidgetState extends State<ListTitleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 0),
      child: Row(
        children: [
          if (widget.leading is Widget) widget.leading,
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: widget.subtitle != null
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidgets.textBold(
                          title: "${widget.title}",
                          fontSize: 16,
                          textColor: AppColors.kBlackColor),
                      TextWidgets.text300(
                          title: widget.subtitle ?? "",
                          fontSize: 12,
                          textColor: AppColors.kBlackColor),
                    ],
                  )
                : TextWidgets.textBold(
                    title: "${widget.title}",
                    fontSize: 16,
                    textColor: AppColors.kBlackColor),
          ),
          if (widget.trailing is Widget) widget.trailing
        ],
      ),
    );
  }
}
