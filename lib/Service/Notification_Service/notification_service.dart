import 'package:appname/Models/Notication_Model/notification_model.dart';
import 'package:http/http.dart' as http;


class NotificationService {
  Future<List<NotificationModel>> getNotificationList(String userId) async {
    var response = await http.get(
      Uri.parse("http://localhost:3000/notifications?userId=" + userId),
    );
    if (response.statusCode == 200) {
      var result = notificationModelFromJson(response.body);
      return result;
    } else {
      throw Exception('Failed');
    }
  }
}
