import 'package:blackpad/controllers/master_controller.dart';
import 'package:blackpad/global/colors.dart';
import 'package:blackpad/widgets/icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NavBarItem extends StatelessWidget {
  final String text;
  final String icon;
  final int index;

  NavBarItem({
    required this.text,
    required this.icon,
    required this.index,
    Key? key,
  }) : super(key: key);

  final controller = Get.find<MasterController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          controller.index.value = index;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 8,
          ),
          child: Column(
            children: [
              Obx(
                () => SvgIcon(
                  controller.index.value == index ? '${icon}_selected' : icon,
                  color: MyColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
