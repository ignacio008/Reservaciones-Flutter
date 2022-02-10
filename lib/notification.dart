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

class NotificacionesReservas extends StatefulWidget {
  List nameUser;
  UsuarioModel iconmodel;
  NotificacionesReservas(this.nameUser, this.iconmodel);

  @override
  _NotificacionesReservasState createState() => _NotificacionesReservasState();
}

class _NotificacionesReservasState extends State<NotificacionesReservas> {

  DateTime fecha;
  String formattedTime;
  List iconmodellistnotificationCongratulation=[];
  obtenerFechaNueva(){
   fecha= DateTime.parse(widget.nameUser[5]);
  
  }
  @override
  void initState() {
    // TODO: implement initState
    obtenerFechaNueva();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Notificacion Reserva"),
        elevation:0.0,
        bottomOpacity: 0.0,
        backgroundColor: Colors.blue[700],
      ),
      body:Container(
        height:MediaQuery.of(context).size.height,
              width:MediaQuery.of(context).size.width,
        child:Column(
          children:[
            SizedBox(height:30),

            Container(
              height:MediaQuery.of(context).size.height*0.5,
              width:MediaQuery.of(context).size.width*0.9,
              padding: EdgeInsets.all(20),
              decoration:BoxDecoration(
                color:Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text("Tienes una reservacion ",style:TextStyle(fontSize:18, fontWeight:FontWeight.bold,color:Colors.white),),
                  SizedBox(height:30),
                  Row(
                    children: [
                      Text("El dia: ${DateFormat('dd-MM-yyyy').format(fecha)}"
                      
                      
                      ,style:TextStyle(fontSize:18,color:Colors.white)),
                    ],
                  ),
                    SizedBox(height:20),
                   Row(
                    children: [
                      Text("A las:  ${DateFormat('kk:mm a').format(fecha)}",style:TextStyle(fontSize:18,color:Colors.white)),
                    ],
                  ),
                   SizedBox(height:20),
                   Row(
                    children: [
                      Text("En tu tienda: ${widget.nameUser[2]}",style:TextStyle(fontSize:18,color:Colors.white)),
                    ],
                  ),
                   SizedBox(height:20),
                   Row(
                    children: [
                      Text("Por el servicio: ${widget.nameUser[3]}",style:TextStyle(fontSize:18, color:Colors.white)),
                    ],
                  ),
                    SizedBox(height:20),
                   Row(
                    children: [
                      Text("Por el usuario: ",style:TextStyle(fontSize:18, color:Colors.white)),
                       Flexible(child: Text("${widget.nameUser[0]} ${widget.nameUser[1]}",style:TextStyle(fontSize:18, color:Colors.white), maxLines: 2,)),
                    ],
                  ),
                    SizedBox(height:20),
                   Row(
                    children: [
                      Text("Tel: ${widget.nameUser[4]}",style:TextStyle(fontSize:18, color:Colors.white)),
                    ],
                  ),

                    SizedBox(height:30),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap:(){
                          rechazarReserva();
                        },
                        child: Container(
                          height:55,
                          width:120,
                          decoration: BoxDecoration(
                              color:Colors.red,
                              borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(child: Text("Rechazar",style:TextStyle(fontSize:18, color:Colors.white)))),
                      ),

                      GestureDetector(
                        onTap:(){
                              //confirmar el satus cambia a 1

                              confirmarReserva();
                        },
                        child: Container(
                          height:55,
                          width:120,
                          decoration: BoxDecoration(
                              color:Colors.green,
                              borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(child: Text("Confirmar",style:TextStyle(fontSize:18, color:Colors.white)))),
                      ),
                    ],
                  ),
              

                ],
              )),
          ],
        ),
      ),
    );
  }

  void confirmarReserva()async {
    int status=1;
String confimacion="Se ha enviado la confirmacion de su reservacion al usuario";
String error="error en notification";
String errorReserva="Error en reserva";
       bool erroguardar=await QuerysService().actualizarNotification(reference: "notification", id:widget.nameUser[9], collectionValues:NotificationModel().toJsonBodyActualizarNoti(widget.nameUser[9],
       widget.nameUser[6],status
     
     
     ),);

      if(erroguardar){
      showToast(error);
      }else{

          bool erroguardaReservr=await QuerysService().actualizarReserva(reference: "reservas", id:widget.nameUser[10], collectionValues:Reservation().toJsonBodyActualizarReservation(widget.nameUser[10],status
     ),);

         if(erroguardaReservr){
      showToast(error);

         }else{
    
         
        String body="Felicidades su reservacion ha sido aprobada";
        String title="Feclicidades";
       final notificacionReservar= NotificationModel();
         notificacionReservar.makeCallCongratulation(body,title,widget.iconmodel.name,widget.iconmodel.lastName,
         widget.nameUser[2],
         widget.nameUser[3],
        widget.nameUser[4],
         widget.nameUser[5],
         widget.nameUser[6],
         //myToken
         widget.nameUser[7],
         status,
         
           widget.nameUser[9],
         
         );
         

        

      

      
            showToast(confimacion);  
         
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(widget.iconmodel,status))); 

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

  void rechazarReserva() async{
       {
    int status=2;
String confimacion="Se ha enviado un mensaje de la reservacion al usuario";
String error="error en notification";
String errorReserva="Error en reserva";
       bool erroguardar=await QuerysService().actualizarNotification(reference: "notification", id:widget.nameUser[9], collectionValues:NotificationModel().toJsonBodyActualizarNoti(widget.nameUser[9],
       widget.nameUser[6],status
     
     
     ),);

      if(erroguardar){
      showToast(error);
      }else{

          bool erroguardaReservr=await QuerysService().actualizarReserva(reference: "reservas", id:widget.nameUser[10], collectionValues:Reservation().toJsonBodyActualizarReservation(widget.nameUser[10],status
     ),);

         if(erroguardaReservr){
      showToast(errorReserva);

         }else{
    

    
           showToast(confimacion);   
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(widget.iconmodel,status))); 

         }
      }
      


  }
  }
}