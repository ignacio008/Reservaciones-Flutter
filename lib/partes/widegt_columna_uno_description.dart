import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/partes/columna_dos_service.dart';

class WidgetColumnaUnoDesc extends StatefulWidget {
  TiendaModel iconmodel;
  Function changeAnimation;
  
  WidgetColumnaUnoDesc(this.iconmodel, this.changeAnimation);

  @override
  _WidgetColumnaUnoDescState createState() => _WidgetColumnaUnoDescState();
}

class _WidgetColumnaUnoDescState extends State<WidgetColumnaUnoDesc> {
   GoogleMapController _mapcontroller;
   List<String>semanas=["Lunes","Martes","Miercoles","Jueves", "Viernes","Sabado","Domingo"];
   String cerrado="Cerrado";
   String cerrado2=" ";
   String nul="null";
   int variableTiempo = 1546322400;
   var validacion= DateTime(2019,01,01,  00,00,00,00);
   DateTime val=DateTime.now();
  Timestamp myTimeStamp = Timestamp.fromDate(DateTime(2019,01,01,  00,00,00,00));
ScrollController controller;
  String guion="-";
  String sinGuion= " ";

@override
  void initState() {
    // TODO: implement initState
     controller= ScrollController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: MediaQuery.of(context).size.width,
      height: 1160,
      
      child:Column(
        children: [
          SizedBox(height:30),
          Row(
            children: [
               SizedBox(width:20),
              Text("Descripcion: ", style:TextStyle(fontSize: 22, fontWeight: FontWeight.bold )),
             
            ],
          ),
           SizedBox(height:10),
           Row(
             children: [
                SizedBox(width:20),
               Flexible(
                 child: Text(widget.iconmodel.descriptionShop,
                 maxLines: 4,
                 ),
                 ),
             ],
           ),
            SizedBox(height:20),
          Row(
            children: [
               SizedBox(width:20),
              Text("Horario: ", style:TextStyle(fontSize: 22, fontWeight: FontWeight.bold )),
             
            ],
          ),

        
          Row(
            children: [
               SizedBox(width:5),

              Container(
                width: 298,
                height:MediaQuery.of(context).size.height*0.54,
            
                padding: EdgeInsets.all(0),

                child: Scrollbar(
                    isAlwaysShown: true,
                    controller:controller,
                  child: ListView.builder(
                     controller: controller,
                    scrollDirection: Axis.vertical,
                  itemCount: widget.iconmodel.entrada.length,
                  itemBuilder: (context, index) {
                    if(widget.iconmodel.entrada[index]==nul && widget.iconmodel.salida[index]==nul){
                        return ListTile(
                          title:Text("Vacio"),
                        );
                    }
                    return ListTile(
                     
                      title: Text(" ${semanas[index] } :    ${widget.iconmodel.entrada[index]== myTimeStamp && widget.iconmodel.salida[index]==myTimeStamp ?  cerrado: DateFormat('HH:mm a').format(widget.iconmodel.entrada[index].toDate())
                     }  ${widget.iconmodel.entrada[index]== myTimeStamp && widget.iconmodel.salida[index]==myTimeStamp ?  sinGuion: guion
                     } ${widget.iconmodel.salida[index]==myTimeStamp || widget.iconmodel.entrada==myTimeStamp?  cerrado2: DateFormat('HH:mm a').format(widget.iconmodel.salida[index].toDate())}"),
                    );
                  },
                ),
                )
                  
                  
                  ),   
                  
                        
            ],
          ),
          SizedBox(height:10),
          Row(
            children: [
               SizedBox(width:20),
                  
            ],
          ),


            SizedBox(height:20),
          Row(
            children: [
               SizedBox(width:20),
              Text("Telefono: ", style:TextStyle(fontSize: 22, fontWeight: FontWeight.bold )),
             
            ],
          ),
          SizedBox(height:10),
          Row(
            children: [
               SizedBox(width:20),
              Text("${widget.iconmodel.numberPhone} "),
            ],
          ),

           
           SizedBox(height:30),
          Row(
            children: [
             


                Container(
      color:Colors.red,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.28,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target:  LatLng(widget.iconmodel.lat, widget.iconmodel.long),
          zoom: 11,
        ),
        markers: _createMarkers(),
        onMapCreated: OnmapCreato,
      ),
    )





            ],
          ),
           SizedBox(height:30),

           Text('Revisa nuestros servicios en nuestra Tienda "${widget.iconmodel.nameShop}"'),
           SizedBox(height:18),
           Icon (Icons.arrow_downward_sharp, size:31),
           GestureDetector(
                   onTap:(){
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>ColumnaDosService(widget.changePage(1))));
                        widget.changeAnimation(1);
                            print("");
                   },
                   child: Container( 
                          width: 115,
                          height: 54,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Servicios",style:TextStyle( color:Colors.white, fontWeight:FontWeight.bold )),
                              SizedBox(width: 5,),
                              Icon(Icons.arrow_forward, color:Colors.white)
                             
                            ],
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                             color: Colors.black,
                          ),
                        ),
                 ),
        ],
      ),
    );

    
  }
  Set<Marker>_createMarkers(){
    var tmp = Set<Marker>();
   
 tmp.add(Marker(
      markerId: MarkerId("FrinPOinr"),
      //A qui pongo el widget.iconmodel
      position:LatLng(widget.iconmodel.lat, widget.iconmodel.long),
      infoWindow: InfoWindow(title: widget.iconmodel.nameShop),
        ));
    
   
    return tmp;
  }

 void OnmapCreato(GoogleMapController controller) {
   _mapcontroller = controller;
   
 }
}