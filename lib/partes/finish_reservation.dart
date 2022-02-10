import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/models/reservacion_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/finish_reservation_widget.dart';

class FinishReservation extends StatefulWidget {
  String idUserScanner;
  TiendaModel iconmodelShop;
  UsuarioModel iconmodelUsuario;
  FinishReservation(this.idUserScanner,this.iconmodelShop,this.iconmodelUsuario);

  @override
  State<FinishReservation> createState() => _FinishReservationState();
}

class _FinishReservationState extends State<FinishReservation> {

  List<Reservation> iconModelList=[];
  ScrollController controller;
  
  void getlista(String idusuario, int finishReservation, String idShop)async{
    iconModelList=await FetchData().getTopMyReservationFinish(idusuario,finishReservation,idShop);
    print('Tengo ${iconModelList.length} cards');
    setState(() {
      
    });
  }

   @override
   void initState() {
      controller= ScrollController();
       getlista(widget.idUserScanner,0, widget.iconmodelShop.idShop);
     super.initState();
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title:Text("Reservaciones por finalizar"),
        bottomOpacity:0.0,
        elevation:0.0,
        backgroundColor: Colors.blue[700],
      ),

        body:Container(
          width:MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          child:


         iconModelList.isEmpty?Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                  Icon(Icons.warning_amber_rounded, size:230, color:Colors.orange[600]),
                  Text("¡No Tiene ninguna solicitud por aceptar!"),
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
           iconModelList.isEmpty?CircularProgressIndicator():  FinishReservationWidget(iconModelList[index],widget.idUserScanner,widget.iconmodelShop,widget.iconmodelUsuario),
                     ],);
               },
           



           
         ),
           ),
        ),


    );
  }
}