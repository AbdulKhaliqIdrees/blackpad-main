import 'package:blackpad/controllers/note_controller.dart';
import 'package:blackpad/global/colors.dart';
import 'package:blackpad/global/global.dart';
import 'package:blackpad/hive/note/note.dart';
import 'package:blackpad/views/write_note/categories_list.dart';
import 'package:blackpad/views/write_note/colors_list.dart';
import 'package:blackpad/widgets/icon.dart';
import 'package:blackpad/widgets/text_field_no_bg.dart';
import 'package:blackpad/widgets/title_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteNote extends StatefulWidget {
  const WriteNote({this.note, Key? key}) : super(key: key);

  final Note? note;

  @override
  State<WriteNote> createState() => _WriteNoteState();
}

class _WriteNoteState extends State<WriteNote> {
  final controller = Get.put(NoteController());

  @override
  void initState() {
    controller.getAllCategories();
    controller.handleEditableNote(widget.note);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        pop(context, true);
        Get.delete<NoteController>();
        return Future.value(false);
      },
      child: Obx(
        () => Scaffold(
          backgroundColor: MyColors.colorMap[controller.selectedColor.value],
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  TitleTopBar(
                    '',
                    startIcon: 'cross',
                    endIcon: 'tick',
                    startOnTap: () {
                      pop(context, true);
                      Get.delete<NoteController>();
                    },
                    endOnTap: () {
                      controller.writeNote(context, widget.note);
                    },
                  ),
                  const SizedBox(height: 24),
                  MyTextField(
                    hint: 'Title',
                    controller: controller.titleController,
                    fontSize: 24,
                  ),
                  Expanded(
                    child: MyTextField(
                      hint: 'Note',
                      controller: controller.noteController,
                      lines: 20,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CategoriesList(),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: ColorsList()),
                      if (widget.note != null)
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(width: 12),
                            SvgIcon(
                              'download',
                              size: 32,
                              onTap: () {
                                controller.savePdf(context, widget.note!);
                              },
                            ),
                            const SizedBox(width: 12),
                            SvgIcon(
                              controller.isFavorite.value
                                  ? 'heart_filled'
                                  : 'heart',
                              size: 32,
                              color: controller.isFavorite.value
                                  ? MyColors.brightPink
                                  : MyColors.prime,
                              onTap: () {
                                controller.favoriteNote();
                              },
                            ),
                            const SizedBox(width: 12),
                            SvgIcon(
                              'delete',
                              size: 32,
                              onTap: () {
                                controller.deleteNote(context, widget.note!);
                              },
                            ),
                          ],
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
