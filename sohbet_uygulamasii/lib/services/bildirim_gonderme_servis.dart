
import 'package:http/http.dart' as http;
import 'package:sohbet_uygulamasii/model/mesaj.dart';
import 'package:sohbet_uygulamasii/model/user.dart';

class BildirimGondermeServis {
  Future<bool> bildirimGonder(Mesaj gonderilecekBildirim, MyUser gonderenUser, String token) async {
    String endURL = "https://fcm.googleapis.com/fcm/send";
    String firebaseKey = "AAAApyxNb3M:APA91bGK6mNwvGxTK_wnsPs2S0Hk5QTHRoFS8vGnlEnPZF2llUMYYCC35DNQzBJzFEst_l_SCnUZ1vTJO4OBmTOSliaFK2AGXqLWREzrVFJ7S3r-KKQoPTs_5FKHr1YwavMcyxqTdBLv";
    Map<String, String> headers = {"Content-type": "application/json", "Authorization": "key=$firebaseKey"};

    String json =
        '{ "to" : "$token", "data" : { "message" : "${gonderilecekBildirim.mesaj}", "title": "${gonderenUser.userName} yeni mesaj", "profilURL": "${gonderenUser.profilURL}", "gonderenUserID" : "${gonderenUser.userID}" } }';

    http.Response response = await http.post(endURL, headers: headers, body: json);

    if (response.statusCode == 200) {
      print("işlem basarılı");
    } else {
      /*print("işlem basarısız:" + response.statusCode.toString());
      print("jsonumuz:" + json);*/
    }
  }
}
