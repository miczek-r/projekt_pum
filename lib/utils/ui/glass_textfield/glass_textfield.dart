import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GlassTextField extends StatelessWidget {
  final IconData? icon;
  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatter;
  final Function(String)? onSubmited;
  final TextEditingController? controller;

  const GlassTextField(
      {this.icon,
      this.hintText = "",
      this.isPassword = false,
      this.keyboardType = TextInputType.text,
      this.inputFormatter,
      this.textAlign = TextAlign.start,
      Key? key,
      this.onChanged,
      this.onSubmited,
      this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: 15,
          sigmaX: 15,
        ),
        child: Container(
          height: size.width / 8,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(.30),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            controller: controller,
            textAlign: textAlign,
            onChanged: onChanged,
            inputFormatters: inputFormatter,
            onSubmitted: onSubmited,
            style: TextStyle(color: Colors.white.withOpacity(.8)),
            cursorColor: Colors.white,
            obscureText: isPassword,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              prefixIcon: (this.icon != null)
                  ? Icon(
                      icon,
                      color: Colors.white.withOpacity(.7),
                    )
                  : null,
              border: InputBorder.none,
              hintMaxLines: 1,
              hintText: hintText,
              hintStyle:
                  TextStyle(fontSize: 14, color: Colors.white.withOpacity(.5)),
            ),
          ),
        ),
      ),
    );
  }
}
