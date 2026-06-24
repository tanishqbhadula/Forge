import 'package:flutter/material.dart';

class RoundTextBox extends StatelessWidget {

  const RoundTextBox({
    super.key,
    this.controller,
    required this.hintText,
    required this.icon,
    this.margin,
    this.inputType,
    this.obscureText = false,
  });

  final TextEditingController? controller;
  final String hintText;
  final Icon icon;
  final EdgeInsets? margin;
  final TextInputType? inputType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: inputType,
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
          alignLabelWithHint: true,
          prefixIcon: icon,
        ),
      ),
    );
  }
}
