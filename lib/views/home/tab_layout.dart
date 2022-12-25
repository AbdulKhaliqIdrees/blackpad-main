import 'package:blackpad/global/colors.dart';
import 'package:blackpad/global/enums.dart';
import 'package:blackpad/views/home/tab_item.dart';
import 'package:flutter/material.dart';

class TabLayout extends StatelessWidget {
  const TabLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          TabItem('All Notes', HomeTab.allNotes),
          TabItem('Favorites', HomeTab.favorites),
        ],
      ),
    );
  }
}
