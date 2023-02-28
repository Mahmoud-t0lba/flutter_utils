// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// void firebaseMessagingListener() =>
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {});
//
// void sendNotification(String token) async {
//   String? token = await FirebaseMessaging.instance.getToken();
//   try {
//     Dio().post(
//       'https://fcm.googleapis.com/fcm/send',
//       options: Options(headers: <String, String>{
//         'Content-Type': 'application/json',
//
//         /// TODO : add your server key
//         // 'Authorization': 'key=$serverKey',
//       }),
//       data: jsonEncode(
//         <String, dynamic>{
//           'notification': <String, dynamic>{
//             'title': '',
//             'body': '',
//           },
//           'priority': 'high',
//           'data': <String, dynamic>{
//             'click_action': 'FLUTTER_NOTIFICATION_CLICK',
//             'id': '${DateTime.now().millisecondsSinceEpoch}',
//             'status': 'done'
//           },
//           'to': token,
//         },
//       ),
//     );
//   } catch (_) {}
// }
