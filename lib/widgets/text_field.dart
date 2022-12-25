import 'package:blackpad/global/colors.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final int? lines;
  final void Function(String)? onChanged;

  const MyTextField({
    Key? key,
    this.hint,
    this.controller,
    this.lines,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: MyColors.prime.withOpacity(0.08),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        maxLines: lines ?? 1,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 18,
            color: MyColors.prime.withOpacity(0.75),
          ),
        ),
        cursorColor: MyColors.prime,
        style: const TextStyle(
          fontSize: 18,
          color: MyColors.prime,
        ),
      ),
    );
  }
}
