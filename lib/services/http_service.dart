import 'dart:convert';
import 'package:http/http.dart';
import '../model/member_model.dart';
import '../model/notification_model.dart';
import 'log_service.dart';

class Network {
  static String SERVER_FCM = "fcm.googleapis.com";

  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization':
    'key=AAAAAHVEZwI:APA91bEJfLt9HB0AkOPAF376nqnZEqzZga6DF-5Vmhp7HsMIeIDDrnK9zFLZ5QwzLJnLIqzwyf90sAiF1sMdya5QBIDKmui8frnnkyMBj8fY-oUQl_rKv-cZC67AEkbtVfLYq5aEbZu7Bj8fY-oUQl_rKv-cZC67AEkbtVfLYq5aEbZu7'
  };

  /* Http Requests */

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    var uri = Uri.https(SERVER_FCM, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  /* Http Apis*/
  static String API_SEND_NOTIF = "/fcm/send";

  /* Http Params */
  static Map<String, dynamic> paramsNotify(Member sender, Member receiver) {
    var notification = Notification(title: "Followed", body: "${sender.fullname} has just been followed");
    var registrationIds = [receiver.device_token];
    var notificationModel = NotificationModel(notification: notification, registrationIds: registrationIds);

    LogService.i(notificationModel.toJson().toString());
    return notificationModel.toJson();
  }

  static Map<String, dynamic> notifyLike(Member sender, Member receiver) {
    Notification notification =
    Notification(title: "Liked", body: "${sender.fullname} has just been liked your post");
    List<String>? ids = [receiver.device_token];
    NotificationModel model =
    NotificationModel(notification: notification, registrationIds: ids);
    return model.toJson();
  }
}