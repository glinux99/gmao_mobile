import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Resources/Constants/global_variables.dart';
import '../../Resources/Providers/app_state_provider.dart';

class CustomButton extends StatefulWidget {
  CustomButton(
      {super.key,
      required this.text,
      required this.backColor,
      required this.textColor,
      required this.callback,
      this.size,
      this.icon,
      this.canSync = false,
      this.isBordered = false});

  final String text;
  final Color backColor;
  final Color textColor;
  Function callback;
  double? size;
  IconData? icon;
  bool? canSync = false, isBordered = false;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isButtonHovered = false;

  // double width = 250;

  @override
  Widget build(BuildContext context) {
    return Consumer<AppStateProvider>(builder: (context, appStateProvider, _) {
      // if (appStateProvider.isAsync == true && widget.canSync == true) {
      //   width = 40;
      //   setState(() {});
      // }
      return Center(
        child: GestureDetector(
          onTap: () async {
            if (context.read<AppStateProvider>().isAsync == false) {
              if (widget.canSync == true &&
                  context.read<AppStateProvider>().needToWorkOffline == false) {
                // await AppProviders.appProvider.checkApiConnectivity();
              }
              widget.callback();
            }
            // widget.callback();
          },
          child: MouseRegion(
            // onHover: (value) => setState(() {
            //   isButtonHovered = true;
            // }),
            // onEnter: (value) => setState(() {
            //   isButtonHovered = true;
            // }),
            // onExit: (value) => setState(() {
            //   isButtonHovered = false;
            // }),
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                // constraints: BoxConstraints(maxWidth: 250, minWidth: 40),
                width:
                    appStateProvider.isAsync == true && widget.canSync == true
                        ? 40
                        : widget.size ?? MediaQuery.of(context).size.width,
                height:
                    appStateProvider.isAsync == true && widget.canSync == true
                        ? 40
                        : 48,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding / 2, vertical: 5),
                padding: EdgeInsets.symmetric(
                    horizontal: kDefaultPadding / 2, vertical: 10),
                decoration: BoxDecoration(
                  color: widget.isBordered == true && isButtonHovered == false
                      ? Colors.transparent
                      : isButtonHovered
                          ? widget.backColor.withOpacity(0.9)
                          : widget.backColor,
                  border: widget.isBordered == true
                      ? Border.all(color: widget.textColor, width: 2)
                      : null,
                  borderRadius: BorderRadius.circular(
                      appStateProvider.isAsync == false ? 8 : 100),
                ),
                child: widget.canSync == null || widget.canSync == false
                    ? FittedBox(
                        child: Text(
                          widget.text,
                          style: TextStyle(
                              color: isButtonHovered
                                  ? widget.textColor.withOpacity(0.5)
                                  : widget.textColor,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    : appStateProvider.isAsync == false &&
                            (widget.canSync != null && widget.canSync == true)
                        ? FittedBox(
                            child: Text(
                              widget.text,
                              style: TextStyle(
                                  color: isButtonHovered
                                      ? widget.textColor.withOpacity(0.5)
                                      : widget.textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  widget.textColor),
                            ),
                          )),
          ),
        ),
      );
    });
  }
}
