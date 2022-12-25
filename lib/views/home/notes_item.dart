import 'package:blackpad/controllers/category_controller.dart';
import 'package:blackpad/controllers/home_controller.dart';
import 'package:blackpad/controllers/search_controller.dart';
import 'package:blackpad/global/colors.dart';
import 'package:blackpad/hive/note/note.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NotesItem extends StatelessWidget {
  NotesItem(this.note, this.screen, {Key? key}) : super(key: key);

  final Note note;
  final String screen;

  final homeController = Get.find<HomeController>();
  final categoryController = Get.find<CategoryController>();
  final searchController = Get.find<SearchController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (screen == 'home') {
          homeController.navigateToEditNote(context, note);
        } else if (screen == 'category') {
          categoryController.navigateToEditNote(context, note);
        } else if (screen == 'search') {
          searchController.navigateToEditNote(context, note);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: MyColors.colorMap[note.color],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: MyColors.colorMap[note.color]!,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: note.title != '',
              child: Text(
                note.title,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: MyColors.prime,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: note.title != '' ? 6 : 0),
            Text(
              note.note,
              style: TextStyle(
                color: MyColors.black.withOpacity(0.9),
                fontSize: 17,
                height: 1.35,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Text(
                  note.category,
                  style: TextStyle(
                    color: MyColors.black.withOpacity(0.6),
                    fontSize: 13,
                  ),
                ),
                const Spacer(),
                Text(
                  DateFormat('yyyy-MM-dd').format(note.time),
                  style: TextStyle(
                    color: MyColors.black.withOpacity(0.6),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
