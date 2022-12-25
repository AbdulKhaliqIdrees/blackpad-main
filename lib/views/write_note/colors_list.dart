import 'package:blackpad/controllers/note_controller.dart';
import 'package:blackpad/global/constants.dart';
import 'package:blackpad/views/write_note/color_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorsList extends StatelessWidget {
  ColorsList({Key? key}) : super(key: key);

  final controller = Get.find<NoteController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kColorItemSize,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) => ColorItem(
          controller.colors[i],
        ),
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemCount: controller.colors.length,
      ),
    );
  }
}
