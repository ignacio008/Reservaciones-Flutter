import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/models/finish_model.dart';
import 'package:z04_app_reservas_firebase/models/reservacion_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';

class FinishReservationWidget extends StatefulWidget {
  Reservation iconmodelResrvation;
  String idUserScanner;
  TiendaModel iconmodelShop;
  UsuarioModel iconmodelUsuario;


  FinishReservationWidget(this.iconmodelResrvation,this.idUserScanner,this.iconmodelShop,this.iconmodelUsuario);

  @override
  State<FinishReservationWidget> createState() => _FinishReservationWidgetState();
}

class _FinishReservationWidgetState extends State<FinishReservationWidget> {
   
    String id_variable="";
    final comentarios= TextEditingController();
    DateTime hoy=DateTime.now();




     String generateRandomString(int len) {
  var r = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  id_variable= List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  return id_variable;
}

@override
  void initState() {
    generateRandomString(10);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return 

    Container(
        width:MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.72,
        color:Colors.blue[50],
     
       child: SingleChildScrollView(
         child: Column(
              children: <Widget>[
               
                Container(
                  width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.07,
             padding:EdgeInsets.only(top: 10.0, bottom:10.0, left:17.0, right:19.0),
                   decoration:BoxDecoration(
                         border: Border(bottom: BorderSide(color: Colors.grey[300], width: 2)),
                          color:Colors.grey[100],
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text("Reservo en:", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold ) ),
                      Text('"${
                        widget.iconmodelResrvation.nameShop==null?"Tienda Mia":widget.iconmodelResrvation.nameShop
                      }"'),
                    ],
                  ),
                ),
                 Container(
                  width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.07,
             padding:EdgeInsets.only(top: 10.0, bottom:10.0, left:17.0, right:19.0),
                   decoration:BoxDecoration(
                         border: Border(bottom: BorderSide(color: Colors.grey[300], width: 2)),
                          color:Colors.grey[100],
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text("Servicio:", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold ) ),
                      Text('"${
                        widget.iconmodelResrvation.nameService==null?"Servicio Mio":widget.iconmodelResrvation.nameService
                      }"'),
                    ],
                  ),
                ),
               

                Container(
                  width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.07,
             padding:EdgeInsets.only(top: 10.0, bottom:10.0, left:17.0, right:19.0),
                   decoration:BoxDecoration(
                         border: Border(bottom: BorderSide(color: Colors.grey[300], width: 2)),
                          color:Colors.grey[100],
                      ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Text("Nombre:", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold ) ),
                      Text('"${
                        widget.iconmodelResrvation.nameUsuario==null?"Mi nombre":widget.iconmodelResrvation.nameUsuario
                      }"'),
                    ],
                  ),
                ),





                 Container(
                  width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.11,
             padding:EdgeInsets.only(top: 10.0, bottom:10.0, left:17.0, right:19.0),
                   decoration:BoxDecoration(
                        
                           color:Colors.grey[100],
                      ),
                  child: Container(
                       width: MediaQuery.of(context).size.width*0.9,
                      height: MediaQuery.of(context).size.height*0.07,
                       decoration:BoxDecoration(
                         border: Border(bottom: BorderSide(color: Colors.grey[400], width: 3),
                         left: BorderSide(color: Colors.grey[400], width: 3),
                         top: BorderSide(color: Colors.grey[400], width: 3),
                         right: BorderSide(color: Colors.grey[400], width: 3)
                         ),
                           color:Colors.grey[200],
                      ),

                    child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[ 
                        Icon(Icons.calendar_today),
                        SizedBox(width:10),
                        Text("Fecha que reserva", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold )
                        )
                        
                        ],),
                         SizedBox(height:9),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${ DateFormat('dd-MM-yyyy').format(widget.iconmodelResrvation.createAtReservation)}"),
                          SizedBox(width:5),
                          Text("${   DateFormat('HH:mm a ').format(widget.iconmodelResrvation.createAtReservation)}"),
                        ],
                        ),
                      ],
                    ),
                  ),
                ),

               



                Container(
                  width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.11,
             padding:EdgeInsets.only(top: 10.0, bottom:10.0, left:17.0, right:19.0),
                   decoration:BoxDecoration(
                        
                           color:Colors.grey[100],
                      ),
                  child: Container(
                       width: MediaQuery.of(context).size.width*0.9,
                      height: MediaQuery.of(context).size.height*0.07,
                       decoration:BoxDecoration(
                         border: Border(bottom: BorderSide(color: Colors.grey[400], width: 3),
                         left: BorderSide(color: Colors.grey[400], width: 3),
                         top: BorderSide(color: Colors.grey[400], width: 3),
                         right: BorderSide(color: Colors.grey[400], width: 3)
                         ),
                           color:Colors.grey[200],
                      ),

                    child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[ 
                        Icon(Icons.calendar_today),
                        SizedBox(width:10),
                        Text("Fecha que reservo", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold )
                        )
                        
                        ],),
                         SizedBox(height:9),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${ DateFormat('dd-MM-yyyy').format(widget.iconmodelResrvation.startService)}"),
                          SizedBox(width:5),
                          Text("${   DateFormat('HH:mm a ').format(widget.iconmodelResrvation.startService)}"),
                        ],
                        ),
                      ],
                    ),
                  ),
                ),


                  Container(
                  width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.17,
             padding:EdgeInsets.only(top: 10.0, bottom:10.0, left:17.0, right:19.0),
                   decoration:BoxDecoration(
                         border: Border(top: BorderSide(color: Colors.grey[300], width: 2),
                         bottom: BorderSide(color: Colors.grey[300], width: 2,),
                         ),
                         
                         
                           color:Colors.grey[100],
                      ),
                  child: Column(
                   
                    children:[

                        
                                      TextFormField(
                                      maxLength: 100,

                                     keyboardType: TextInputType.multiline,
                                       maxLines: 3,
                                      controller:comentarios,
                                            decoration: InputDecoration(
                                              prefixIcon: Padding(
                                            padding: EdgeInsets.all(0.0),
                                            
                                          ),
                                              labelText: "Comentarios", 
                                              labelStyle: TextStyle(
                                    fontSize: 18,
                                  ),
                                              ),
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








                
                Container(
                  width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.1,
             padding:EdgeInsets.only(top: 10.0, bottom:10.0,),
                   decoration:BoxDecoration(
                         border: Border(bottom: BorderSide(color: Colors.grey[300], width: 2)),
                            color:Colors.grey[100],
                      ),
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                     


                      GestureDetector(
                        onTap:(){
                          finishRegister();
                        },
                        child: Container(
                          width:MediaQuery.of(context).size.width*0.93,
                          height:85,
                          color: 
                          Colors.teal[700],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.calendar_today_outlined, color:Colors.white),
                              SizedBox(width:8),
                              Text("Finalizar",
                              style:TextStyle(color: 
                         
                        Colors.white,
                        fontSize: 18,
                              ),
                              
                              ),
                            ],
                          )),
                      ),
                    ],
                  ),
                ),

              ],
    ),
       ),
     );



  }

  void finishRegister() async{

  String reservaCreada="Felicidades A Finalizado a reservacion del usuario";
  String error="error ";
  String comentarios_ =comentarios.text.trim();
  String msnToastHorario="Por favor escriba por los menos 6 caracteres";
  int finish=1;
  int status =0;
  int typeFile= 0;
  if(comentarios_.length<6){
    showToast(msnToastHorario);
      return;
  }

   bool erroguardar=await QuerysService().SaveGeneralFinishReservation(reference: "finishReservas", id:id_variable, collectionValues:FinishModel().toJsonBody(
     id_variable,
   widget.iconmodelResrvation.idReservation,
   widget.idUserScanner,
   widget.iconmodelResrvation.idShop,
   widget.iconmodelResrvation.nameUsuario,
   widget.iconmodelResrvation.nameShop,
   widget.iconmodelResrvation.nameService,
   comentarios_,
   widget.iconmodelResrvation.startService,
   hoy,
   typeFile,
   


    ),);
      if(erroguardar){
      showToast(error);
      }else{
         
          bool erroguardaReservr=await QuerysService().actualizarReservaFinish(reference: "reservas", id:widget.iconmodelResrvation.idReservation, collectionValues:Reservation().toJsonBodyActualizarReservationFinih(finish

          ),);
       if(erroguardaReservr){
           showToast(error);
       }
      else{

            showToast(reservaCreada);
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(widget.iconmodelUsuario,status)));
      }
     
      }






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

  
}