
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/models/ejemploMapa.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';

class RowOneMapa extends StatefulWidget {
  
 List<TiendaModel>iconmodellistTienda=[];
  final  LatLng fromPoint= LatLng(20.977231481065726, -89.66040822350081); 
  RowOneMapa(this.iconmodellistTienda);

  @override
  _RowOneMapaState createState() => _RowOneMapaState();
}


class _RowOneMapaState extends State<RowOneMapa> {
  
  bool loading=true;
  GoogleMapController _mapcontroller;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
       loading=false;
    });
   
  }
  @override
  Widget build(BuildContext context) {
  
    return  loading==true?Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.2,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
        ],
      )
    ) 
    
    :Container(
     
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.24,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target:  LatLng(20.977231481065726, -89.66040822350081),
          zoom: 11,
        ),
        markers: _createMarkers(),
        onMapCreated: OnmapCreato,
      ),
    );
  }
  Set<Marker>_createMarkers(){
    var tmp = Set<Marker>();
    widget.iconmodellistTienda.forEach((element) { 
 tmp.add(Marker(
      markerId: MarkerId("FrinPOinr"),
      //A qui pongo el widget.iconmodel
      position:LatLng(element.lat, element.long),
      infoWindow: InfoWindow(title: element.nameShop),
        ));
    });
   
    return tmp;
  }

 void OnmapCreato(GoogleMapController controller) {
   _mapcontroller = controller;
   
 }

  
}