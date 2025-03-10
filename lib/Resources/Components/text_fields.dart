import 'package:flutter/material.dart';

import '../../Resources/Components/texts.dart';
import '../../Resources/Constants/global_variables.dart';

class TextFormFieldWidget extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validator;
  final Color textColor;
  final Color backColor;
  bool? isEnabled, hasMargin;
  bool? isObsCured;
  final TextEditingController? editCtrller;
  int? maxLines = 1;
  int maxLength = 255;
  TextInputType? inputType;
  VoidCallback? onTap;
  bool? isBorder;
  TextFormFieldWidget(
      {super.key,
      required this.hintText,
      required this.textColor,
      required this.backColor,
      this.editCtrller,
      this.inputType = TextInputType.text,
      maxLength,
      this.maxLines = 1,
      this.isEnabled,
      this.isObsCured,
      this.validator,
      this.hasMargin = true,
      this.isBorder = false,
      this.onTap});

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: widget.hasMargin == false
            ? const EdgeInsets.all(0)
            : const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                  color: widget.backColor,
                  borderRadius: BorderRadius.circular(kDefaultPadding / 4)),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(kDefaultPadding / 4),
                    child: TextFormField(
                      keyboardType: widget.inputType,
                      enabled:
                          widget.isEnabled != null ? widget.isEnabled! : true,
                      obscureText: widget.isObsCured != null
                          ? widget.isObsCured!
                          : false,
                      maxLines: widget.maxLines,
                      style: TextStyle(color: widget.textColor),
                      textAlign: TextAlign.left,
                      controller: widget.editCtrller,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        hintText: widget.hintText,
                        hintStyle:
                            TextStyle(color: widget.textColor.withOpacity(0.5)),
                        label: TextWidgets.text300(
                            title: widget.hintText,
                            fontSize: 12,
                            textColor: widget.textColor.withOpacity(1)),
                        border: widget.isBorder != false
                            ? OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: widget.textColor, width: 2))
                            : UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                        focusedBorder: widget.isBorder != false
                            ? OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: widget.textColor, width: .5))
                            : UnderlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                        // hintText: widget.hintText,
                        // hintStyle:
                        //     TextStyle(color: widget.textColor.withOpacity(0.5))
                      ),
                      // onSaved: (value) {
                      //   // widget.editCtrller?.text = value ?? '';
                      //   if (widget.callback != null) {
                      //     widget.callback!(value ?? '');
                      //   }
                      // },
                      validator: widget.validator,
                      onSaved: (String? value) =>
                          widget.editCtrller!.text = value!,
                    ),
                  ),
                  if (widget.isObsCured != null)
                    Positioned(
                        top: 0,
                        bottom: 0,
                        right: 10,
                        child: GestureDetector(
                          onTap: () {
                            widget.isObsCured = !widget.isObsCured!;
                            setState(() {});
                          },
                          child: Center(
                            child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: widget.textColor.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(
                                        kDefaultPadding / 4)),
                                child: Icon(
                                    widget.isObsCured != null &&
                                            widget.isObsCured == false
                                        ? Icons.vpn_key_rounded
                                        : Icons.remove_red_eye,
                                    color: widget.textColor,
                                    size: 20)),
                          ),
                        ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFormVerification extends StatefulWidget {
  final String hintText;
  final Color textColor;
  final Color backColor;
  final TextEditingController editCtrller;
  int maxLines = 1;

  TextFormVerification(
      {super.key,
      required this.hintText,
      required this.textColor,
      required this.backColor,
      required this.editCtrller,
      required this.maxLines});

  @override
  _TextFormVerificationState createState() => _TextFormVerificationState();
}

class _TextFormVerificationState extends State<TextFormVerification> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8, bottom: 8),
            decoration: BoxDecoration(
                color: widget.backColor,
                borderRadius: BorderRadius.circular(kDefaultPadding / 4)),
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              obscureText: false,
              maxLines: widget.maxLines,
              style: TextStyle(color: widget.textColor),
              textAlign: TextAlign.center,
              decoration: InputDecoration.collapsed(
                // contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                hintText: widget.hintText,
                hintStyle: TextStyle(color: widget.textColor.withOpacity(0.5)),
                // border: UnderlineInputBorder(
                //     borderSide: BorderSide(color: widget.textColor, width: 1)),
                // focusedBorder: UnderlineInputBorder(
                //     borderSide: BorderSide(color: widget.textColor, width: 3)),
                // hintText: widget.hintText,
                // hintStyle:
                //     TextStyle(color: widget.textColor.withOpacity(0.5))
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldWidgetFlight extends StatelessWidget {
  late String title;
  late String hintText;
  late IconData? icon;
  late Color? hintColor, titleColor;
  late Color? backgroundColor, borderColor;
  TextFieldWidgetFlight(
      {super.key,
      required this.title,
      required this.hintText,
      this.icon,
      this.hintColor,
      this.titleColor,
      this.backgroundColor,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.kWhiteColor,
          border: Border.all(
            color: borderColor ?? AppColors.kBlackColor,
            width: .4,
          ),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: titleColor),
          ),
          Row(
            children: [
              Expanded(
                  child: TextFormField(
                style: TextStyle(fontSize: 20, color: hintColor),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    focusedBorder: InputBorder.none),
              )),
              Icon(
                icon ?? Icons.lock,
                color: hintColor ?? AppColors.kGreyColor,
              )
            ],
          ),
        ],
      ),
    );
  }
}
