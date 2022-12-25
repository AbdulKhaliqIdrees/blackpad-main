import 'package:blackpad/global/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String icon;
  final double size;
  final Color color;
  final void Function()? onTap;

  const SvgIcon(
    this.icon, {
    Key? key,
    this.size = 24,
    this.color = MyColors.prime,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        'assets/$icon.svg',
        height: size,
        color: color,
      ),
    );
  }
}
