import 'package:blackpad/views/categories/categories.dart';
import 'package:blackpad/views/home/home.dart';
import 'package:blackpad/views/subscription/subscription.dart';
import 'package:get/get.dart';

class MasterController extends GetxController {
  final index = 0.obs;

  final tabs = [
    const Home(),
    const Categories(),
    const Subscription(),
  ];
}
