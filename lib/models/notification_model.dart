import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' show Encoding, json;

import 'package:intl/intl.dart';
class NotificationModel{
  String idNotification;
  String idShop;
  String idUser;
  String idReservation;
  String nameUser;
  String lastUser;
  String nameShop;
  String nameService;
  String numberPhone;
  DateTime reservationDate;
  String myToken;
  int status;
  String body;
  String title;
  String shopToken;
  DateTime createNotification;
  String idUserShop;
  final postUrl = Uri.parse('https://fcm.googleapis.com/fcm/send');
  


  NotificationModel({this.idNotification,this.idShop,this.idUser,this.idReservation,this.nameUser,this.lastUser,this.nameShop,this.nameService,this.numberPhone,this.reservationDate,this.myToken, this.status, this.body, this.title, this.shopToken, this.createNotification, this.idUserShop});

  
   List  <NotificationModel> getNotification(dynamic miInfo){
      List<NotificationModel>iconmodelLits=[];


   
for(var datos in miInfo){
      final idNotification_ = datos.data()['idNotification']?? null;; 
      final idShop_ = datos.data()['idShop']?? null;; 
      final idUser_ = datos.data()['idUser']?? null;; 
      final idReservation_ = datos.data()['idReservation']?? null;; 
      final nameUser_ = datos.data()['nameUser']?? null;; 
      final lastUser_ = datos.data()['lastUser']?? null;; 
      final nameShop_ = datos.data()['nameShop']?? null;; 
      final nameService_ = datos.data()['nameService']?? null;; 

      final numberPhone_ = datos.data()['numberPhone']?? null;; 
      final reservationDate_ = datos.data()['reservationDate']?? null;;  
      final myToken_ = datos.data()['myToken']?? null;;
      final status_ = datos.data()['status']??null;;
      final body_ = datos.data()['body']??null;;
      final title_ = datos.data()['title']??null;;
      final shopToken_ = datos.data()['shopToken']?? null;
      final createNotification_ = datos.data()['createNotification']?? null; 
      final idUserShop_ = datos.data()['idUserShop']?? null;

      NotificationModel usuariomodel = NotificationModel(
        idNotification:idNotification_,
        idShop: idShop_,
        idUser: idUser_,
        idReservation:idReservation_,
        nameUser: nameUser_,
        lastUser: lastUser_,
        nameShop:nameShop_,
        nameService:nameService_,
        numberPhone:numberPhone_,
        reservationDate:reservationDate_==null?null:reservationDate_.toDate(),
        myToken:myToken_==null?null:myToken_.toString(),
        status:status_,
        body:body_,
        title:title_,
        shopToken:shopToken_==null?null:shopToken_.toString(),
        createNotification:createNotification_==null?null:createNotification_.toDate(),
        idUserShop:idUserShop_,
      
      );
 iconmodelLits.add(usuariomodel);
}
      return iconmodelLits;
     }

        Map<String, dynamic> toJsonBody(idNotification,idShop,idUser,idReservation,nameUser,lastUser,nameShop, nameService, numberPhone,reservationDate,status,shopToken,myToken,createNotification,idUserShop) =>
          {
            'idNotification':idNotification,
            'idShop':idShop,
            'idUser': idUser,
            'idReservation': idReservation,
            'nameUser':nameUser,
            'lastUser':lastUser,
            'nameShop':nameShop,
            'nameService':nameService,
            'numberPhone':numberPhone,
            'reservationDate':reservationDate,
            'myToken':myToken,
            'status':status,
            'shopToken':shopToken,
            'createNotification':createNotification,
            'idUserShop':idUserShop,

          };

          
        Map<String, dynamic> toJsonBodyActualizarNoti(idNotification,myToken,status,) =>
          {
            'idNotification':idNotification,
           
            'myToken':myToken,
            'status':status,
            

          };
           Map<String, dynamic> toJsonBodyActualizarNotifianl(idUserShop) =>
          {
            
           
            'idUserShop':idUserShop,
            

          };


           Map<String, dynamic> toJsonBody2(body,title,nameUsuario,lastUser,nameShop,nameService,numberPhone,reservationDate,shopToken,myToken,status,idNotification,idReservation) =>
          {
           "notification": {"body": body, "title": title},
    "priority": "high",
    "data": {
      "click_action": "FLUTTER_NOTIFICATION_CLICK",
      "nameUser": nameUsuario,
      "lastUser":lastUser,
      "nameShop":nameShop,
      "nameService":nameService,
      "numberPhone":numberPhone,
       "reservationDate":reservationDate.toString(),
        "shopToken":shopToken,
        "myToken":myToken,
      "status": status,
      "idNotification":idNotification,
      
      "idReservation":idReservation,
    },
    "to": shopToken
            
            
          };


           Future<bool> makeCall(body,title,nameUsuario,lastUser,nameShop,nameService,numberPhone, reservationDate,shopToken ,myToken,status   ,idNotification ,idReservation    ) async {
             
    final headers = {
      'content-type': 'application/json',
      'Authorization': 'key=AAAAm8Ge_mE:APA91bGyP7_gtFiq6EKKPOCPiDJv3GQzyizcA_3GZAWd9ph0kt8cRlLrDaJMEWMetrI1R5JrqR9qmVA8q6YW4dXgOgvjEcPJdUMEEG2A9onRPk6gA5T1gFq1qOzihjwjG-DeIHGAXm0B'
    };

    final response = await http.post(postUrl,
        body: json.encode(toJsonBody2(body,title,nameUsuario,lastUser,nameShop,nameService,numberPhone,reservationDate.toString(),shopToken ,myToken ,status ,idNotification  , idReservation   )),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);

    if (response.statusCode == 200) {
      
      return true;
    } else {
     
      return false;
    }
  }











     Map<String, dynamic> toJsonBodyNotificationCongratulation(body,title,nameUsuario,lastUser,nameShop,nameService,numberPhone,reservationDate,shopToken,myToken,status,idNotification) =>
          {
           "notification": {"body": body, "title": title},
    "priority": "high",
    "data": {
      "click_action": "FLUTTER_NOTIFICATION_CLICK",
      "nameUser": nameUsuario,
      "lastUser":lastUser,
      "nameShop":nameShop,
      "nameService":nameService,
      "numberPhone":numberPhone,
       "reservationDate":reservationDate.toString(),
       "shopToken":shopToken,
       "myToken":myToken,
      "status": status,
      "idNotification":idNotification,
    },
    "to": myToken
            
            
          };

    Future<bool> makeCallCongratulation(body,title,nameUsuario,lastUser,nameShop,nameService,numberPhone, reservationDate,shopToken ,myToken,status   ,idNotification     ) async {
             
    final headers = {
      'content-type': 'application/json',
      'Authorization': 'key=AAAAm8Ge_mE:APA91bGyP7_gtFiq6EKKPOCPiDJv3GQzyizcA_3GZAWd9ph0kt8cRlLrDaJMEWMetrI1R5JrqR9qmVA8q6YW4dXgOgvjEcPJdUMEEG2A9onRPk6gA5T1gFq1qOzihjwjG-DeIHGAXm0B'
    };

    final response = await http.post(postUrl,
        body: json.encode(toJsonBodyNotificationCongratulation(body,title,nameUsuario,lastUser,nameShop,nameService,numberPhone,reservationDate.toString(),shopToken ,myToken ,status ,idNotification )),
        encoding: Encoding.getByName('utf-8'),
        headers: headers);

    if (response.statusCode == 200) {
      
      return true;
    } else {
     
      return false;
    }
  }

  

}