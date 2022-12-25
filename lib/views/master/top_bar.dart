import 'package:blackpad/controllers/home_controller.dart';
import 'package:blackpad/global/colors.dart';
import 'package:blackpad/global/global.dart';
import 'package:blackpad/views/search/search.dart';
import 'package:blackpad/widgets/icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTopBar extends StatelessWidget {
  HomeTopBar({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyColors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              const SvgIcon(
                'icon',
                color: MyColors.prime,
                size: 36,
              ),
              const SizedBox(width: 12),
              const Text(
                'BlackPad',
                style: TextStyle(
                  fontSize: 24,
                  color: MyColors.prime,
                ),
              ),
              const Spacer(),
              SvgIcon(
                'search',
                color: MyColors.prime,
                onTap: () async {
                  final result = await navigate(context, const Search());
                  if (result == null) return;
                  if (result) {
                    controller.getAllNotes();
                  }
                },
              ),
              const SizedBox(width: 16),
              SvgIcon(
                'star',
                color: MyColors.prime,
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Divider(
            thickness: 0.1,
            height: 0.1,
            color: MyColors.prime,
          ),
        ],
      ),
    );
  }
}
