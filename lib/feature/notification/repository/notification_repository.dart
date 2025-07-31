import 'package:dio/dio.dart';

class NotificationRepository {

 static  final dio = Dio();


  static Future<void> sendNotification({required String title, required String body, required String friendId}) async{
     try{
       await dio.post('https://api.onesignal.com/notifications?c=push',
           options: Options(
             headers: {
               'Authorization': 'key os_v2_app_oheyniyqrvbbpimvqhunv3ifbjsjchsjgbze3k5u5xmx45hsvuonznvg7p3l77znsf3panbktp4roktdfa3z5sijc3mblkx6mdybayy',
             }
           ),
           data: {
             "app_id": "71c986a3-108d-4217-a195-81e8daed050a",
             "headings": {
               "en": title
             },
             "contents": {
               "en": body
             },
             "priority": "URGENT",
             "android_channel_id": "84783d9b-000f-4448-a4f1-f29281a884a4",

             "include_aliases": {
               "external_id": [
                 friendId
               ]
             },
             "target_channel": "push"
           });
     }on DioException catch(e){
       throw '${e.message}';
     }
  }
}