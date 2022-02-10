import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/models/notification_model.dart';
import 'package:z04_app_reservas_firebase/models/reservacion_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/notification_user.dart';
import 'package:z04_app_reservas_firebase/providers/push_provider_notification.dart';

class AllNotificationShoppWidget extends StatefulWidget {
    NotificationModel iconmodelNotification;
  UsuarioModel iconmodelUser;
  AllNotificationShoppWidget(this.iconmodelNotification,this.iconmodelUser,);

  @override
  State<AllNotificationShoppWidget> createState() => _AllNotificationShoppWidgetState();
}

class _AllNotificationShoppWidgetState extends State<AllNotificationShoppWidget> {

   List iconmodellistnotificationCongratulation=[];
  DateTime hoy =DateTime.now();
   
   elimnarNotificacionesPasadas(String idNotificacion)async{

     if(widget.iconmodelNotification.reservationDate.isBefore(hoy)){
     bool erroguardar=await QuerysService().deleteNotificaciones(reference: "notification",idDocument: idNotificacion);
     }
 

   }

   @override
  void initState() {
    elimnarNotificacionesPasadas(widget.iconmodelNotification.idNotification);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(

      width: MediaQuery.of(context).size.width*0.94,
      height:MediaQuery.of(context).size.height*0.29,
     
      decoration: BoxDecoration(
        color:Colors.black,
        borderRadius: BorderRadius.circular(8),
      
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.57,
      height:MediaQuery.of(context).size.height*0.29,
     
        padding: EdgeInsets.all(11),
            child: Column(
              children:[
                 SizedBox(height:15),
                Text("Tienes una reservacion ",style:TextStyle(fontSize:16, fontWeight:FontWeight.bold,color:Colors.white),),
                  SizedBox(height:15),
                 Row(
                   children: [
                     Text("El dia: ${DateFormat('dd-MM-yyyy').format(widget.iconmodelNotification.reservationDate)}"
                ,style:TextStyle(fontSize:15,color:Colors.white)),
                   ],
                 ),
                    SizedBox(height:5),
                  Row(
                    children: [
                      Text("A las:  ${DateFormat('kk:mm a').format(widget.iconmodelNotification.reservationDate)}",style:TextStyle(fontSize:15,color:Colors.white)),
                    ],
                  ),

                   SizedBox(height:5),
                   Row(
                    children: [
                      Flexible(child: Text("En tu tienda: ${widget.iconmodelNotification.nameShop}",style:TextStyle(fontSize:15,color:Colors.white), maxLines: 2,)),
                    ],
                  ),
                   SizedBox(height:10),
                   Row(
                    children: [
                      Flexible(child: Text("Por el servicio: ${widget.iconmodelNotification.nameService}",style:TextStyle(fontSize:15, color:Colors.white), maxLines: 2,)),
                    ],
                  ),

                   SizedBox(height:10),
                   Row(
                    children: [
                    
                       Flexible(child: Text(" Por el usuario: ${widget.iconmodelNotification.nameUser} ",style:TextStyle(fontSize:15, color:Colors.white), maxLines: 2,)),
                    ],
                  ),
                  SizedBox(height:10),
                   Row(
                    children: [
                      Text("Tel: ${widget.iconmodelNotification.numberPhone}",style:TextStyle(fontSize:15, color:Colors.white)),
                    ],
                  ),




              
              ],
            ),
          ),



           Container(
                width: MediaQuery.of(context).size.width*0.36,
      height:MediaQuery.of(context).size.height*0.2,
    
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap:(){
                          confirmarReserva();
                      },
                      child: Container(
                          width: 100,
                           height:50,
                           decoration:BoxDecoration(
                             color:Colors.blue,
                             borderRadius: BorderRadius.circular(8),
                           ),
                        child: Center(child: Text("Confirmar",style:TextStyle(fontSize:15, color:Colors.white))),
                      ),
                    ),
                  ],
                ),

                  SizedBox(height:20),
                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap:(){

                      },
                      child: Container(
                          width: 100,
                           height:50,
                           decoration:BoxDecoration(
                             color:Colors.red,
                             borderRadius: BorderRadius.circular(8),
                           ),
                        child: Center(child: Text("Rechazar",style:TextStyle(fontSize:15, color:Colors.white))),
                      ),
                    ),
                  ],
                ),


              ],
          ),
           ),
        ],
      )
    

    );
  }


  void confirmarReserva()async {
    int status=1;
String confimacion="Se ha enviado la confirmacion de su reservacion al usuario";
String error="error en notification";
String errorReserva="Error en reserva";
       bool erroguardar=await QuerysService().actualizarNotification(reference: "notification", id:widget.iconmodelNotification.idNotification, collectionValues:NotificationModel().toJsonBodyActualizarNoti(widget.iconmodelNotification.idNotification,
       widget.iconmodelNotification.shopToken,status
     
     
     ),);

      if(erroguardar){
      showToast(error);
      }else{

          bool erroguardaReservr=await QuerysService().actualizarReserva(reference: "reservas", id:widget.iconmodelNotification.idReservation, collectionValues:Reservation().toJsonBodyActualizarReservation(widget.iconmodelNotification.idReservation,status
     ),);

         if(erroguardaReservr){
      showToast(error);

         }else{
    
        
        String body="Felicidades su reservacion ha sido aprobada";
        String title="Feclicidades";
    final notificacionReservar= NotificationModel();
          notificacionReservar.makeCallCongratulation(body,title,widget.iconmodelNotification.nameUser,widget.iconmodelNotification.lastUser,
          widget.iconmodelNotification.nameShop,
          widget.iconmodelNotification.nameService,
         widget.iconmodelNotification.numberPhone,
           widget.iconmodelNotification.reservationDate,
           widget.iconmodelNotification.shopToken,
           widget.iconmodelNotification.myToken,
          status,
         widget.iconmodelNotification.idNotification,
         
          );

   
    showToast(confimacion);  
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(widget.iconmodelUser,status))); 
         }
      }
      


  }
   void showToast(mensaje) {
    Fluttertoast.showToast(
        msg: mensaje,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 14.0,
    );
  }
}