import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/update/update_service.dart';

class WidgetUpdateMap extends StatefulWidget {
  TiendaModel iconmodel;
  UsuarioModel iconmodelUsuario;
  WidgetUpdateMap(this.iconmodel,this.iconmodelUsuario);

  @override
  _WidgetUpdateMapState createState() => _WidgetUpdateMapState();
}

class _WidgetUpdateMapState extends State<WidgetUpdateMap> {
GoogleMapController _mapcontroller;
LatLng _center ;
LatLng _Actual_center;
Position currentLocation;
double latitude;
double longitude;
double actuallatitude;
double actuallongitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:AppBar(
        
        title:Text("Actualiza tu Ubicacion", style:TextStyle(color:Colors.white)),
         backgroundColor: Colors.blue[700],
        bottomOpacity: 0.0,
        elevation: 0.0,
      ),
      body: Container(
        width:MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color:Colors.grey[800],
          child: Column(
            children: [
              SizedBox(height:40),


                Container(
                  width:MediaQuery.of(context).size.width*0.92,
        height: MediaQuery.of(context).size.height*0.73,
        color:Colors.white,
                  child:Column(children:[
                    SizedBox(height:MediaQuery.of(context).size.height*0.02),

                     Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Ubicación de su tienda", style:TextStyle(fontSize:28,fontWeight:FontWeight.bold)),
                          ],
                        ),
                          SizedBox(height:MediaQuery.of(context).size.height*0.02),




              Container(
      color:Colors.grey[400],
      width: MediaQuery.of(context).size.width*0.88,
      height: MediaQuery.of(context).size.height*0.42,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target:  LatLng(widget.iconmodel.lat, widget.iconmodel.long),
          zoom: 11,
        ),
        markers: Set<Marker>.of(
          <Marker>[
            Marker(
              draggable: true,
              markerId: MarkerId("1"),
              position: _center==null?LatLng(widget.iconmodel.lat, widget.iconmodel.long):_center,
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
              onDragEnd: (newPosition){
                _Actual_center=newPosition;
                print("este es el metodododod ${newPosition}");
                print("actual position ${_Actual_center}");
                ubicacionActual(_Actual_center);
              },
              infoWindow: const InfoWindow(
                title: 'Tienda',
              ),
            )
          ],
        ),
        onMapCreated: OnmapCreato,
        onTap:ontaop
      ),
    ),

                SizedBox(height:40),
                GestureDetector(
                  onTap: (){
                    actualizarMapa(widget.iconmodel.idShop);
                    },
                  child: Container(
                    width:MediaQuery.of(context).size.width*0.8,
                                              height:MediaQuery.of(context).size.height*0.07,
                  decoration:BoxDecoration(
                    color:Colors.blue,
                    borderRadius:BorderRadius.circular(10),
                      ),
                          child:Center(
                      child: Text("Actualizar Ubicacion",style:TextStyle(color:Colors.white, fontSize:18))),
                              ),
                ),

                          SizedBox(height:10),
                            
                      GestureDetector(
                        onTap:(){
                           Navigator.pop(context, MaterialPageRoute(builder: (context)=>UpdateServiceGeneral(widget.iconmodel,   widget.iconmodelUsuario))); 

                        },
                        child: Container(
                          width:MediaQuery.of(context).size.width*0.8,
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






                  ],),
                ),



                
                        ],
                      ),
                  ),
                );
              }
 void ontaop(LatLng position){
 }

  void ubicacionActual(LatLng actual_center) {
    print("ubicaicon : ${actual_center}");
    print("actual ${actual_center.latitude}");
    actuallatitude=actual_center.latitude;
    actuallongitude=actual_center.longitude;
    print("mi nueva latitud es: ${actuallatitude}");  
    print("mi nueva longitud es: ${actuallongitude}");
  }
   void OnmapCreato(GoogleMapController controller) {
   _mapcontroller = controller;
 }



 void actualizarMapa(String idTienda) async {
      String error="Ups ocurruio un erro intente de nuevo";
      String mapaActualizado="Se ha actualizado la ubicacion de la Tienda";
    if(actuallatitude ==null && actuallongitude ==null){

       bool erroguardar=await QuerysService().actualizarMapa (reference: "tienda", id:idTienda, collectionValues:TiendaModel().toJsonBodyActualizaMap(widget.iconmodel.lat, widget.iconmodel.long));
        if(erroguardar){
      showToast(error);
      }else{
            _cargando(context);
          showToastExito(mapaActualizado);
          int status=0;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(widget.iconmodelUsuario,status )));
      }
    }else{


       bool erroguardar=await QuerysService().actualizarMapa (reference: "tienda", id:idTienda, collectionValues:TiendaModel().toJsonBodyActualizaMap(actuallatitude, actuallongitude));
        if(erroguardar){
      showToast(error);
      }else{
            _cargando(context);
          showToastExito(mapaActualizado);
          int status=0;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(widget.iconmodelUsuario,status )));
      }

    }
  }

    void showToast(mensaje) {
    Fluttertoast.showToast(
        msg: mensaje,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 14.0,
    );
  }
   void showToastExito(mensaje) {
    Fluttertoast.showToast(
        msg: mensaje,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.teal[700],
        textColor: Colors.white,
        fontSize: 14.0,
    );
  }


  void _cargando(BuildContext context){
       String cardEliminado="La Tienda ha sido eliminado con exito!!";
      showDialog(context: context, builder: (context) {
        return AlertDialog(
        
          title:Text("Cargando... ", style:TextStyle(color:Colors.white, fontSize:19)),
         content:Container(
           height:130,
          
           child: Column(
             children: [
           
              Text("Por favor espere a que termine de subir los datos", style:TextStyle(color:Colors.white)),
              SizedBox(height:20),
              CircularProgressIndicator(

                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
             ],
           ),
         ),
            actions: <Widget>[
          
            
          ],
          backgroundColor: Colors.grey[800],
        );
      });
    }



}