import 'package:blackpad/controllers/add_category_controller.dart';
import 'package:blackpad/global/constants.dart';
import 'package:blackpad/global/global.dart';
import 'package:blackpad/views/add_category/color_item.dart';
import 'package:blackpad/widgets/button.dart';
import 'package:blackpad/widgets/text_field.dart';
import 'package:blackpad/widgets/title_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCategory extends StatelessWidget {
  AddCategory({Key? key}) : super(key: key);

  final controller = Get.put(AddCategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              TitleTopBar(
                'Add Category',
                center: false,
                startIcon: 'back',
                startOnTap: () {
                  pop(context);
                },
              ),
              const SizedBox(height: 24),
              MyTextField(
                hint: 'Enter category name',
                controller: controller.categoryTextController,
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: kColorItemSize,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, i) => ColorItem(
                    controller.colors[i],
                  ),
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemCount: controller.colors.length,
                ),
              ),
              const SizedBox(height: 24),
              Button(
                'Add Category',
                onTap: () {
                  controller.addCategory(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
