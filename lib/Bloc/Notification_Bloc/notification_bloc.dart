import 'dart:async';
import 'package:appname/Models/Notication_Model/notification_model.dart';

import '../../Service/Notification_Service/notification_service.dart';
import '../bloc.dart';

class NotificationBloc implements Bloc {
  StreamController<bool> getDataController = StreamController<bool>();
  NotificationService notificationService = NotificationService();
  List<NotificationModel> notiList = [];
  //String userId = "";

  Future<void> initPage(String data) async {
    await notificationService
        .getNotificationList(data)
        .then((value) => {notiList = value, getDataController.sink.add(true)});
  }

  @override
  void dispose() {
    getDataController.close();
  }
}
