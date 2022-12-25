import 'package:blackpad/controllers/search_controller.dart';
import 'package:blackpad/global/global.dart';
import 'package:blackpad/views/home/notes_item.dart';
import 'package:blackpad/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final controller = Get.find<SearchController>();

  @override
  void initState() {
    controller.getAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        controller.searchController.text = '';
        pop(context, true);
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                MyTextField(
                  hint: 'Search for notes',
                  controller: controller.searchController,
                  onChanged: (value) {
                    controller.searchNotes(value);
                  },
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Obx(
                    () => ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.searchedNotes.length,
                      shrinkWrap: true,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (_, i) {
                        return NotesItem(controller.searchedNotes[i], 'search');
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
