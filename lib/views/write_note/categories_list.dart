import 'package:blackpad/controllers/note_controller.dart';
import 'package:blackpad/global/constants.dart';
import 'package:blackpad/views/write_note/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesList extends StatelessWidget {
  CategoriesList({Key? key}) : super(key: key);

  final controller = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SizedBox(
        height: kCategoryItemSize,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, i) => CategoryItem(
            controller.categories[i].name,
          ),
          separatorBuilder: (_, __) => const SizedBox(width: 12),
          itemCount: controller.categories.length,
        ),
      ),
    );
  }
}
