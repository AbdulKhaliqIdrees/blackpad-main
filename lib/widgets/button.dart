import 'package:blackpad/global/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final double height, width, radius;

  const Button(
    this.text, {
    Key? key,
    this.onTap,
    this.height = 60,
    this.width = double.infinity,
    this.radius = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: MyColors.prime,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: MyColors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
