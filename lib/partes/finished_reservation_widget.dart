import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:z04_app_reservas_firebase/models/finish_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';

class FinishedReservationWidget extends StatefulWidget {
  FinishModel iconmodelFinish;
  String idUserScanner;
  TiendaModel iconmodelShop;
  UsuarioModel iconmodelUsuario;
  int index;
  
  FinishedReservationWidget(this.iconmodelFinish,this.idUserScanner,this.iconmodelShop,this.iconmodelUsuario,this.index);

  @override
  State<FinishedReservationWidget> createState() => _FinishedReservationWidgetState();
}

class _FinishedReservationWidgetState extends State<FinishedReservationWidget> {
  int indexNew=0;
  _increment_index(){
    indexNew=widget.index;
    if(widget.index==indexNew){
      indexNew++;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _increment_index();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return 



      widget.iconmodelFinish.typeFile==0?
      Container(
        width:MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.71,
        color:Colors.blue[50],
     
       child: Column(
            children: <Widget>[


              Container(
                width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.08,
           padding:EdgeInsets.only(top: 10.0, bottom:10.0, left:17.0, right:19.0),
                 decoration:BoxDecoration(
                       border: Border(bottom: BorderSide(color: Colors.grey[300], width: 2)),
                        color:Colors.grey[100],
                    ),
                child:Center(child: Text("Servicio finalizado Nº ${indexNew}", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold ))),
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
                    Text("Reservo en:", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold ) ),
                    Text('"${
                      widget.iconmodelFinish.nameShop==null?"Tienda Mia":widget.iconmodelFinish.nameShop
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
                      widget.iconmodelFinish.nameService==null?"Servicio Mio":widget.iconmodelFinish.nameService
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
                      widget.iconmodelFinish.nameUser==null?"Mi nombre":widget.iconmodelFinish.nameUser
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
                      Text("Fecha que reservo", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold )
                      )
                      
                      ],),
                       SizedBox(height:9),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${ DateFormat('dd-MM-yyyy').format(widget.iconmodelFinish.reservationDate)}"),
                        SizedBox(width:5),
                        Text("${   DateFormat('HH:mm a ').format(widget.iconmodelFinish.reservationDate)}"),
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
                      Text("Servicio finalizado", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold )
                      )
                      
                      ],),
                       SizedBox(height:9),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${ DateFormat('dd-MM-yyyy').format(widget.iconmodelFinish.createReservationFinish)}"),
                        SizedBox(width:5),
                        Text("${   DateFormat('HH:mm a ').format(widget.iconmodelFinish.createReservationFinish)}"),
                      ],
                      ),
                    ],
                  ),
                ),
              ),






              Container(
                width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height*0.16,
           padding:EdgeInsets.only(top: 10.0, bottom:32.0, left:17.0, right:19.0),
                 decoration:BoxDecoration(
                      
                         color:Colors.grey[100],
                    ),
                child: Container(
                  padding:EdgeInsets.only(left:10,right:8),
                     width: MediaQuery.of(context).size.width*0.9,
                    height: MediaQuery.of(context).size.height*0.08,
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
                    
                     
                      Text("Comentario", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold )
                      ),
                       SizedBox(width:10),
                        Icon(Icons.chat),
                      ],),
                       SizedBox(height:9),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          
                          
                          child: Text("${widget.iconmodelFinish.comentarios}",maxLines: 2,)),
                      ],
                      ),
                    ],
                  ),
                ),
              ),





              









            ],
    ),
     ):
     Container(
     width:MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.35,
        color:Colors.grey[200],
padding:EdgeInsets.all(15),
        child: Container(
            width:MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.height*0.25,
        padding:EdgeInsets.all(10),
          decoration:BoxDecoration(
       

gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue[800],
                Colors.purple[900],
              ],
            ),




          borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
              children: <Widget>[
                
                Container(
                  width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.08,
             padding:EdgeInsets.only(top: 10.0, bottom:10.0, left:17.0, right:19.0),
                   decoration:BoxDecoration(
                         border: Border(bottom: BorderSide(color: Colors.grey[300], width: 2)),
                          
                      ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Text("${widget.iconmodelFinish.nameShop[0].toUpperCase()}${widget.iconmodelFinish.nameShop.substring(1)}"
                      ,style:TextStyle(fontSize: 25,
                       fontWeight:FontWeight.bold,
                       color:Colors.white )),
                      SizedBox(width:10),
                      Icon(Icons.receipt_long, color:Colors.white),
                    ],
                  ),
                ),


        SizedBox(height:10),

              Container(
                  width: MediaQuery.of(context).size.width*0.7,
            height: MediaQuery.of(context).size.height*0.10,
             padding:EdgeInsets.only(top: 10.0, bottom:10.0, left:17.0, right:19.0),
                   decoration:BoxDecoration(
                        
                          
                      ),
                  child: Container(
                       width: MediaQuery.of(context).size.width*0.9,
                      height: MediaQuery.of(context).size.height*0.07,
                       decoration:BoxDecoration(
                        
                           color:Colors.grey[100],
                      ),

                    child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[ 
                        Icon(Icons.calendar_today),
                        SizedBox(width:10),
                        Text("Fecha del cupon", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold )
                        )
                        
                        ],),
                         SizedBox(height:9),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${ DateFormat('dd-MM-yyyy').format(widget.iconmodelFinish.createReservationFinish)}"),
                          SizedBox(width:5),
                          Text("${   DateFormat('HH:mm a ').format(widget.iconmodelFinish.createReservationFinish)}"),
                        ],
                        ),
                      ],
                    ),
                  ),
                ),




        SizedBox(height:10),

                Container(
                  width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.08,
             padding:EdgeInsets.only(top: 2.0, bottom:2.0, left:2.0, right:2.0),
                   decoration:BoxDecoration(
                       
                          color:Colors.red,
                      ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Flexible(child: Text("${widget.iconmodelFinish.comentarios[0].toUpperCase()}${widget.iconmodelFinish.comentarios.substring(1)}", 
                      
                      style:TextStyle(
                        fontSize: 18,
                         fontWeight:FontWeight.bold,
                         color:Colors.white ),
                      maxLines: 2,
                      
                      )),
                    
                      
                    ],
                  ),
                ),


              ]),
        ),
     );
  }
}