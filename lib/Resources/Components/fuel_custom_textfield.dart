import 'package:flutter/material.dart';

import 'login_input.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final bool? enable;
  final bool? isObscure;
  final Widget? trailingIcon;
  final int? maxLines;
  final bool? isPassword;
  final TextInputType? textInputType;
  // final VoidCallback? onEyeTaped;

  const CustomTextfield(
    this.controller, {
    this.label,
    this.enable,
    this.textInputType,
    this.hintText,
    this.maxLines = 1,
    this.trailingIcon,
    this.isObscure = false,
    this.isPassword,
    // this.onEyeTaped,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) ...[
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              label!,
              style: const TextStyle(
                fontSize: 11,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
        LoginInput(
          controller: controller,
          color: Colors.grey[200],
          textInputType: textInputType,
          enable: enable,
          maxLines: maxLines,
          isObscure: isObscure!,
          hint: hintText ?? 'designation',
          // onEyeTaped: onEyeTaped,
          trailingIcon: trailingIcon,
          onSaved: (data) {
            controller!.text = data!;
          },
        ),
        // IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.remove_red_eye_rounded,
        //     size: 18,
        //   ),
        // )
      ],
    );
  }
}
