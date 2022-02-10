import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:z04_app_reservas_firebase/firebase/authenticatio.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/models/notification_model.dart';
import 'package:z04_app_reservas_firebase/models/reservacion_model.dart';
import 'package:z04_app_reservas_firebase/models/service_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/notification.dart';
import 'package:z04_app_reservas_firebase/notification_user.dart';
import 'package:z04_app_reservas_firebase/providers/messagin.dart';
import 'package:z04_app_reservas_firebase/providers/push_provider_notification.dart';

class Reservar extends StatefulWidget {
  TiendaModel iconmodel;
  Service iconmodelService;
  UsuarioModel iconmodelUsuario;
   List<Reservation> iconmodellistReservation=[];
  Reservar(this.iconmodel, this.iconmodelService,this.iconmodelUsuario,this.iconmodellistReservation);

  @override
  _ReservarState createState() => _ReservarState();
}

class _ReservarState extends State<Reservar> {
   FToast fToast;
 int status=0;
 int finishReservation=0;
  DateTime hoy=DateTime.now();
  String id_variable="";
  DateTime _selectedDate;
  final numero_Reserva= TextEditingController();
  final nombre_usuario= TextEditingController();
  TextEditingController _textEditingController = TextEditingController();
  DateTime durationService;
  int weekDay;

 final List <String> conversion=[];
 final List <String> conversion1=["ddd","dnin"];
 
 final List <DateTime>conversionlistaVacia=[];
 final List <DateTime> conversionListaFecha=[];
  Timestamp myTimeStamp = Timestamp.fromDate(DateTime(2019,01,01,  00,00,00,00));
  String mensaje="Lo sentimos no laboramos ese dia";

  String generateRandomString(int len) {
  var r = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  id_variable= List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  return id_variable;
}
bool loading=false;
 List iconmodellistnotification=[];
 List iconmodellistnotificationCongratulation=[];

@override
void initState() {
    generateRandomString(15);
       fToast = FToast();
    fToast.init(context);
  super.initState();
  
}
  convertir(){ 
   if(weekDay==0){
      weekDay=0;
   }else{
     weekDay--;
   }
   if(myTimeStamp==widget.iconmodel.entrada[weekDay]){
     showToast(mensaje);
       conversionListaFecha.removeRange(0, conversionListaFecha.length);
     return;
   }
        DateTime horaentrada= DateTime.fromMicrosecondsSinceEpoch(widget.iconmodel.entrada[weekDay].microsecondsSinceEpoch);

       DateTime horaSalida= DateTime.fromMicrosecondsSinceEpoch(widget.iconmodel.salida[weekDay].microsecondsSinceEpoch);


        //DateTime nuevaHora = DateTime(horaentrada.year,horaentrada.month,horaentrada.day,horaentrada.hour,horaentrada.minute+30);
        DateTime nuevaHora ;

        int datoNuevo= horaSalida.hour-horaentrada.hour;
        int Nuebodato30=datoNuevo*2;
        double NuevoDato45=datoNuevo*1.25;
        int NuevoDato60=datoNuevo;
        int NuevoDato15=datoNuevo*4;


      if(widget.iconmodelService.durationService==45){
       if(conversionListaFecha.isEmpty){
       for (var i =0 ; i <= NuevoDato45; i++) {
           DateTime nuevaHora = DateTime(_selectedDate.year,_selectedDate.month,_selectedDate.day,horaentrada.hour,horaentrada.minute+45*i);
            print("nueva hora ${nuevaHora}");
            print(i);
            conversionListaFecha.add(nuevaHora);
         widget.iconmodellistReservation.forEach((element) {
           conversionListaFecha.remove(element.startService);
         });
            print("tengi datos ${conversionListaFecha}");
       }
      }else{
       conversionListaFecha.removeRange(0, conversionListaFecha.length);
        for (var i =0 ; i <= NuevoDato45; i++) {
           DateTime nuevaHora = DateTime(_selectedDate.year,_selectedDate.month,_selectedDate.day,horaentrada.hour,horaentrada.minute+45*i);
            print("nueva hora ${nuevaHora}");
            print(i);
            conversionListaFecha.add(nuevaHora);
            widget.iconmodellistReservation.forEach((element) {
           conversionListaFecha.remove(element.startService);
         });
            print("tengi datos ${conversionListaFecha}");
            }
          }
      }else 
      if(widget.iconmodelService.durationService==30){
       if(conversionListaFecha.isEmpty){
        for (var i =0 ; i <= Nuebodato30; i++) {
           DateTime nuevaHora = DateTime(_selectedDate.year,_selectedDate.month,_selectedDate.day,horaentrada.hour,horaentrada.minute+30*i);
            print("nueva hora ${nuevaHora}");
            print(i);
            conversionListaFecha.add(nuevaHora);
            widget.iconmodellistReservation.forEach((element) {
           conversionListaFecha.remove(element.startService);
         });
            print("tengi datos ${conversionListaFecha}");
       }
      }else{
       conversionListaFecha.removeRange(0, conversionListaFecha.length);
        for (var i =0 ; i <= Nuebodato30; i++) {
           DateTime nuevaHora = DateTime(_selectedDate.year,_selectedDate.month,_selectedDate.day,horaentrada.hour,horaentrada.minute+30*i);
            print("nueva hora ${nuevaHora}");
            print(i);
            conversionListaFecha.add(nuevaHora);
            widget.iconmodellistReservation.forEach((element) {
           conversionListaFecha.remove(element.startService);
         });
            print("tengi datos ${conversionListaFecha}");
            }
          }
      }else

      if(widget.iconmodelService.durationService==60){
       if(conversionListaFecha.isEmpty){
       for (var i =0 ; i <= NuevoDato60; i++) {
           DateTime nuevaHora = DateTime(_selectedDate.year,_selectedDate.month,_selectedDate.day,horaentrada.hour,horaentrada.minute+60*i);
            print("nueva hora ${nuevaHora}");
            print(i);
            conversionListaFecha.add(nuevaHora);
            widget.iconmodellistReservation.forEach((element) {
           conversionListaFecha.remove(element.startService);
         });
            print("tengi datos ${conversionListaFecha}");
       }
      }else{
       conversionListaFecha.removeRange(0, conversionListaFecha.length);
        for (var i =0 ; i <= NuevoDato60; i++) {
           DateTime nuevaHora = DateTime(_selectedDate.year,_selectedDate.month,_selectedDate.day,horaentrada.hour,horaentrada.minute+60*i);
            print("nueva hora ${nuevaHora}");
            print(i);
            conversionListaFecha.add(nuevaHora);
            widget.iconmodellistReservation.forEach((element) {
           conversionListaFecha.remove(element.startService);
         });
            print("tengi datos ${conversionListaFecha}");
            }
          }
      }else
      if(widget.iconmodelService.durationService==15){
       if(conversionListaFecha.isEmpty){
       for (var i =0 ; i <= NuevoDato15; i++) {
           DateTime nuevaHora = DateTime(_selectedDate.year,_selectedDate.month,_selectedDate.day,horaentrada.hour,horaentrada.minute+15*i);
            print("nueva hora ${nuevaHora}");
            print(i);
            conversionListaFecha.add(nuevaHora);
            widget.iconmodellistReservation.forEach((element) {
           conversionListaFecha.remove(element.startService);
         });
            print("tengi datos ${conversionListaFecha}");
       }
      }else{
       conversionListaFecha.removeRange(0, conversionListaFecha.length);
        for (var i =0 ; i <= NuevoDato15; i++) {
           DateTime nuevaHora = DateTime(_selectedDate.year,_selectedDate.month,_selectedDate.day,horaentrada.hour,horaentrada.minute+15*i);
            print("nueva hora ${nuevaHora}");
            print(i);
            conversionListaFecha.add(nuevaHora);
            widget.iconmodellistReservation.forEach((element) {
           conversionListaFecha.remove(element.startService);
         });
            print("tengi datos ${conversionListaFecha}");
            }
          }
      }
          print(widget.iconmodel.entrada[weekDay]);
           String v =  DateFormat('HH:mm a').format(widget.iconmodel.entrada[weekDay].toDate());
           print(v);
           conversion.add(v);
            print(conversion);
     
           print(weekDay);
           print(horaentrada);
           print(horaSalida);
           print(horaentrada.hour);
           
          print("tengi datos final ${conversionListaFecha}");
  
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset : false,
        appBar:AppBar(
        title:Text("Reserva con nosotros"),
        elevation: 0,
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color:Colors.grey[200],
        child:Column(
          children: <Widget>[
           
            Container(
              width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.08,
         padding:EdgeInsets.only(top: 10.0, bottom:10.0, left:17.0, right:19.0),
               decoration:BoxDecoration(
                     border: Border(bottom: BorderSide(color: Colors.grey[300], width: 2)),
                      color:Colors.grey[200],
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text("Deseo", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold ) ),
                  Text('Reservar en "${widget.iconmodel.nameShop}"'),
                ],
              ),
            ),
             Container(
              width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.08,
         padding:EdgeInsets.only(top: 10.0, bottom:10.0, left:17.0, right:19.0),
               decoration:BoxDecoration(
                     border: Border(bottom: BorderSide(color: Colors.grey[300], width: 2)),
                      color:Colors.grey[200],
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text("Servicio", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold ) ),
                  Text('"${widget.iconmodelService.nameService}"'),
                ],
              ),
            ),
             Container(
              width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.08,
         padding:EdgeInsets.only(top: 10.0, bottom:10.0, left:17.0, right:19.0),
               decoration:BoxDecoration(
                     border: Border(bottom: BorderSide(color: Colors.grey[300], width: 2)),
                      color:Colors.grey[200],
                  ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text("Tiempo de espera del servicio", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold ) ),
                  Text('${widget.iconmodelService.durationService} minutos'),
                ],
              ),
            ),



         
             Container(
                width: MediaQuery.of(context).size.width,
                     height: MediaQuery.of(context).size.height*0.62,
                      padding:EdgeInsets.only(top: 10.0, bottom:10.0, left:17.0, right:19.0),
                     decoration:BoxDecoration(
                       color:Colors.white,
                       borderRadius: BorderRadius.circular(20),
                     ),
               child: Column(
                 children: [
                   Text("Por favor conteste el siguiente formulario", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold )),
                   SizedBox(height:18),



                    
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children:[
                       Text("Nombre:", style:TextStyle(fontSize: 17, ) ),
                       
                     ],
                   ),
                  
                     Container(
                         height:63.5,
                         width:MediaQuery.of(context).size.width,
                       
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                          TextFormField(
                         controller:nombre_usuario,
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.perm_contact_cal,
                                        color: Colors.grey,
                                      ), // icon is 48px widget.
                                    ),
                                        labelText: "${widget.iconmodelUsuario.name}"),
                                        onChanged:(value){
                                        },
                                          validator:(value){
                                          if(value.isEmpty){
                                            return "El campo esta vacio";
                                          }
                                        }
                                        ),
                     ]),),

  SizedBox(height:18),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children:[
                       Text("Numero telefonico:", style:TextStyle(fontSize: 17, ) ),
                       
                     ],
                   ),

                   



                   Container(
                         height:63.5,
                         width:MediaQuery.of(context).size.width,
                       
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [
                             
                             TextFormField(
                                keyboardType: TextInputType.number,
                                controller:numero_Reserva,
                                             decoration: InputDecoration(
                                               prefixIcon: Padding(
                                             padding: EdgeInsets.all(0.0),
                                             child: Icon(
                                               Icons.local_phone,
                                               color: Colors.grey,
                                             ), // icon is 48px widget.
                                           ),
                                               labelText: "${widget.iconmodel.numberPhone}"),
                                               onChanged:(value){
                                               },        
                                               ),                
                             ],
                          )
                         ),
                    SizedBox(height:18),
                  Row(
                    children: [
                      Text("Fecha a reservar", style:TextStyle(fontSize: 17, )),
                    ],
                  ),
                  Container(
                     height:63.5,
                         width:MediaQuery.of(context).size.width,
                         child: Column(
                           children:[
                               TextFormField(
                                  onTap:(){
                                   FocusScope.of(context).requestFocus(new FocusNode());
                                _selectDate(context);
                                  },
                        controller: _textEditingController,
                              keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.calendar_today_outlined,
                                        color: Colors.grey,
                                      ), // icon is 48px widget.
                                    ),
                                        labelText: "Fecha de reservacion"),
                                        onChanged:(value){
                                        },
                                          validator:(value){
                                          if(value.isEmpty){
                                            return "El campo esta vacio";
                                          }
                                        }
                                        ),
                           ],
                         ),
                  ),
                  SizedBox(height: 18,),
                    Row(
                    children: [
                      Text("Horario:", style:TextStyle(fontSize: 17, )),
                 
                  SizedBox(width:20),
                                            
                 DropdownButton<DateTime>(
                                            value: durationService,
                                            style: TextStyle(color: Colors.black, fontSize:16),
                                           
                                             
                                            items: conversionListaFecha
                                            
                                            
                                            .map((DateTime value) {
                                              return DropdownMenuItem<DateTime>(
                                                value: value,
                                                child: Text("${DateFormat('HH:mm a').format(value)}"),
                                              );
                                            }).toList(),
                                            hint: Text(
                                              
                                             conversionListaFecha.isEmpty?"No laboramos este dia":"Selecione la hora",
                                              style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            onChanged: (DateTime value) {
                                              setState(() {
                                                  durationService = value;       
                                              });
                                            },
                                         ),
                                            ],
                                      ),
                                      SizedBox(height:20),
              GestureDetector(
                onTap:(){
                  Comprobacion();
                  
                },
                child: Container(
                  width:MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height*0.07,
                  
                  decoration:BoxDecoration(
                     color:  Colors.teal[800],
                      borderRadius:BorderRadius.circular(8),
                  ),
                  child:

                   Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.calendar_today_outlined, color:Colors.white),
                            SizedBox(width:8),
                            Text("Reservar",
                            style:TextStyle(color: 
                       
                      Colors.white,
                      fontSize: 18,
                            ),
                            ),
                          
                          ],
                        ),
                  
                  
                  
                  
                  ),
                  ),


                 ],
               ),
             ),
         
          ],
        ),
        
      ),
    );
  }




    void _selectDate(BuildContext context) async {
FocusScope.of(context).requestFocus(new FocusNode());
     DateTime newSelectedDate = await showDatePicker(context: context, initialDate: _selectedDate != null ? _selectedDate : DateTime.now(), 
     firstDate:DateTime.now(),
     lastDate:DateTime(DateTime.now().year,DateTime.now().month,DateTime.now().day + 6 ),
     
     builder: (BuildContext context, Widget child) {
        return Theme(
          
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                 primary: Colors.black,
                onPrimary: Colors.white,
                surface: Colors.white,
                onSurface: Colors.black,
              ),
               dialogBackgroundColor: Colors.white,
            ),
             child: child,
          );
        });

     if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
       weekDay=_selectedDate.weekday;
   
       convertir();
    



      _textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  void selector() {
  }
void showToast(mensaje) {
    Fluttertoast.showToast(
        msg: mensaje,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.teal[400],
        textColor: Colors.white,
        fontSize: 14.0,
    );
  }

  void Comprobacion()async {
    print(conversionListaFecha);

  String reservaCreada="Felicidades A Reservado con exito!!";
  String error="error";
  String name_reservar =nombre_usuario.text.trim();
  String phone_ = numero_Reserva.text.trim();
  bool emailValid = RegExp(r'^\d{10}$').hasMatch(phone_);
  String msnToastHorario="Por favor seleccione una Hora";
  String msnHorario="Lo sentimos el dia y la hora ya han sido reservados";
  String telefonoerror="El telefono solo puede contener numeros y debe tener 10 dígitos";
   if(durationService==null){
      showToast(msnToastHorario);
      return;
    }

  // if(emailValid==false){
  //     showToast(telefonoerror);
  //     return;
  //   }
    
    if(phone_.isEmpty){
      phone_=widget.iconmodelUsuario.numberPhone;
    }else if(emailValid==false){
      
       showToast(telefonoerror);
      return;
    }
  

 final List <DateTime> horarios=[];


    if(durationService!=null ){
 _cargando(context);
    }
 
   

  User user = await Authentication().getCurrentUser();
 UsuarioModel adminmodel = await FetchData().getAdmin(user.uid);
  //  final messagin = new PostMessagin();
  //     messagin.makeCall();

   

    bool erroguardar=await QuerysService().SaveGeneralReservar(reference: "reservas", id:id_variable, collectionValues:Reservation().toJsonBody(id_variable,widget.iconmodel.idShop,widget.iconmodelUsuario.idUsuario,


   name_reservar.isEmpty? widget.iconmodelUsuario.name:name_reservar,
    phone_.isEmpty?widget.iconmodelUsuario.numberPhone:phone_,
    durationService,
    hoy,
    status,
    widget.iconmodel.nameShop,
    widget.iconmodelService.nameService,
    widget.iconmodelService.idUserShop,
    finishReservation,

    ),);


      if(erroguardar){
      showToast(error);
      }else{
        
        String body="Tienes una reservacion Por aceptar";
        String title="Una nueva Reserva";
      

        bool erroguardar=await QuerysService().SaveGeneralInfoNotification(reference: "notification", id:id_variable, collectionValues:NotificationModel().toJsonBody(id_variable,
        widget.iconmodel.idShop,
        widget.iconmodelUsuario.idUsuario,
        id_variable,
        widget.iconmodelUsuario.name,
        widget.iconmodelUsuario.lastName,
        widget.iconmodel.nameShop,
        widget.iconmodelService.nameService,
    widget.iconmodelUsuario.numberPhone,

    durationService,
  status,
    widget.iconmodel.shopToken,
      widget.iconmodelUsuario.myToken,
    hoy,
    widget.iconmodelService.idUserShop,
   

    ),);

        //  final notificacionNueva= new Reservation();
         final notificacionReservar= NotificationModel();
         notificacionReservar.makeCall(
           body,
           title,
         widget.iconmodelUsuario.name,
         widget.iconmodelUsuario.lastName,
         widget.iconmodel.nameShop,
         widget.iconmodelService.nameService,
         widget.iconmodelUsuario.numberPhone,
         durationService,
         widget.iconmodel.shopToken,
         widget.iconmodelUsuario.myToken,
         status,
         id_variable,
         id_variable,
         );


      fToast.showToast(
           toastDuration: Duration(seconds: 4),
           gravity: ToastGravity.CENTER,
        child: customizedLeadingIconWidget,
          );
    // notificacionNueva.makeCall(widget.iconmodelUsuario.name);
           showToast(reservaCreada);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(adminmodel,status)));
      }




    
  



  

  }

  void _cargando(BuildContext context){
       String cardEliminado="La Tienda ha sido eliminado con exito!!";
      showDialog(context: context, builder: (context) {
        return AlertDialog(
        
          title:Text("Cargando... ", style:TextStyle(color:Colors.white, fontSize:19)),
         content:Container(
           height:130,
          
           child: Column(
             children: [
           
              Text("Por favor espere a que termine de subir los datos", style:TextStyle(color:Colors.white)),
              SizedBox(height:20),
              CircularProgressIndicator(

                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
             ],
           ),
         ),
            actions: <Widget>[
          
            
          ],
          backgroundColor: Colors.grey[800],
        );
      });
    }


    Widget customizedLeadingIconWidget = 
      
            Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        width: 400,
        height:230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.teal[700],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle, // Set your own leading icon!
              color: Colors.white,
              size:140,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Felicidades se ha enviado tu solicitud, espere a que te confirme la tienda", style:TextStyle(color: Colors.white)),
          ],
        ),
      );

}