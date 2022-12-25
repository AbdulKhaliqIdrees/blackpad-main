import 'package:blackpad/controllers/home_controller.dart';
import 'package:blackpad/widgets/button.dart';
import 'package:blackpad/widgets/icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNoteWidget extends StatelessWidget {
  CreateNoteWidget({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SvgIcon(
          'new_note_square',
          size: 48,
        ),
        const SizedBox(height: 16),
        const Text(
          'You currently have no notes.\n'
          'Create a note.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            height: 1.4,
          ),
        ),
        const SizedBox(height: 16),
        Button(
          'Create Note',
          radius: 36,
          width: 210,
          height: 52,
          onTap: () {
            controller.navigateToEditNote(context);
          },
        ),
      ],
    );
  }
}
