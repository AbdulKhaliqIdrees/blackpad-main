import 'dart:io';

import 'package:blackpad/functions/create_folder.dart';
import 'package:blackpad/global/colors.dart';
import 'package:blackpad/global/extension.dart';
import 'package:blackpad/global/global.dart';
import 'package:blackpad/hive/category/category.dart';
import 'package:blackpad/hive/note/note.dart';
import 'package:blackpad/widgets/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class NoteController extends GetxController {
  final selectedColor = 'pink'.obs;
  final colors = MyColors.colorMap.keys.toList();
  final isFavorite = false.obs;

  final titleController = TextEditingController();
  final noteController = TextEditingController();

  void writeNote(BuildContext context, Note? editableNote) async {
    // get values from text field
    String title = titleController.text.trim();
    String note = noteController.text.trim();
    if (note.isEmpty) {
      showSnackBar(context, 'Cannot save empty note');
      return;
    }

    if (title.length > 20) {
      showSnackBar(context, 'Title should be less than 20 characters');
      return;
    }

    // get box
    final noteBox = Hive.box<Note>('notes');

    final time = DateTime.now();
    final id = time.millisecondsSinceEpoch.genId;

    // new note value
    final newNote = Note()
      ..id = id
      ..note = note
      ..title = title.trim()
      ..category = selectedCategory.value
      ..time = time
      ..color = selectedColor.value
      ..isFavorite = isFavorite.value;

    // adding note to hive
    if (editableNote == null) {
      await noteBox.put(id, newNote);
    } else {
      await noteBox.put(editableNote.id, newNote..id = editableNote.id);
    }

    await handleNoteCount(editableNote);

    // navigating back
    pop(context, true);
  }

  Future<void> handleNoteCount(Note? editableNote) async {
    final categoryBox = Hive.box<Category>('categories');
    // checking if we are adding or updating note
    if (editableNote == null) {
      final categoriesList =
          categoryBox.values.where((e) => e.name == selectedCategory.value);
      if (categoriesList.isNotEmpty) {
        final category = categoriesList.first;
        final count = categoryBox.get(category.id)!.count;
        await categoryBox.put(category.id, category..count = count + 1);
      }
    } else {
      // checking if a new category is selected
      if (selectedCategory.value != editableNote.category) {
        final oldCategoryList =
            categoryBox.values.where((e) => e.name == editableNote.category);

        // checking if some category is selected before
        if (oldCategoryList.isNotEmpty) {
          // getting hive item of old category
          final oldCategory = oldCategoryList.first;

          // getting count of old category
          final oldCount = categoryBox.get(oldCategory.id)!.count;

          // updating count of old category
          await categoryBox.put(
              oldCategory.id, oldCategory..count = oldCount - 1);
        }

        // checking if a new category is selected
        if (selectedCategory.value != '') {
          // getting hive item of new category
          final newCategory = categoryBox.values
              .where((e) => e.name == selectedCategory.value)
              .first;

          // getting count of new category
          final newCount = categoryBox.get(newCategory.id)!.count;

          // updating count of new category
          await categoryBox.put(
              newCategory.id, newCategory..count = newCount + 1);
        }
      }
    }
  }

  void handleEditableNote(Note? note) {
    if (note == null) return;

    titleController.text = note.title;
    noteController.text = note.note;
    selectedCategory.value = note.category;
    selectedColor.value = note.color;
    isFavorite.value = note.isFavorite;
  }

  final selectedCategory = ''.obs;
  final categories = <Category>[].obs;

  void getAllCategories() {
    categories.value = [];
    final box = Hive.box<Category>('categories');
    for (var item in box.values) {
      categories.add(item);
    }
  }

  void deleteNote(context, Note note) async {
    final noteBox = Hive.box<Note>('notes');
    await noteBox.delete(note.id);

    if (note.category != '') {
      final categoryBox = Hive.box<Category>('categories');
      final category =
          categoryBox.values.where((e) => e.name == note.category).first;

      final count = categoryBox.get(category.id)!.count;
      await categoryBox.put(category.id, category..count = count - 1);
    }
    pop(context, true);
  }

  void favoriteNote() async {
    isFavorite.value = !isFavorite.value;
  }

  void savePdf(context, Note note) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              if (note.title != '')
                pw.Text(
                  note.title,
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
              if (note.title != '') pw.SizedBox(height: 20),
              pw.Text(
                note.note.trim(),
                style: const pw.TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          );
        },
      ),
    );
    try {
      String title = note.title.trim().toLowerCase().replaceAll(' ', '-');

      if (title.isEmpty) {
        title = DateTime.now().millisecondsSinceEpoch.toString();
      }
      final dir = await notesFolder(context);

      // final dir = await getExternalStorageDirectory();
      // if (dir == null) return;

      final fileName = '$dir/$title.pdf';

      // final fileName = '${dir.path}/$title.pdf';

      final file = File(fileName);
      await file.writeAsBytes(await pdf.save());

      showSnackBar(context, 'Note Saved as PDF at Phone/BlackPad/$title.pdf');
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
