import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseMessagingHelper {
  static Future<String?> getToken() async {
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    String? token = await FirebaseMessaging.instance.getToken();
    return token;
  }
}
