import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' show Encoding, json;


class PostMessagin{
     final postUrl = Uri.parse('https://fcm.googleapis.com/fcm/send');
  String comida="Nose";


PostMessagin({this.comida});


    Map<String, dynamic> toJsonBody(comida) =>
          {
           "notification": {"body": "este es un nuevo mensaje", "title": "Prueba"},
    "priority": "high",
    "data": {
      "click_action": "FLUTTER_NOTIFICATION_CLICK",
      "comida": comida,
      "status": "done"
    },
    "to": "fr-hv4r1TqucqAh1eohElT:APA91bH4c-bzPMWAAxCUqdlRzEX43eq9C7Zjs9_U2WJkUKw23c6doF-1Ftd6hBRqNoC2t_JEjOsMVpKBwJQCNeTosFrUQTb2rzhQM8xaysN7AA5s5fT0OIu7VeYU2YRDdUX9bJYWJcHk"
            
            
          };


  final data = {
    "notification": {"body": "este es un nuevo mensaje", "title": "Prueba"},
    "priority": "high",
    "data": {
      "click_action": "FLUTTER_NOTIFICATION_CLICK",
      "comida": "nose",
      "status": "done"
    },
    "to": "fr-hv4r1TqucqAh1eohElT:APA91bH4c-bzPMWAAxCUqdlRzEX43eq9C7Zjs9_U2WJkUKw23c6doF-1Ftd6hBRqNoC2t_JEjOsMVpKBwJQCNeTosFrUQTb2rzhQM8xaysN7AA5s5fT0OIu7VeYU2YRDdUX9bJYWJcHk"
  };

   Future<bool> makeCall() async {
    final headers = {
      'content-type': 'application/json',
      'Authorization': 'key=AAAAm8Ge_mE:APA91bGyP7_gtFiq6EKKPOCPiDJv3GQzyizcA_3GZAWd9ph0kt8cRlLrDaJMEWMetrI1R5JrqR9qmVA8q6YW4dXgOgvjEcPJdUMEEG2A9onRPk6gA5T1gFq1qOzihjwjG-DeIHGAXm0B'
    };

    final response = await http.post(postUrl,
        body: json.encode(data),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);

    if (response.statusCode == 200) {
      
      return true;
    } else {
     
      return false;
    }
  }


}