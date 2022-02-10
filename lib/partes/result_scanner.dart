import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/finish_reservation.dart';
import 'package:z04_app_reservas_firebase/partes/finished_reservation.dart';

class ResultScanner extends StatefulWidget {
  String idUserScanner;
  TiendaModel iconmodelShop;
  UsuarioModel iconmodelUsuario;
  ResultScanner(this.idUserScanner,this.iconmodelShop,this.iconmodelUsuario);

  @override
  State<ResultScanner> createState() => _ResultScannerState();
}

class _ResultScannerState extends State<ResultScanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle:true,
        title: Text("Reservaciones finalizadas"),
       backgroundColor: Colors.blue[700],
        bottomOpacity:0.0,
        elevation:0.0,
         
      ),
      body:Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        color:Colors.blue[50],
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          
            GestureDetector(
              onTap:(){
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FinishReservation(widget.idUserScanner, widget.iconmodelShop, widget.iconmodelUsuario))); 
                    
              },
              child: Container(
                 width:MediaQuery.of(context).size.width*0.7,
                 height:MediaQuery.of(context).size.height*0.3,
                       decoration:BoxDecoration(
                       borderRadius: BorderRadius.circular(18),
                       color:Colors.blue [200],
                       image: DecorationImage(
                                      image: AssetImage("assets/cupon3.jpg"),
                                    fit:BoxFit.cover,
                                  ),
                    ),             
                ),
            ),
                SizedBox(height:5), 
              Text("Reservaciones por finalizar", style: TextStyle(fontSize: 18,color:Colors.pink[300]),),
                SizedBox(height:20), 


               GestureDetector(
                 onTap:(){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>FinishedReservation(widget.idUserScanner, widget.iconmodelShop, widget.iconmodelUsuario))); 
                 },
                 child: Container(
                 width:MediaQuery.of(context).size.width*0.7,
                 height:MediaQuery.of(context).size.height*0.3,
                          decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color:Colors.blue [100],
                          image: DecorationImage(
                                      image: AssetImage("assets/cupon2.jpg"),
                                    fit:BoxFit.cover,
                                  ),
                       ),             
                             ),
               ),
                SizedBox(height:5), 
               Text("Reservaciones finalizadas", style: TextStyle(fontSize: 18, color:Colors.teal[800]),),





          
          ],
        ),
      )
    );
  }
}