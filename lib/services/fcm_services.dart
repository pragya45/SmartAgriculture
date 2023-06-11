import 'dart:convert';
import 'package:http/http.dart' as http;

class FCMService {
  static const String FCMAPI =
      "AAAASbCGzIs:APA91bFbsJhJg2wwTtRZWautx1gT8txUDHj8JXeXetWhs6NH7SWFPxeqK6Tx03eC6RHjypFxRO3VlzyhjlxDDVcN455Pjm3Q0LU8tlzORWv6PYiO2V8NawFyts_zVaX1uUCzFpjbOrW_";
  static String makePayLoadWithToken(String? token, Map<String, dynamic> data,
      Map<String, dynamic> notification) {
    return jsonEncode({
      'to': token,
      'data': data,
      'notification': notification,
    });
  }

  static String makePayLoadWithTopic(String? topic, Map<String, dynamic> data,
      Map<String, dynamic> notification) {
    return jsonEncode({
      'topic': topic,
      'data': data,
      'notification': notification,
    });
  }

  static Future<void> sendPushMessage(String? token, Map<String, dynamic> data,
      Map<String, dynamic> notification) async {
    try {
      await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'key=$FCMAPI'
        },
        body: makePayLoadWithToken(token, data, notification),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }
}
