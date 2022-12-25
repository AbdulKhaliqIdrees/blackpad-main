import 'package:blackpad/controllers/category_controller.dart';
import 'package:blackpad/widgets/button.dart';
import 'package:blackpad/widgets/icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategoryWidget extends StatelessWidget {
  AddCategoryWidget({Key? key}) : super(key: key);

  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SvgIcon(
          'new_note_square',
          size: 48,
        ),
        const SizedBox(height: 16),
        const Text(
          'You currently have no categories.\n'
          'Add a category.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        Button(
          'Add Category',
          radius: 36,
          width: 210,
          height: 52,
          onTap: () {
            controller.navigateToAddCategory(context);
          },
        ),
      ],
    );
  }
}
