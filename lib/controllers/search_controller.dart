import 'package:blackpad/controllers/note_controller.dart';
import 'package:blackpad/global/global.dart';
import 'package:blackpad/hive/note/note.dart';
import 'package:blackpad/views/write_note/write_note.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SearchController extends GetxController {
  final searchController = TextEditingController();

  final notes = <Note>[].obs;
  final searchedNotes = <Note>[].obs;

  void searchNotes(String value) {
    value = value.toLowerCase().trim();
    searchedNotes.value = [];
    searchedNotes.value = notes.where(
      (e) {
        return e.title.toLowerCase().contains(value) ||
            e.note.toLowerCase().contains(value) ||
            e.category.toLowerCase().contains(value);
      },
    ).toList();
  }

  void getAllNotes() {
    notes.value = [];
    final box = Hive.box<Note>('notes');
    for (var item in box.values) {
      notes.add(item);
    }
    searchedNotes.value = notes;
  }

  void navigateToEditNote(context, [Note? note]) async {
    final noteEdited = await navigate(context, WriteNote(note: note));
    Get.delete<NoteController>();
    if (noteEdited == null) return;
    if (noteEdited) {
      getAllNotes();
    }
  }
}
