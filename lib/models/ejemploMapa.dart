import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaModel{
  String id;
  GeoPoint latitud;
  double lat;
  double long;
  
  MapaModel({this.id, this.lat,this.long, this.latitud});



  List<MapaModel>getIconTopChanel(dynamic info){
    List<MapaModel>iconmodelLits=[];

    for(var datos in info){
      final id_=datos.data()['id'];
      final latitud_ = datos.data()['localizaciones'] ?? null;
      final lat_ = datos.data()['lat'] ?? null;
      final long_ = datos.data()['long'] ?? null;

      MapaModel notificacionTopChanel = MapaModel(
        id:id_,
        latitud:latitud_,
        lat:lat_== null ? null : double.parse(lat_),
        long:long_== null ? null : double.parse(long_),
      );
      iconmodelLits.add(notificacionTopChanel);
    }
    return iconmodelLits;
  }
}