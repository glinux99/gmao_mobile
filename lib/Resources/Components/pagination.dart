import 'package:flutter/material.dart';

import '../../Resources/Constants/global_variables.dart';
import '../Models/pagination.dart';

class PaginationWidget extends StatelessWidget {
  Function nextCallback, prevCallback;
  PaginationModel pagination;
  PaginationWidget(
      {super.key,
      required this.prevCallback,
      required this.nextCallback,
      required this.pagination});

  @override
  Widget build(BuildContext context) {
    // print(pagination.page);
    return Container(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (pagination.page! > 1)
              IconButton(
                  onPressed: () {
                    prevCallback();
                  },
                  icon: Icon(Icons.arrow_back_ios_rounded,
                      color: AppColors.kBlackColor, size: 20)),
            const SizedBox(width: 8),
            Text(pagination.page.toString()),
            const SizedBox(width: 8),
            if (pagination.hasNext == true)
              IconButton(
                  onPressed: () {
                    nextCallback();
                  },
                  icon: Icon(Icons.arrow_forward_ios_rounded,
                      color: AppColors.kBlackColor, size: 20)),
          ],
        ));
  }
}
