import 'package:flutter/material.dart';

class LoginInput extends StatelessWidget {
  final Color? color;
  final String? hint;
  final int? maxLines;
  final bool isObscure;
  final Widget? trailingIcon;
  // final VoidCallback? onEyeTaped;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final TextInputType? textInputType;
  final String? errorMessage;
  final bool? enable;
  final FontWeight? fontWeight;
  final double? fontSize;
  const LoginInput(
      {this.color,
      this.hint,
      this.isObscure = false,
      // this.onEyeTaped,
      this.controller,
      this.trailingIcon,
      this.onSaved,
      required this.maxLines,
      this.textInputType,
      this.errorMessage,
      this.enable,
      this.fontWeight,
      this.fontSize,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        // height: 50,
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 20, right: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: TextFormField(
                  controller: controller,
                  obscureText: isObscure,
                  onSaved: onSaved,
                  maxLines: maxLines,
                  enabled: enable ?? false,
                  // validator: (value) {
                  //   if (value!.isEmpty) {}
                  // },
                  validator: (value) => value!.isEmpty
                      ? (errorMessage ?? 'Ce champs est obligatoire')
                      : null,

                  keyboardType: textInputType ?? TextInputType.text,
                  style: TextStyle(
                    fontWeight: fontWeight ?? FontWeight.normal,
                    fontSize: fontSize ?? 14,
                  ),
                  decoration: InputDecoration.collapsed(
                    hintText: '$hint',
                    hintStyle: TextStyle(
                      fontWeight: fontWeight ?? FontWeight.normal,
                      fontSize: fontSize ?? 14,
                    ),
                  ),
                ),
              ),
            ),
            trailingIcon ?? const SizedBox(),
          ],
        ),
      ),
    );
  }
}
