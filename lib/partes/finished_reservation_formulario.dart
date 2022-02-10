import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/models/finish_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/finished_reservation.dart';

class FinishedReservationFormulario extends StatefulWidget {
  String idUserScanner;
  TiendaModel iconmodelShop;
  UsuarioModel iconmodelUsuario;
  FinishedReservationFormulario(this.idUserScanner,this.iconmodelShop,this.iconmodelUsuario);

  @override
  State<FinishedReservationFormulario> createState() => _FinishedReservationFormularioState();
}

class _FinishedReservationFormularioState extends State<FinishedReservationFormulario> {

    FToast fToast;
    String id_variable="";
    DateTime hoy= DateTime.now();
    final comentarios= TextEditingController();
    final nombre_cupon= TextEditingController();

  String generateRandomString(int len) {
  var r = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  id_variable= List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  return id_variable;
}

  @override
  void initState() {
    // TODO: implement initState
    generateRandomString(10);
    fToast = FToast();
    fToast.init(context);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
         resizeToAvoidBottomInset : false,
      body: Container(
        width:MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color:Colors.grey[800],
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            
            Container(
              width:MediaQuery.of(context).size.width*0.85,
             height: MediaQuery.of(context).size.height*0.53,
             color:Colors.white,
             padding:EdgeInsets.all(24),
             child: Column(
               children:[
                 Text("Registrar cupón", style:TextStyle(fontSize:28, fontWeight: FontWeight.bold )),

                    SizedBox(height:30),


                    TextFormField(
                                    maxLength: 21,

                                   keyboardType: TextInputType.multiline,
                                    
                                    controller:nombre_cupon,
                                          decoration: InputDecoration(
                                           
                                            labelText: "Nombre del cupon", 
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






                 TextFormField(
                                    maxLength: 79,

                                   keyboardType: TextInputType.multiline,
                                    
                                    controller:comentarios,
                                          decoration: InputDecoration(
                                           
                                            labelText: "Descripcion del cupon", 
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

                     SizedBox(height:25),
                            
                      GestureDetector(
                        onTap:(){
                            _agregar_cupon();
                        },
                        child: Container(
                          width:MediaQuery.of(context).size.width,
                          height:MediaQuery.of(context).size.height*0.07,
                      
                          decoration:BoxDecoration(
                            color:Colors.blue,
                            borderRadius:BorderRadius.circular(10),
                          ),
                          child:Center(child: Text("Confirmar", 
                          style:TextStyle(color:Colors.white, fontSize:18)
                          )),
                        ),
                      ),


                       SizedBox(height:10),
                            
                      GestureDetector(
                        onTap:(){
                             Navigator.pop(context, MaterialPageRoute(builder: (context)=>FinishedReservation(widget.idUserScanner,widget.iconmodelShop,widget.iconmodelUsuario))); 

                        },
                        child: Container(
                          width:MediaQuery.of(context).size.width,
                          height:MediaQuery.of(context).size.height*0.07,
                      
                          decoration:BoxDecoration(
                            color:Colors.blue[50],
                            borderRadius:BorderRadius.circular(10),
                          ),
                          child:Center(child: Text("Cancelar", 
                          style:TextStyle(color:Colors.blue[600], fontSize:18,)
                          )),
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


  void _agregar_cupon() async{
      String service="uno";
      String error="error ";
      String nombre_cupon_=nombre_cupon.text.trim();
      int status=0;
      String felicidades="Felicidades se agrego el cupon";
      int typeFile=1;
      String msnToastHorario="Por favor escriba por los menos 6 caracteres";
      String comentarios_ =comentarios.text.trim();
      String nombreCuponError="No puede estar vacio el nombre del cupon";

      if(comentarios_.length<6){
    showToast(msnToastHorario);
      return;
  }
  if(nombre_cupon_.isEmpty){
    showToast(nombreCuponError);
      return;
  }

        bool erroguardar=await QuerysService().SaveGeneralFinishNota(reference: "finishReservas", id:id_variable, collectionValues:FinishModel().toJsonBody(
    id_variable,
     id_variable,
   widget.idUserScanner,
   widget.iconmodelShop.idShop,
   widget.iconmodelUsuario.name,
   nombre_cupon_,
   service,
   comentarios_,
   hoy,
   hoy,
   typeFile,
   


    ),);
      if(erroguardar){
      showToast(error);
      }else{

         fToast.showToast(
           toastDuration: Duration(seconds: 2),
           gravity: ToastGravity.CENTER,
        child: customizedLeadingIconWidget,
          );
         
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FinishedReservation(widget.idUserScanner,widget.iconmodelShop,widget.iconmodelUsuario))); 

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
            Text("Felicidades se agrego el cupon", style:TextStyle(color: Colors.white)),
          ],
        ),
      );






}