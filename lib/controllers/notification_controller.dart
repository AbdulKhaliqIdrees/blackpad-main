import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationController {
  final BuildContext context;

  NotificationController(this.context);

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  void initializeNotification() async {
    tz.initializeTimeZones();

    //setting android notification settings
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    //setting ios notification settings
    const iosSettings = IOSInitializationSettings();
    const initializationSettings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onSelectNotification: onSelectNotification,
    );

    showNotification();
  }

  //when notification is clicked, app opens with splash screen
  void onSelectNotification(String? payload) async {}

  //function to show notification
  Future showNotification() async {
    //getting current timezone
    final String currentTimeZone =
        await FlutterNativeTimezone.getLocalTimezone();

    //setting timezone
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    // show notifications at particular time
    showZonedNotification(
      dateTime: tz.TZDateTime(tz.local, 2022, 1, 1, 10, 00, 0, 0, 0),
      androidId: 'n1',
      androidName: 'n1_name',
      notificationTitle: 'Hey there 👋',
      notificationBody: 'Start your day with BlackPad',
      notificationId: 0,
    );
    showZonedNotification(
      dateTime: tz.TZDateTime(tz.local, 2022, 1, 1, 21, 00, 0, 0, 0),
      androidId: 'n2',
      androidName: 'n2_name',
      notificationTitle: 'Write down before you sleep',
      notificationBody: 'Note your plans/tasks for the next day',
      notificationId: 1,
    );
  }

  void showZonedNotification({
    required tz.TZDateTime dateTime,
    required String androidId,
    required String androidName,
    required String notificationTitle,
    required String notificationBody,
    required int notificationId,
  }) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      androidId,
      androidName,
      channelDescription: 'description',
      importance: Importance.max,
      priority: Priority.high,
    );

    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    //showing notification here
    await flutterLocalNotificationsPlugin.zonedSchedule(
      notificationId,
      notificationTitle,
      notificationBody,
      dateTime,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,

      //with this setting notification will be displayed at same time each day
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }
}
