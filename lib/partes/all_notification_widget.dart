import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/models/notification_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';


class AllNotificationWidget extends StatefulWidget {
  NotificationModel iconmodelNotification;
  UsuarioModel iconmodelUser;
  AllNotificationWidget(this.iconmodelNotification,this.iconmodelUser,);

  @override
  State<AllNotificationWidget> createState() => _AllNotificationWidgetState();
}

class _AllNotificationWidgetState extends State<AllNotificationWidget> {
  DateTime hoy =DateTime.now();
   
   elimnarNotificacionesPasadas(String idNotificacion)async{

     if(widget.iconmodelNotification.reservationDate.isBefore(hoy)){
     bool erroguardar=await QuerysService().deleteNotificaciones(reference: "notification",idDocument: idNotificacion);
     }
 

   }
   
   @override
   void initState() {
   elimnarNotificacionesPasadas(widget.iconmodelNotification.idNotification);
     super.initState();
     
   }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.8,
      height:MediaQuery.of(context).size.height*0.2,
      padding:EdgeInsets.all(20),
      decoration: BoxDecoration(
        color:widget.iconmodelNotification.status==1?Colors.green:Colors.red,
        borderRadius:BorderRadius.circular(8),
      ),
      child:widget.iconmodelNotification.status==1? Column(
        children:[
             Icon(Icons.check_circle,
            color: Colors.white,
            size: 40.0,
      ),
          Text("¡Felicidades!", style:TextStyle(color:Colors.white, fontSize: 20 )),
          SizedBox(height:10),
          Text("Su reservacion ha sido aprobada", style:TextStyle(color:Colors.white, fontSize: 18 )),
          Text('Por la tienda "${widget.iconmodelNotification.nameShop}"', style:TextStyle(color:Colors.white, fontSize: 18 )),
        ],
      ):widget.iconmodelNotification.status==2?
      Column(children: [
         Icon(Icons.cancel,
            color: Colors.white,
            size: 40.0,
      ),
          Text("Lo sentimos!", style:TextStyle(color:Colors.white, fontSize: 20 )),
          SizedBox(height:10),
          Text("Su reservacion ha sido rechazada", style:TextStyle(color:Colors.white, fontSize: 18 )),
          Text('Por la tienda "${widget.iconmodelNotification.nameShop}"', style:TextStyle(color:Colors.white, fontSize: 18 )),
          
      ],)

      :
      Column(children: [
        Text("Por favor complete el formulario"),
        Text("${widget.iconmodelNotification.status}"),
        Text("${widget.iconmodelNotification.nameUser}"),
      ],),
    );
  }
}