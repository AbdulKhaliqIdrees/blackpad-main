import 'package:blackpad/controllers/master_controller.dart';
import 'package:blackpad/views/master/ad_widget.dart';
import 'package:blackpad/views/master/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Master extends StatefulWidget {
  const Master({Key? key}) : super(key: key);

  @override
  State<Master> createState() => _MasterState();
}

class _MasterState extends State<Master> {
  final controller = Get.put(MasterController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Obx(
                  () => controller.tabs[controller.index.value],
                ),
              ),
              const BannerAdWidget(),
              const NavBar(),
            ],
          ),
        ),
      ),
    );
  }
}
