

import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/models/admin_publicidad_model.dart';
import 'package:z04_app_reservas_firebase/models/ejemploMapa.dart';
import 'package:z04_app_reservas_firebase/models/finish_model.dart';
import 'package:z04_app_reservas_firebase/models/nota_model.dart';
import 'package:z04_app_reservas_firebase/models/notification_model.dart';
import 'package:z04_app_reservas_firebase/models/reservacion_model.dart';
import 'package:z04_app_reservas_firebase/models/service_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';

class FetchData{

     Future <UsuarioModel> getAdmin(id)async{  
      final messages= await QuerysService().getAdimDocument(id);
      dynamic  miinfo=messages;
      print(miinfo.data().toString());
      UsuarioModel adminmodel = UsuarioModel().getUsuario(miinfo);
      return adminmodel;
     }

   

  Future<List>getTopChanels()async{
    List<MapaModel>iconlistTopChanel=[];
    final messages= await QuerysService().getTopChanel();
    dynamic  miinfo=messages.docs;
    iconlistTopChanel=MapaModel().getIconTopChanel(miinfo);
    return iconlistTopChanel;
    
  }
  Future<List>getTopTienda()async{
    List<TiendaModel>iconlistTopChanel=[];
    final messages= await QuerysService().getTopTienda();
    dynamic  miinfo=messages.docs;
    iconlistTopChanel=TiendaModel().getTienda(miinfo);
    return iconlistTopChanel;
    
  }
   Future<List>getTopResevation()async{
    List<Reservation>iconlistTopChanel=[];
    final messages= await QuerysService().getTopReservas();
    dynamic  miinfo=messages.docs;
    iconlistTopChanel=Reservation().getReservation(miinfo);
    return iconlistTopChanel;
    
  }
  Future<List>getTopTiendaMia(String idUsuario)async{
    List<TiendaModel>iconlistTopChanel=[];
    final messages= await QuerysService().getTiendaMia(idUsuario);
    dynamic  miinfo=messages.docs;
    iconlistTopChanel=TiendaModel().getTienda(miinfo);
    return iconlistTopChanel;
    
  }
  Future<List>getTopTiendaCategory(String category)async{
    List<TiendaModel>iconlistTopChanel=[];
    final messages= await QuerysService().getTiendaCategory(category);
    dynamic  miinfo=messages.docs;
    iconlistTopChanel=TiendaModel().getTienda(miinfo);
    return iconlistTopChanel;
    
  }

  Future<List>getTopTiendaPublicidad(String idShop)async{
    List<TiendaModel>iconlistTopChanel=[];
    final messages= await QuerysService().getTiendaPublicidad(idShop);
    dynamic  miinfo=messages.docs;
    iconlistTopChanel=TiendaModel().getTienda(miinfo);
    return iconlistTopChanel;
    
  }

   Future<List>getTopServicios(String idShop)async{
    List<Service>iconlistTopChanel=[];
    final messages= await QuerysService().getService(idShop);
    dynamic  miinfo=messages.docs;
    iconlistTopChanel=Service().getServicees(miinfo);
    return iconlistTopChanel;
    
  }

   Future<List>getTopMyReservation(String idUser)async{
    List<Reservation>iconlistTopChanel=[];
    final messages= await QuerysService().getMyReservacion(idUser);
    dynamic  miinfo=messages.docs;
    iconlistTopChanel=Reservation().getReservation(miinfo);
    return iconlistTopChanel;
    
  }

  Future<List>getTopMyReservationFinish(String idUser, int finishReservation, String idShop)async{
    List<Reservation>iconlistTopChanel=[];
    final messages= await QuerysService().getMyReservacionFinish(idUser,finishReservation, idShop);
    dynamic  miinfo=messages.docs;
    iconlistTopChanel=Reservation().getReservation(miinfo);
    return iconlistTopChanel;
    
  }
    
  //   Future<List>getTopMynotification(String idUser)async{
  //   List<NotificationModel>iconlistTopChanel=[];
  //   final messages= await QuerysService().getMyNotification(idUser);
  //   dynamic  miinfo=messages.docs;
  //   iconlistTopChanel=NotificationModel().getNotification(miinfo);
  //   return iconlistTopChanel;
    
  // }

  Future<List>getTopMynotificationes(String idUser,int status)async{
    List<NotificationModel>iconlistTopChanel=[];
    final messages= await QuerysService().getMyNotificationcompuedto(idUser,status);
    dynamic  miinfo=messages.docs;
    iconlistTopChanel=NotificationModel().getNotification(miinfo);
    return iconlistTopChanel;
  }


   Future<List>getTopMynotificationUsuario(String idUser, int status, )async{
    List<NotificationModel>iconlistTopChanel=[];
    final messages= await QuerysService().getMyNotification(idUser, status, );
    dynamic  miinfo=messages.docs;
    iconlistTopChanel=NotificationModel().getNotification(miinfo);
    return iconlistTopChanel;
    
  }


   Future<List>getTopMyfinished(String idUser, String idShop, )async{
    List<FinishModel>iconlistTopChanel=[];
    final messages= await QuerysService().getMyFinish(idUser, idShop );
    dynamic  miinfo=messages.docs;
    iconlistTopChanel=FinishModel().getFinish(miinfo);
    return iconlistTopChanel;
    
  }



  Future<List>getTopPublicidadUrl()async{
    List<AdminModel>iconlistTopChanel=[];
    final messages= await QuerysService().getMyPublicidadUrl();
    dynamic  miinfo=messages.docs;
    iconlistTopChanel=AdminModel().getTienda(miinfo);
    return iconlistTopChanel;
    
  }

  Future<List>getTopPublicidadFormulario(String idPublicidad)async{
    List<AdminModel>iconlistTopChanel=[];
    final messages= await QuerysService().getMyPublicidadFomrularios(idPublicidad);
    dynamic  miinfo=messages.docs;
    iconlistTopChanel=AdminModel().getTienda(miinfo);
    return iconlistTopChanel;
    
  }

  
}