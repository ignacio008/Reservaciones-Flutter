

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class QuerysService{

  final _fireStore = FirebaseFirestore.instance;


  Future<QuerySnapshot>getAdmin(id)async{
    return await _fireStore.collection("usuarios").where("id",isEqualTo:id).get();
  }
  //para ver login
  Future<DocumentSnapshot> getAdimDocument(id) async{
   return await _fireStore.collection("usuarios").doc(id).get();
   }

    Future<bool> SaveGeneralInfo({String reference, String id, Map<String, dynamic> collectionValues}) async {
    bool error = false;
    SetOptions setOptions = SetOptions(merge: true);
    return await _fireStore.collection(reference).doc(id).set(collectionValues, setOptions).catchError((onError){
      error = true;
      return true;
    }).then((onValue){
      if(!error){
        error = false;
        return error;
      }
      else{
        error = true;
        return error;
      }
    });
  }
  Future<QuerySnapshot> getTopChanel() async{
    return await _fireStore.collection("localizacion").orderBy("id").get();
  }

   Future<bool> actualizarInfo({String reference, String id, Map<String, dynamic> collectionValues}) async {
    bool error = false;
    return await _fireStore.collection(reference).doc(id).update(collectionValues).catchError((onError){
      error = true;
      return true;
    }).then((onValue){
      if(!error){
        error = false;
        return error;
      }
      else{
        error = true;
        return error;
      }
    });
  }

    Future<bool> SaveGeneralInfoTienda({String reference, String id, Map<String, dynamic> collectionValues}) async {
    bool error = false;
    SetOptions setOptions = SetOptions(merge: true);
    return await _fireStore.collection(reference).doc(id).set(collectionValues, setOptions).catchError((onError){
      error = true;
      return true;
    }).then((onValue){
      if(!error){
        error = false;
        return error;
      }
      else{
        error = true;
        return error;
      }
    });
  }

  Future<bool> actualizarTienda({String reference, String id, Map<String, dynamic> collectionValues}) async {
    bool error = false;
    return await _fireStore.collection(reference).doc(id).update(collectionValues).catchError((onError){
      error = true;
      return true;
    }).then((onValue){
      if(!error){
        error = false;
        return error;
      }
      else{
        error = true;
        return error;
      }
    });
  }
  Future<bool> actualizarDatosTienda({String reference, String id, Map<String, dynamic> collectionValues}) async {
    bool error = false;
    return await _fireStore.collection(reference).doc(id).update(collectionValues).catchError((onError){
      error = true;
      return true;
    }).then((onValue){
      if(!error){
        error = false;
        return error;
      }
      else{
        error = true;
        return error;
      }
    });
  }
    Future<bool> actualizarMapa({String reference, String id, Map<String, dynamic> collectionValues}) async {
    bool error = false;
    return await _fireStore.collection(reference).doc(id).update(collectionValues).catchError((onError){
      error = true;
      return true;
    }).then((onValue){
      if(!error){
        error = false;
        return error;
      }
      else{
        error = true;
        return error;
      }
    });
  }

   Future<bool> deleteDocument({String reference, String idDocument}) async {
    bool error = false;
    return await _fireStore.collection(reference).doc(idDocument).delete().catchError((onError){
      error = true;
    }).then((onValue){
      return error;
    });
  }
   Future<bool> deleteNotificaciones({String reference, String idDocument}) async {
    bool error = false;
    return await _fireStore.collection(reference).doc(idDocument).delete().catchError((onError){
      error = true;
    }).then((onValue){
      return error;
    });
  }


      Future<bool> SaveGeneralInfoServicios({String reference, String id, Map<String, dynamic> collectionValues}) async {
    bool error = false;
    SetOptions setOptions = SetOptions(merge: true);
    return await _fireStore.collection(reference).doc(id).set(collectionValues, setOptions).catchError((onError){
      error = true;
      return true;
    }).then((onValue){
      if(!error){
        error = false;
        return error;
      }
      else{
        error = true;
        return error;
      }
    });
  }
  Future<bool> actualizarServicios({String reference, String id, Map<String, dynamic> collectionValues}) async {
    bool error = false;
    return await _fireStore.collection(reference).doc(id).update(collectionValues).catchError((onError){
      error = true;
      return true;
    }).then((onValue){
      if(!error){
        error = false;
        return error;
      }
      else{
        error = true;
        return error;
      }
    });
  }


    Future<bool> SaveGeneralReservar({String reference, String id, Map<String, dynamic> collectionValues}) async {
    bool error = false;
    SetOptions setOptions = SetOptions(merge: true);
    return await _fireStore.collection(reference).doc(id).set(collectionValues, setOptions).catchError((onError){
      error = true;
      return true;
    }).then((onValue){
      if(!error){
        error = false;
        return error;
      }
      else{
        error = true;
        return error;
      }
    });
  }

   Future<bool> actualizarReserva({String reference, String id, Map<String, dynamic> collectionValues}) async {
    bool error = false;
    return await _fireStore.collection(reference).doc(id).update(collectionValues).catchError((onError){
      error = true;
      return true;
    }).then((onValue){
      if(!error){
        error = false;
        return error;
      }
      else{
        error = true;
        return error;
      }
    });
  }


Future<bool> actualizarReservaFinish({String reference, String id, Map<String, dynamic> collectionValues}) async {
    bool error = false;
    return await _fireStore.collection(reference).doc(id).update(collectionValues).catchError((onError){
      error = true;
      return true;
    }).then((onValue){
      if(!error){
        error = false;
        return error;
      }
      else{
        error = true;
        return error;
      }
    });
  }

  Future<bool> SaveGeneralInfoNotification({String reference, String id, Map<String, dynamic> collectionValues}) async {
    bool error = false;
    SetOptions setOptions = SetOptions(merge: true);
    return await _fireStore.collection(reference).doc(id).set(collectionValues, setOptions).catchError((onError){
      error = true;
      return true;
    }).then((onValue){
      if(!error){
        error = false;
        return error;
      }
      else{
        error = true;
        return error;
      }
    });
  }


   Future<bool> actualizarNotification({String reference, String id, Map<String, dynamic> collectionValues}) async {
    bool error = false;
    return await _fireStore.collection(reference).doc(id).update(collectionValues).catchError((onError){
      error = true;
      return true;
    }).then((onValue){
      if(!error){
        error = false;
        return error;
      }
      else{
        error = true;
        return error;
      }
    });
  }

   Future<bool> SaveGeneralFinishReservation({String reference, String id, Map<String, dynamic> collectionValues}) async {
    bool error = false;
    SetOptions setOptions = SetOptions(merge: true);
    return await _fireStore.collection(reference).doc(id).set(collectionValues, setOptions).catchError((onError){
      error = true;
      return true;
    }).then((onValue){
      if(!error){
        error = false;
        return error;
      }
      else{
        error = true;
        return error;
      }
    });
  }

   Future<bool> SaveGeneralFinishNota({String reference, String id, Map<String, dynamic> collectionValues}) async {
    bool error = false;
    SetOptions setOptions = SetOptions(merge: true);
    return await _fireStore.collection(reference).doc(id).set(collectionValues, setOptions).catchError((onError){
      error = true;
      return true;
    }).then((onValue){
      if(!error){
        error = false;
        return error;
      }
      else{
        error = true;
        return error;
      }
    });
  }

  Future<bool> SaveGeneralURL({String reference, String id, Map<String, dynamic> collectionValues}) async {
    bool error = false;
    SetOptions setOptions = SetOptions(merge: true);
    return await _fireStore.collection(reference).doc(id).set(collectionValues, setOptions).catchError((onError){
      error = true;
      return true;
    }).then((onValue){
      if(!error){
        error = false;
        return error;
      }
      else{
        error = true;
        return error;
      }
    });
  }





  Future<QuerySnapshot> getTopTienda() async{
    return await _fireStore.collection("tienda").orderBy("idShop").get();
  }
  Future<QuerySnapshot> getTopReservas() async{
    return await _fireStore.collection("reservas").orderBy("idShop").get();
  }
  //sin eel async ni await
  Future<QuerySnapshot> getTiendaMia(String reference) {
    return  _fireStore.collection("tienda").where("idUsuario", isEqualTo: reference).get();
  }
   Future<QuerySnapshot> getTiendaCategory(String reference) {
    return  _fireStore.collection("tienda").where("category", isEqualTo: reference).get();
  }

  Future<QuerySnapshot> getTiendaPublicidad(String reference) {
    return  _fireStore.collection("tienda").where("idShop", isEqualTo: reference).get();
  }


  Future<QuerySnapshot> getService(String reference) {
    return  _fireStore.collection("servicios").where("idShop", isEqualTo: reference).get();
  }

//la ultima fecha agregada hacia abajo
  Future<QuerySnapshot> getMyReservacion(String reference) {
    return  _fireStore.collection("reservas").where("idUser", isEqualTo: reference).orderBy("createAtReservation",  descending: true).get();
  }
  Future<QuerySnapshot> getMyReservacionFinish(String reference, int finishReservation, String idShop) {
    return  _fireStore.collection("reservas").where("idUser", isEqualTo: reference).where("finishReservation",isEqualTo: finishReservation).where("idShop",isEqualTo: idShop).orderBy("createAtReservation").get();
  }
  

  Future<QuerySnapshot> getMyNotification(String reference ,int referencia2, ) {
    return  _fireStore.collection("notification").where("idUser", isEqualTo: reference).where("status", isGreaterThan: referencia2).get();
  }
   Future<QuerySnapshot> getMyNotificationcompuedto(String reference, int refrencia2) {
    return  _fireStore.collection("notification").where("idUserShop", isEqualTo: reference).where("status", isEqualTo: refrencia2).orderBy("createNotification",  descending: true ) .get();
  }
  

   Future<QuerySnapshot> getMyNotificationUsuarioMio(String reference) {
    return  _fireStore.collection("notification").where("idUser", isEqualTo: reference).get();
  }

  Future<QuerySnapshot> getMyFinish(String reference ,String referencia2, ) {
    return  _fireStore.collection("finishReservas").where("idUsuarioScanner", isEqualTo: reference).where("idShop", isEqualTo: referencia2,  ).orderBy("createReservationFinish").get();
  }

  Future<QuerySnapshot> getMyNotaFinis(String reference ,String referencia2, ) {
    return  _fireStore.collection("nota").where("idUsuarioScanner", isEqualTo: reference).where("idShop", isEqualTo: referencia2,  ).orderBy("createNotaFinish").get();
  }

  

  Future<QuerySnapshot> getMyPublicidadUrl() async{
    return await _fireStore.collection("publicidadAdmin").orderBy("createPublicidad").get();
  }

  Future<QuerySnapshot> getMyPublicidadFomrularios(String reference) {
    return  _fireStore.collection("publicidadAdmin").where("idPublicidad", isEqualTo: reference).get();
  }

}