import 'package:blackpad/controllers/note_controller.dart';
import 'package:blackpad/global/global.dart';
import 'package:blackpad/hive/category/category.dart';
import 'package:blackpad/hive/note/note.dart';
import 'package:blackpad/views/add_category/add_category.dart';
import 'package:blackpad/views/category_notes/category_notes.dart';
import 'package:blackpad/views/write_note/write_note.dart';
import 'package:blackpad/widgets/snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CategoryController extends GetxController {
  final categories = <Category>[].obs;
  final notes = <Note>[].obs;

  void getAllCategories() {
    categories.value = [];
    final box = Hive.box<Category>('categories');
    for (var item in box.values) {
      categories.add(item);
    }
  }

  void getCategoryNotes(String name) {
    notes.value = [];
    final box = Hive.box<Note>('notes');
    for (var item in box.values.where((e) => e.category == name)) {
      notes.add(item);
    }
  }

  void deleteCategory(context, String categoryName) async {
    final categoryBox = Hive.box<Category>('categories');
    final category =
        categoryBox.values.where((e) => e.name == categoryName).toList()[0];

    if (category.count > 0) {
      showSnackBar(
        context,
        'Can not delete category having multiple notes',
      );
      return;
    }

    await categoryBox.delete(category.id);
    pop(context, true);
  }

  void navigateToAddCategory(BuildContext context) async {
    await navigate(context, AddCategory());
    getAllCategories();
  }

  void navigateToCategoryNotes(BuildContext context, String category) async {
    await navigate(context, CategoryNotes(category));
    getAllCategories();
  }

  void navigateToEditNote(context, [Note? note]) async {
    final noteEdited = await navigate(context, WriteNote(note: note));
    Get.delete<NoteController>();
    if (noteEdited == null) return;
    if (noteEdited) {
      getCategoryNotes(note!.category);
    }
  }
}
