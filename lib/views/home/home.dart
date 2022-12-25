import 'package:blackpad/controllers/home_controller.dart';
import 'package:blackpad/global/enums.dart';
import 'package:blackpad/views/home/create_note_button.dart';
import 'package:blackpad/views/home/create_note_widget.dart';
import 'package:blackpad/views/home/notes_item.dart';
import 'package:blackpad/views/home/tab_layout.dart';
import 'package:blackpad/views/master/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    controller.initHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Obx(
        () => Stack(
          children: [
            Column(
              children: [
                HomeTopBar(),
                SizedBox(height: controller.notes.isNotEmpty ? 24 : 0),
                Visibility(
                  visible: controller.notes.isNotEmpty,
                  child: const TabLayout(),
                ),
                SizedBox(height: controller.notes.isNotEmpty ? 32 : 0),
                Obx(
                  () => Visibility(
                    visible: controller.notes.isEmpty,
                    child: Expanded(
                      child: CreateNoteWidget(),
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: controller.notes.isNotEmpty,
                    child: Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount:
                            controller.selectedTab.value == HomeTab.allNotes
                                ? controller.notes.length
                                : controller.favoriteNotes.length,
                        shrinkWrap: true,
                        separatorBuilder: (_, __) => const SizedBox(height: 12),
                        itemBuilder: (_, i) {
                          return NotesItem(
                            controller.selectedTab.value == HomeTab.allNotes
                                ? controller.notes[i]
                                : controller.favoriteNotes[i],
                            'home',
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Visibility(
              visible: controller.notes.isNotEmpty,
              child: Positioned(
                bottom: 0,
                right: 0,
                child: CreateNoteButton(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
