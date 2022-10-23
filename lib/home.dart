import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:z04_app_reservas_firebase/firebase/authenticatio.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/inicio/drawe.dart';
import 'package:z04_app_reservas_firebase/logins/loginss.dart';
import 'package:z04_app_reservas_firebase/models/reservacion_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/notification.dart';
import 'package:z04_app_reservas_firebase/notification_user.dart';
import 'package:z04_app_reservas_firebase/partes/all_my_favorite_publicidad.dart';
import 'package:z04_app_reservas_firebase/partes/all_my_reservation.dart';
import 'package:z04_app_reservas_firebase/partes/row_dos_category.dart';
import 'package:z04_app_reservas_firebase/partes/row_one_mapa.dart';
import 'package:z04_app_reservas_firebase/partes/row_two_container_my_shop.dart';
import 'package:z04_app_reservas_firebase/providers/messagin.dart';
import 'package:z04_app_reservas_firebase/providers/push_provider_notification.dart';
import 'package:z04_app_reservas_firebase/register/registe_shopp.dart';

import 'models/ejemploMapa.dart';



class home1 extends StatefulWidget {
  UsuarioModel iconmodel;
  int status;
  home1(this.iconmodel,this.status);

  @override
  _home1State createState() => _home1State();
}

class _home1State extends State<home1> {
  bool isLoaded=false;
  int index=1;
 List <MapaModel> iconmodellist=[];
 List<UsuarioModel>iconmodellistusuario=[];
 List<TiendaModel>iconmodellistTienda=[];
 List<TiendaModel>iconmodellistTienda2=[];
 List iconmodellistnotification=[];
 List<Reservation>iconmodelListReservation=[];

  void getTopChanele()async{
    iconmodellist = await FetchData().getTopChanels();
    var tamano= iconmodellist.length;
    print("EL TAMAÑO DE LA LISTA ES: ${tamano}");
    setState(() {
    });
  }
  void getTopTienda()async{
    iconmodellistTienda = await FetchData().getTopTienda();
    var tamano= iconmodellistTienda.length;
    print("EL TAMAÑO DE LA LISTA ES: ${tamano}");   
  }
  
  void getTopReservation(String idusuario)async{
    iconmodelListReservation=await FetchData().getTopMyReservation(idusuario);
    print('Tengo reservation ${iconmodelListReservation.length} cards');
    isLoaded=true;
    setState(() {  
    });
  }



  void getlista(String idusuario)async{
     iconmodellistTienda2=await FetchData().getTopTiendaMia(idusuario);
     print('Tengo ${iconmodellistTienda2.length} cards');
     iconmodellistTienda2.forEach((element) {
        final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
         _firebaseMessaging.requestPermission();
         _firebaseMessaging.getToken().then((miToken) async{
            if(element.shopToken!= miToken){
                User user = await Authentication().getCurrentUser();
                bool erroguardar=await QuerysService().SaveGeneralInfoTienda(reference: "tienda", id:element.idShop, collectionValues:TiendaModel().toJsonBodyActualizaToken(miToken),);
                print("=======================");
                print("token nuevo es");
                  }else{
                    print("=======================");
                    print("el token es igual");
                    print(widget.status);
                        }
                      });
                    });
              setState(() {
              });
            }

 @override
  void initState() {
    getTopChanele();
   getTopTienda();
   getlista(widget.iconmodel.idUsuario);
   getTopReservation(widget.iconmodel.idUsuario);

  final pushProvider = new PushNotificationProvider();
   pushProvider.initNotification(); 
   pushProvider.mensajesUno.listen((iconmodellistnotification) { 

     if(iconmodellistnotification[10]=="no-data"){     
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Notificationuser(iconmodellistnotification,widget.iconmodel))); 
        print("${iconmodellistnotification} Contar es felicidades  ${iconmodellistnotification.length}");
          }else{
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NotificacionesReservas(iconmodellistnotification,widget.iconmodel)));
              print("${iconmodellistnotification} Contar es form  ${iconmodellistnotification.length}");
          }
      
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Notificationuser(iconmodellistnotificationCongratulation,widget.iconmodelUsuario))); 
     
   });
 
     final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
        _firebaseMessaging.requestPermission();
        _firebaseMessaging.getToken().then((miToken) async{
        print("mi Token es: ");
        print("mi token essss: ${miToken}");
        if(widget.iconmodel.myToken!=miToken){
           User user = await Authentication().getCurrentUser();
            // UsuarioModel adminmodel = await FetchData().getAdmin(user.uid);
            bool erroguardar=await QuerysService().actualizarInfo(reference: "usuarios", id:user.uid, collectionValues:UsuarioModel().toJsonBodyActualizarToken(user.uid,widget.iconmodel.name,widget.iconmodel.lastName,miToken),);
            print("=======================");
            print("token nuevo es");
            }else{
              print("=======================");
              print("el token es igual");
            }
          });

   
  
   
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title:Text("Reservaciones"),
            bottomOpacity: 0.0,
        elevation: 0.0,
         backgroundColor: Colors.blue[700],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color:Colors.grey[200],
         child: Column(
           children:[

             Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children:[
                AllMFavoritePublicity(widget.iconmodel),
                
               ],
             ),

            iconmodelListReservation.isEmpty?
           const Visibility(
          visible: false,
          child: Text("test1",
            style: TextStyle(fontSize: 10),
          ),
        ):
              GestureDetector(
                onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AllMyReservation(widget.iconmodel) ));
                },
                child: Container(
                  width:MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height*0.074,
                  color:Colors.grey[800],
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                     Text("Tienes ${iconmodelListReservation.length} ${iconmodelListReservation.length==1?"reservacion":"reservaciones"} ${iconmodelListReservation.length==1?"realizada":"realizadas"}",
                     
                     
                      style:TextStyle(color:Colors.white)),
                    SizedBox(width:MediaQuery.of(context).size.width*0.02),
                    Icon(Icons.perm_contact_cal_rounded, color:Colors.yellow),
                  ]),
                ),
              ),


             SizedBox(height:MediaQuery.of(context).size.height*0.035),
               Container(
                 width: MediaQuery.of(context).size.width*0.9,
                 child: const Text("Tiendas", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold ) )),

                  SizedBox(height:MediaQuery.of(context).size.height*0.02),
             Row(
                mainAxisAlignment: MainAxisAlignment.center,
               children:[
                RowDosCategory(widget.iconmodel),
               ],
             ),
             
               SizedBox(height:MediaQuery.of(context).size.height*0.04),


               Container(
                 width: MediaQuery.of(context).size.width*0.9,
                 child: Text("Ubicaciones de Tiendas", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold ) )),

                  SizedBox(height:MediaQuery.of(context).size.height*0.02),

                iconmodellistTienda.isEmpty?Container(
                  width:200,
                  height:200,
                  child:CircularProgressIndicator()
                ):
              Column(
               children:[
                // RowOneMapa(iconmodellist[index]),
                  iconmodellistTienda.isEmpty?CircularProgressIndicator():  RowOneMapa(iconmodellistTienda),
                  
               ],
             ),

           ],
         ),
        ),
        drawer:_getDrawer(context),
       floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterShopp(widget.iconmodel))); 
        },
        label: const Text('Crear Tienda'),
        icon: const Icon(Icons.add_business_rounded),
        backgroundColor:  Colors.blue[600],
      ), 
    ); 
    
    
  }
  
  Widget _getDrawer(BuildContext context) {
    return DrawerMenu(widget.iconmodel);
  }

  
}           