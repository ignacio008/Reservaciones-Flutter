import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/models/finish_model.dart';
import 'package:z04_app_reservas_firebase/models/nota_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/finished_reservation_formulario.dart';
import 'package:z04_app_reservas_firebase/partes/finished_reservation_widget.dart';

class FinishedReservation extends StatefulWidget {
  String idUserScanner;
  TiendaModel iconmodelShop;
  UsuarioModel iconmodelUsuario;
  FinishedReservation(this.idUserScanner,this.iconmodelShop,this.iconmodelUsuario);

  @override
  State<FinishedReservation> createState() => _FinishedReservationState();
}

class _FinishedReservationState extends State<FinishedReservation> {
  String id_variable="";
  List<FinishModel> iconModelList=[];
 
  ScrollController controller;
  DateTime hoy= DateTime.now();
  FToast fToast;
  bool isLoaded=false;

  void getlista(String idusuario, String idShop)async{
    iconModelList=await FetchData().getTopMyfinished(idusuario,idShop);
    print('Tengo ${iconModelList.length} cards');
    setState(() {
      isLoaded=true;
    });
  }

 





  @override
  void initState() {
     controller= ScrollController();
     getlista(widget.idUserScanner, widget.iconmodelShop.idShop);
   
  
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Reservaciones finalizadas", style:TextStyle(color:Colors.white)),
        elevation:0.0,
        bottomOpacity:0.0,
       
          backgroundColor: Colors.blue[800],
      ),
      body:Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        child: 
        
        isLoaded==false? Container(

       child: Center(
         child: Column(
                         
                          children:[
                            SizedBox(height:MediaQuery.of(context).size.height*0.2),
                        Container( 
                          width: MediaQuery.of(context).size.width*0.7,
                          height:MediaQuery.of(context).size.height*0.3,
                        
             child: Transform.scale(
                scale: 0.9,
               child: CircularProgressIndicator())) 
                        ]),
       ),

      ):
        
        iconModelList.isEmpty?Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                  Icon(Icons.warning_amber_rounded, size:230, color:Colors.orange[600]),
                  Text("¡No Tiene ninguna reservacion finalizada!"),
                ]),


              ):


              Scrollbar(
         isAlwaysShown: true,
         controller: controller,
         child: ListView.builder(
            itemCount: iconModelList.length,
           controller: controller,
           
            itemBuilder: (BuildContext context, int index) {
                     return Row(
                       mainAxisAlignment: MainAxisAlignment.center,              
                       children: [              
           iconModelList.isEmpty?CircularProgressIndicator():  FinishedReservationWidget(iconModelList[index],widget.idUserScanner,widget.iconmodelShop,widget.iconmodelUsuario, index, ),
                     ],);
               },
           



           
         ),
           ),
      ),

     
       floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
       Navigator.push(context, MaterialPageRoute(builder: (context)=>FinishedReservationFormulario(widget.idUserScanner,widget.iconmodelShop,widget.iconmodelUsuario))); 

        // _agregar_cupon();

        },
        label: const Text('Agregar cupon', style:TextStyle(color:Colors.white)),
        icon: const Icon(Icons.receipt_long, color:Colors.white),
        backgroundColor: Colors.blue[900],
      ), 



    );
  }

  

  



}