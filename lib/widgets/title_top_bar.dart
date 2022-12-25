import 'package:blackpad/global/colors.dart';
import 'package:blackpad/widgets/icon.dart';
import 'package:flutter/material.dart';

class TitleTopBar extends StatelessWidget {
  const TitleTopBar(
    this.text, {
    this.startIcon,
    this.endIcon,
    this.startOnTap,
    this.endOnTap,
    this.center = true,
    Key? key,
  }) : super(key: key);

  final String text;
  final String? startIcon, endIcon;
  final void Function()? startOnTap, endOnTap;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 28,
              child: startIcon != null
                  ? SvgIcon(
                      startIcon!,
                      size: 28,
                      onTap: startOnTap,
                    )
                  : const SizedBox(),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Align(
                alignment: center ? Alignment.center : Alignment.centerLeft,
                child: Text(
                  text,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 24,
                    color: MyColors.prime,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: 28,
              child: endIcon != null
                  ? SvgIcon(
                      endIcon!,
                      size: 28,
                      onTap: endOnTap,
                    )
                  : const SizedBox(),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const Divider(
          thickness: 0.1,
          height: 0.1,
          color: MyColors.prime,
        ),
      ],
    );
  }
}
