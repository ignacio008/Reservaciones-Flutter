
import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider{
   String nameUser="no-data";
  String lastUser="no-data"; 
  String nameShop="no-data"; 
  String nameService="no-data"; 
  String numberPhone="no-data"; 
  String reservationDate="no-data"; 
  String shopToken="no-data";
  String mytokenUsuraio="no-datas1";
  String status="no-data";
  String idNotification="no-data";
  String idReservation="no-data";
     final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    final _mensajesStreamController = StreamController<List>.broadcast();
    Stream<List> get mensajesUno=>_mensajesStreamController.stream;

    initNotification(){
      _firebaseMessaging.requestPermission();
      // _firebaseMessaging.getToken().then((miToken) {
      //   print("mi Token es: ");
      //   print("mi token essss: ${miToken}");
        // fr-hv4r1TqucqAh1eohElT:APA91bH4c-bzPMWAAxCUqdlRzEX43eq9C7Zjs9_U2WJkUKw23c6doF-1Ftd6hBRqNoC2t_JEjOsMVpKBwJQCNeTosFrUQTb2rzhQM8xaysN7AA5s5fT0OIu7VeYU2YRDdUX9bJYWJcHk
  //https://fcm.googleapis.com/fcm/send
  // key AAAAm8Ge_mE:APA91bGyP7_gtFiq6EKKPOCPiDJv3GQzyizcA_3GZAWd9ph0kt8cRlLrDaJMEWMetrI1R5JrqR9qmVA8q6YW4dXgOgvjEcPJdUMEEG2A9onRPk6gA5T1gFq1qOzihjwjG-DeIHGAXm0B
      // });
     

     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Si se envio');
        print('Mi mensaje data es: ${message.data}');
        print("Mi mensahe es ${message}");
        nameUser= message.data['nameUser']??'no-data';
        lastUser = message.data['lastUser']??'no-data';
        nameShop = message.data['nameShop']??'no-data';
        nameService = message.data['nameService']??'no-data';
        numberPhone = message.data['numberPhone']??'no-data'; 
        reservationDate = message.data['reservationDate']??'no-data';  
        shopToken=message.data['shopToken']??'no-data'; 
        mytokenUsuraio=message.data['myToken']??'no-datas1';
        status=message.data['status']??'no-data';
        idNotification=message.data['idNotification']??'no-data';
        idReservation=message.data['idReservation']??'no-data';
     List nombres=[nameUser,lastUser,nameShop,nameService,numberPhone,reservationDate,shopToken,mytokenUsuraio,status,idNotification,idReservation];
       _mensajesStreamController.sink.add(nombres);
      if (message.notification != null) {
        print('Message: ${message.notification}');
      }
    });


     
     FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage message) {
      print('Si se envio');
      print('Mi mensaje data es: ${message.data}');
      print("Mi mensahe es ${message}");

      nameUser= message.data['nameUser']??'no-data';
      lastUser = message.data['lastUser']??'no-data';
      nameShop = message.data['nameShop']??'no-data';
      nameService = message.data['nameService']??'no-data';
      numberPhone = message.data['numberPhone']??'no-data'; 
      reservationDate = message.data['reservationDate']??'no-data';  
      shopToken=message.data['shopToken']??'no-data'; 
      mytokenUsuraio=message.data['myToken']??'no-datas1';
      status=message.data['status']??'no-data';  
      idNotification=message.data['idNotification']??'no-data';
      idReservation=message.data['idReservation']??'no-data';
    List nombres=[nameUser,lastUser,nameShop,nameService,numberPhone,reservationDate,shopToken,mytokenUsuraio,status,idNotification,idReservation];
  
     _mensajesStreamController.sink.add(nombres);
      if (message.notification != null) {
        print('Message: ${message.notification}');
        }
     });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      nameUser= message.data['nameUser']??'no-data';
      lastUser = message.data['lastUser']??'no-data';
      nameShop = message.data['nameShop']??'no-data';
      nameService = message.data['nameService']??'no-data';
      numberPhone = message.data['numberPhone']??'no-data'; 
      reservationDate = message.data['reservationDate']??'no-data';  
      shopToken=message.data['shopToken']??'no-data'; 
      mytokenUsuraio=message.data['myToken']??'no-datas1';
      status=message.data['status']??'no-data';  
      idNotification=message.data['idNotification']??'no-data';
      idReservation=message.data['idReservation']??'no-data';
    List nombres=[nameUser,lastUser,nameShop,nameService,numberPhone,reservationDate,shopToken,mytokenUsuraio,status,idNotification,idReservation];

   _mensajesStreamController.sink.add(nombres);

      if (message.notification != null) {
        print('Message: ${message.notification}');
        }
     

    });
    
  }

    dispose(){
      _mensajesStreamController?.close();
    }
}






//https://fcm.googleapis.com/fcm/send
// {
// 	"to":"fr-hv4r1TqucqAh1eohElT:APA91bH4c-bzPMWAAxCUqdlRzEX43eq9C7Zjs9_U2WJkUKw23c6doF-1Ftd6hBRqNoC2t_JEjOsMVpKBwJQCNeTosFrUQTb2rzhQM8xaysN7AA5s5fT0OIu7VeYU2YRDdUX9bJYWJcHk",
// 	"notification":{
// 		"title": "Envio de mensaje Postman",
// 		"body":"Se envio desde un servicio"
// 	},
// 	"data":{
// 		"comida":"Envios de reservacion"
// 	}
	
	
// }