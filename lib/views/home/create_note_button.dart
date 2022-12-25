import 'package:blackpad/controllers/home_controller.dart';
import 'package:blackpad/global/colors.dart';
import 'package:blackpad/widgets/icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateNoteButton extends StatelessWidget {
  CreateNoteButton({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: MyColors.prime,
      child: const SvgIcon(
        'new_note',
        color: MyColors.white,
      ),
      onPressed: () {
        controller.navigateToEditNote(context);
      },
    );
  }
}
