import 'package:blackpad/ads/banner_ad_controller.dart';
import 'package:blackpad/app.dart';
import 'package:blackpad/controllers/category_controller.dart';
import 'package:blackpad/controllers/home_controller.dart';
import 'package:blackpad/controllers/search_controller.dart';
import 'package:blackpad/global/extension.dart';
import 'package:blackpad/hive/category/category.dart';
import 'package:blackpad/hive/note/note.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/foundation.dart' as f;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:in_app_update/in_app_update.dart';

Future<void> main() async {
  // testGeneratedId();
  WidgetsFlutterBinding.ensureInitialized();
  // await checkForUpdates();
  await initFirebase();
  await initCrashlytics();
  await initAds();
  await setupHive();
  setupControllers();
  // deleteBoxes();
  runApp(const MyApp());
}

Future<void> initFirebase() async {
  await Firebase.initializeApp();
}

Future<void> initAds() async {
  List<String> testDeviceIds = ['05832503DD51B67B60012D84559702F4'];

  RequestConfiguration configuration =
      RequestConfiguration(testDeviceIds: testDeviceIds);
  await MobileAds.instance.initialize();
  MobileAds.instance.updateRequestConfiguration(configuration);
}

Future<void> initCrashlytics() async {
  if (f.kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
}

void initPerformance() {
  FirebasePerformance.instance;
}

Future<void> checkForUpdates() async {
  await InAppUpdate.checkForUpdate();
}

void setupControllers() {
  Get.put(HomeController());
  Get.put(CategoryController());
  Get.put(SearchController());
  Get.put(BannerAdController()).initBannerAd();
}

Future<void> setupHive() async {
  // initialize
  await Hive.initFlutter();

  // register
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(CategoryAdapter());

  // open
  await Hive.openBox<Note>('notes');
  await Hive.openBox<Category>('categories');
}

void deleteBoxes() {
  Hive.deleteBoxFromDisk('notes');
  Hive.deleteBoxFromDisk('categories');
}

void testGeneratedId() {
  debugPrint(
    DateTime.now().millisecondsSinceEpoch.genId.toString(),
  );
}
