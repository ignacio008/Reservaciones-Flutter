import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:z04_app_reservas_firebase/models/reservacion_model.dart';

class WidgetAllMyReservation extends StatefulWidget {
  Reservation iconmodelResrvation;
  int index;
  WidgetAllMyReservation(this.iconmodelResrvation, this.index);

  @override
  _WidgetAllMyReservationState createState() => _WidgetAllMyReservationState();
}

class _WidgetAllMyReservationState extends State<WidgetAllMyReservation> {
   DateTime fecha;
  String formattedTime;
  obtenerFechaNueva(){
  
  }

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
    obtenerFechaNueva();
     _increment_index();
    super.initState();
  }

 

  


  @override
  Widget build(BuildContext context) {
    return 
     Container(
        width:MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.43,
      
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
                child:Center(child: Text("Reservacion Nº ${indexNew}", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold ))),
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
                    Text("Reserve en:", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold ) ),
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
                    Text("Servicio", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold ) ),
                    Text('"${
                      widget.iconmodelResrvation.nameService==null?"Servicio Mio":widget.iconmodelResrvation.nameService
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
                      Text("Para el dia: ", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold )
                      )
                      
                      ],),
                       SizedBox(height:9),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${ DateFormat('dd-MM-yyyy').format(widget.iconmodelResrvation.startService)}"),
                        SizedBox(width:5),
                        Text("a las"),
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
          height: MediaQuery.of(context).size.height*0.07,
           padding:EdgeInsets.only(top: 10.0, bottom:10.0, left:17.0, right:19.0),
                 decoration:BoxDecoration(
                       border: Border(bottom: BorderSide(color: Colors.grey[300], width: 2)),
                          color:Colors.grey[100],
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:[
                     Text("Estado:", style:TextStyle(fontSize: 18, fontWeight:FontWeight.bold ) ),


                    Container(
                      width:90,
                      height:45,
                      color:  widget.iconmodelResrvation.status==0?Colors.yellow[800]:
                      widget.iconmodelResrvation.status==1?
                      Colors.green:Colors.red,
                      child: Center(child: Text("${  widget.iconmodelResrvation.status==0?"Pendiente":
                       widget.iconmodelResrvation.status==1?
                      "Aprobado":
                      "Rechazado"
                      }",
                      style:TextStyle(color: 
                      widget.iconmodelResrvation.status==0?Colors.white:
                      widget.iconmodelResrvation.status==1?
                      Colors.white:Colors.white,
                      ),
                      
                      ))),
                  ],
                ),
              ),

            ],
    ),
     );
  }
}
