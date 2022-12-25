import 'package:blackpad/controllers/category_controller.dart';
import 'package:blackpad/global/colors.dart';
import 'package:blackpad/hive/category/category.dart';
import 'package:blackpad/widgets/icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(this.category, {Key? key}) : super(key: key);

  final Category category;

  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.navigateToCategoryNotes(context, category.name);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: MyColors.brightColorMap[category.color]!.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgIcon(
              'note_text',
              color: MyColors.brightColorMap[category.color]!,
              size: 48,
            ),
            const SizedBox(height: 6),
            Text(
              category.name,
              style: const TextStyle(
                color: MyColors.prime,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${category.count} notes',
              style: TextStyle(
                color: MyColors.black.withOpacity(0.8),
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
