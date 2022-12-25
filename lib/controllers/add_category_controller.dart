import 'package:blackpad/global/colors.dart';
import 'package:blackpad/global/extension.dart';
import 'package:blackpad/global/global.dart';
import 'package:blackpad/hive/category/category.dart';
import 'package:blackpad/widgets/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddCategoryController extends GetxController {
  final selectedColor = 'pink'.obs;
  final colors = MyColors.brightColorMap.keys.toList();
  final categoryTextController = TextEditingController();

  void addCategory(context) async {
    String name = categoryTextController.text.trim();
    if (name == '') return;
    if (name.length > 20) {
      showSnackBar(context, 'Category Name can no longer be 20 characters');
    }

    final box = Hive.box<Category>('categories');
    final time = DateTime.now();
    final id = time.millisecondsSinceEpoch.genId;

    final newCategory = Category()
      ..id = id
      ..name = name
      ..color = selectedColor.value
      ..count = 0;

    await box.put(id, newCategory);
    categoryTextController.text = '';
    pop(context, true);
  }
}
