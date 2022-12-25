import 'package:blackpad/global/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final int lines;
  final double fontSize;

  const MyTextField({
    Key? key,
    this.hint,
    this.controller,
    this.lines = 1,
    this.fontSize = 18,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: lines,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: fontSize,
          color: MyColors.prime.withOpacity(0.75),
        ),
      ),
      cursorColor: MyColors.prime,
      style: TextStyle(
        fontSize: fontSize,
        color: MyColors.prime,
      ),
    );
  }
}
