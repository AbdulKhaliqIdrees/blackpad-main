import 'package:blackpad/controllers/category_controller.dart';
import 'package:blackpad/global/global.dart';
import 'package:blackpad/views/home/notes_item.dart';
import 'package:blackpad/widgets/title_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryNotes extends StatefulWidget {
  const CategoryNotes(this.category, {Key? key}) : super(key: key);

  final String category;

  @override
  State<CategoryNotes> createState() => _CategoryNotesState();
}

class _CategoryNotesState extends State<CategoryNotes> {
  @override
  void initState() {
    controller.getCategoryNotes(widget.category);
    super.initState();
  }

  final controller = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        pop(context, true);
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                TitleTopBar(
                  '${widget.category} Notes',
                  startIcon: 'back',
                  endIcon: 'delete',
                  startOnTap: () {
                    pop(context, true);
                  },
                  endOnTap: () {
                    controller.deleteCategory(context, widget.category);
                  },
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Obx(
                    () => ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.notes.length,
                      shrinkWrap: true,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (_, i) {
                        return NotesItem(controller.notes[i], 'category');
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
