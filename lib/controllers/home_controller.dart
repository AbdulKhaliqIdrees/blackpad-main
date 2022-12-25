import 'package:blackpad/controllers/note_controller.dart';
import 'package:blackpad/global/enums.dart';
import 'package:blackpad/global/global.dart';
import 'package:blackpad/hive/note/note.dart';
import 'package:blackpad/views/write_note/write_note.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeController extends GetxController {
  final selectedTab = HomeTab.allNotes.obs;

  final notes = <Note>[].obs;
  final favoriteNotes = <Note>[].obs;

  void getAllNotes() {
    notes.value = [];
    final box = Hive.box<Note>('notes');
    for (var item in box.values) {
      notes.add(item);
    }
  }

  void getFavoriteNotes() {
    favoriteNotes.value = notes.where((e) => e.isFavorite).toList();
  }

  void initHome() {
    getAllNotes();
    getFavoriteNotes();
  }

  void navigateToEditNote(context, [Note? note]) async {
    final noteEdited = await navigate(context, WriteNote(note: note));
    Get.delete<NoteController>();
    if (noteEdited == null) return;
    if (noteEdited) {
      initHome();
    }
  }
}
