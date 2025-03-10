import 'package:flutter/material.dart';

import '../../Resources/Constants/responsive.dart';

class ShimmerPlaceholder extends StatelessWidget {
  final double width, height, radius;
  final Color backColor;
  const ShimmerPlaceholder(
      {super.key,
      required this.width,
      required this.height,
      required this.radius,
      required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(2),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backColor,
          borderRadius: BorderRadius.circular(radius),
        ));
  }
}

class ListItemPlaceholder extends StatelessWidget {
  Color? backColor = Colors.grey.shade400;
  double? textHeight;
  ListItemPlaceholder(
      {super.key, this.backColor = Colors.grey, this.textHeight = 12});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShimmerPlaceholder(
                width: 50,
                height: 50,
                radius: 100,
                backColor: backColor!,
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ShimmerPlaceholder(
                                    width: 100,
                                    height: textHeight!,
                                    radius: 100,
                                    backColor: backColor!,
                                  ),
                                  const SizedBox(height: 8),
                                  ShimmerPlaceholder(
                                    width: 100,
                                    height: textHeight!,
                                    radius: 100,
                                    backColor: backColor!,
                                  ),
                                ]),
                          ),
                          if (!Responsive.isMobile(context))
                            Expanded(
                                flex: 2,
                                child: Center(
                                  child: Card(
                                    color: Colors.transparent,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ShimmerPlaceholder(
                                              width: 100,
                                              height: textHeight!,
                                              radius: 100,
                                              backColor: backColor!,
                                            ),
                                          ]),
                                    ),
                                  ),
                                ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ShimmerPlaceholder(
                      width: 30,
                      height: 30,
                      radius: 100,
                      backColor: backColor!,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
