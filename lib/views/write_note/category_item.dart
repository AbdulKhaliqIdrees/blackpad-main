import 'package:blackpad/controllers/note_controller.dart';
import 'package:blackpad/global/colors.dart';
import 'package:blackpad/global/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(
    this.category, {
    Key? key,
  }) : super(key: key);

  final String category;

  final controller = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (controller.selectedCategory.value != category) {
          controller.selectedCategory.value = category;
        } else {
          controller.selectedCategory.value = '';
        }
      },
      child: Obx(
        () => Container(
          height: kCategoryItemSize,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: controller.selectedCategory.value == category
                ? MyColors.brightColorMap[controller.selectedColor.value]
                : MyColors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: MyColors.brightColorMap[controller.selectedColor.value]!,
            ),
          ),
          child: Center(
            child: Text(
              category,
              style: TextStyle(
                fontSize: 20,
                color: controller.selectedCategory.value == category
                    ? MyColors.white
                    : MyColors.brightColorMap[controller.selectedColor.value],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
