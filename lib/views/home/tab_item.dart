import 'package:blackpad/controllers/home_controller.dart';
import 'package:blackpad/global/colors.dart';
import 'package:blackpad/global/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabItem extends StatelessWidget {
  final String text;
  final HomeTab tab;

  TabItem(
    this.text,
    this.tab, {
    Key? key,
  }) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          controller.selectedTab.value = tab;
        },
        child: Obx(
          () => Container(
            padding: const EdgeInsets.symmetric(
              vertical: 14,
            ),
            decoration: BoxDecoration(
              color: controller.selectedTab.value == tab
                  ? MyColors.prime
                  : MyColors.grey,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: controller.selectedTab.value == tab
                      ? MyColors.white
                      : MyColors.prime,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
