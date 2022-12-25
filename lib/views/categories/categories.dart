import 'package:blackpad/controllers/category_controller.dart';
import 'package:blackpad/views/categories/add_category_widget.dart';
import 'package:blackpad/views/categories/category_item.dart';
import 'package:blackpad/widgets/title_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final controller = Get.find<CategoryController>();

  @override
  void initState() {
    controller.getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Obx(
        () => Column(
          children: [
            TitleTopBar(
              'Categories',
              endIcon: 'add',
              endOnTap: () {
                controller.navigateToAddCategory(context);
              },
            ),
            SizedBox(height: controller.categories.isNotEmpty ? 24 : 0),
            Obx(
              () => Visibility(
                visible: controller.categories.isEmpty,
                child: Expanded(
                  child: AddCategoryWidget(),
                ),
              ),
            ),
            Obx(
              () => Visibility(
                visible: controller.categories.isNotEmpty,
                child: Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.categories.length,
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                    ),
                    itemBuilder: (_, i) {
                      return CategoryItem(controller.categories[i]);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
