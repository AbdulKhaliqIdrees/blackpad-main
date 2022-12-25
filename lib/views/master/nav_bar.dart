import 'package:blackpad/global/colors.dart';
import 'package:blackpad/views/master/nav_bar_item.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
        color: MyColors.prime,
      ),
      child: Row(
        children: [
          NavBarItem(
            text: 'Home',
            icon: 'home',
            index: 0,
          ),
          NavBarItem(
            text: 'Categories',
            icon: 'categories',
            index: 1,
          ),
          NavBarItem(
            text: 'Subscription',
            icon: 'crown',
            index: 2,
          ),
          // NavBarItem(
          //   text: 'Settings',
          //   icon: 'settings',
          //   index: 3,
          // ),
        ],
      ),
    );
  }
}
