import 'package:blackpad/controllers/app_controller.dart';
import 'package:blackpad/controllers/notification_controller.dart';
import 'package:blackpad/global/theme.dart';
import 'package:blackpad/views/master/master.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final controller = AppController();

  @override
  void initState() {
    controller.initIap();
    controller.initAppOpenAd();

    Future.delayed(
      Duration.zero,
      () {
        NotificationController(context).initializeNotification();
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BlackPad',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.themeData,
      // home: const Splash(),
      home: const Master(),
    );
  }
}
