import 'package:blackpad/controllers/note_controller.dart';
import 'package:blackpad/global/colors.dart';
import 'package:blackpad/global/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorItem extends StatelessWidget {
  ColorItem(
    this.color, {
    Key? key,
  }) : super(key: key);

  final String color;

  final controller = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.selectedColor.value = color;
      },
      child: Obx(
        () => Container(
          height: kColorItemSize,
          width: kColorItemSize,
          decoration: BoxDecoration(
            color: MyColors.brightColorMap[color],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            Icons.check,
            size: 20,
            color: controller.selectedColor.value == color
                ? MyColors.white
                : Colors.transparent,
          ),
        ),
      ),
    );
  }
}
