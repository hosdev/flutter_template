import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_template/core/routing/navigation_controller.dart';

final notificationsProvider = Provider<NotificationsManager>((ref) {
  return NotificationsManager(router: ref.read(goRouterProvider));
});

class NotificationsManager {
  final GoRouter router;
  NotificationsManager({required this.router});
  bool listened = false;
  FCM fcm = FCM();
  LocalNotification notificationsApp = LocalNotification();

  void init() async {
    await fcm.init();
    await notificationsApp.init();
  }

  void listen() {
    if (listened) {
      return;
    }
    fcm.listenForegroundMessages(handleForegroundNotifications);
    fcm.listenMessageOpenedApp(handleFirstOpenNotifications);
    listened = true;
  }

  void handleBackgroundNotifications(RemoteMessage message) {}
  void handleForegroundNotifications(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    if (message.notification != null) {
      notificationsApp.showNotification(notification!, message.data);
      //ToastHelper.showToast(text: notification?.title??"", status: SnakeBarStatus.note);
    }
  }

  void handleFirstOpenNotifications(RemoteMessage message) {
    handleNavigationNotifications(message.data);
  }

  void handleNavigationNotifications(Map<String, dynamic> data) {

  }
}

class FCM {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> init() async {
    requestPermission();
  }

  requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
  }

  static Future<String> getToken() async {
    try {
      return await FirebaseMessaging.instance.getToken() ?? '';
    } catch (e) {
      return '';
    }
  }

  void listenForegroundMessages(
      void Function(RemoteMessage message) handleForegroundNotifications) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      handleForegroundNotifications(message);
    });
  }

  void listenMessageOpenedApp(
      void Function(RemoteMessage message) handleFirstOpenNotifications) {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      handleFirstOpenNotifications(message);
    });
  }

  void listenBackgroundMessage(
      void Function(RemoteMessage message) handleBackgroundNotifications) {
    FirebaseMessaging.onBackgroundMessage((message) async {
      handleBackgroundNotifications(message);
      return;
    });
  }
}

class LocalNotification {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

  final DarwinInitializationSettings initializationSettingsIOS =
      const DarwinInitializationSettings(
    requestSoundPermission: true,
    requestBadgePermission: true,
    requestAlertPermission: true,
  );
  final NotificationDetails platformChannelSpecifics =
      const NotificationDetails(
          android: AndroidNotificationDetails(
    'main',
    'General Mabany Souq',
    importance: Importance.max,
    priority: Priority.high,
  ));

  void showNotification(RemoteNotification notification, payload) async {
    await flutterLocalNotificationsPlugin.show(notification.title.hashCode,
        notification.title, notification.body, platformChannelSpecifics,
        payload: payload != null ? jsonEncode(payload) : null);
  }

  Future<void> init(
      {void Function(NotificationResponse)?
          onDidReceiveNotificationResponse}) async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
      onDidReceiveBackgroundNotificationResponse:
          onDidReceiveNotificationResponse,
    );
  }
}
