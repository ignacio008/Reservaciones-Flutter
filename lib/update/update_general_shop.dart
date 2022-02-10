import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/models/service_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/qr_scanner.dart';
import 'package:z04_app_reservas_firebase/update/update_service.dart';
import 'package:z04_app_reservas_firebase/update/widget_update_map.dart';
import 'package:z04_app_reservas_firebase/update/widget_update_photo.dart';
import 'package:z04_app_reservas_firebase/update/widget_update_shopp.dart';

class UpdateGeneralShop extends StatefulWidget {
  TiendaModel iconmodel;
  UsuarioModel iconmodelUsuario;
  UpdateGeneralShop(this.iconmodel, this.iconmodelUsuario);

  @override
  _UpdateGeneralShopState createState() => _UpdateGeneralShopState();
}

class _UpdateGeneralShopState extends State<UpdateGeneralShop> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
        
          title:Text("Edite su Tienda", style:TextStyle(color:Colors.white)),
         backgroundColor: Colors.blue[700],
          bottomOpacity: 0.0,
        elevation: 0.0,
        ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child:Column(
          children:[
            SizedBox(height: 35,),
            Text('"${widget.iconmodel.nameShop.toUpperCase()}"', style: TextStyle(fontSize: 38, fontWeight:FontWeight.w900, color:Colors.blueGrey[800] )),
            SizedBox(height: 20,),
            Row(
              children: [
               
                GestureDetector(
                  onTap:(){
                              print("Se presiona");
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>WidgetUpdatePhoti(widget.iconmodel,widget.iconmodelUsuario)));
                            },
                  child: Container(
                   width: MediaQuery.of(context).size.width,  
                   padding:EdgeInsets.all(7),
                    child: Container(
                       width: MediaQuery.of(context).size.width,
                        height: 120,
                         
                      child: Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.54),
                        ),
                         padding:EdgeInsets.all(17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Foto", style: TextStyle(fontSize: 22, fontWeight:FontWeight.w600, color:Colors.white )),
                            GestureDetector(
                              onTap:(){
                                print("Se presiona");
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WidgetUpdatePhoti(widget.iconmodel,widget.iconmodelUsuario)));
                              },
                              child: Icon(Icons.edit,color:Colors.white)),
                            
                          ],
                        ),
                      ),
                       decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                                 image: new ExactAssetImage("assets/foto.jpg"),
                                fit:BoxFit.cover,
                              ),
                        ),
                    ),
                     decoration:BoxDecoration(
                       border: Border(bottom: BorderSide(color: Colors.grey[300], width: 2)),
                        color:Colors.grey[200],
                    ),
                    ),
                ),
              ],
            ),






            Row(
              children: [
               
                GestureDetector(
                   onTap:(){
                              print("Se presiona datos de la tienda");
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>WidgetUpdateShopp(widget.iconmodel, widget.iconmodelUsuario)));
                            },
                  child: Container(
                   width: MediaQuery.of(context).size.width,  
                   padding:EdgeInsets.all(7),
                    child: Container(
                       width: MediaQuery.of(context).size.width,
                        height: 120,
                         
                      child: Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.54),
                        ),
                         padding:EdgeInsets.all(17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Datos de la tienda", style: TextStyle(fontSize: 22, fontWeight:FontWeight.w600, color:Colors.white )),
                            GestureDetector(
                              onTap:(){
                                print("Se presiona datos de la tienda");
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WidgetUpdateShopp(widget.iconmodel, widget.iconmodelUsuario)));
                              },
                              child: Icon(Icons.edit,color:Colors.white)),
                            
                          ],
                        ),
                      ),
                       decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                                 image: new ExactAssetImage("assets/tienda.jpg"),
                                fit:BoxFit.cover,
                              ),
                        ),
                    ),
                     decoration:BoxDecoration(
                       border: Border(bottom: BorderSide(color: Colors.grey[300], width: 2)),
                        color:Colors.grey[200],
                    ),
                    ),
                ),
              ],
            ),














            
            Row(
              children: [
               
                GestureDetector(
                   onTap:(){
                              print("Se presiona");
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateServiceGeneral(widget.iconmodel,widget.iconmodelUsuario)));
                            },
                  child: Container(
                   width: MediaQuery.of(context).size.width,  
                   padding:EdgeInsets.all(7),
                    child: Container(
                       width: MediaQuery.of(context).size.width,
                        height: 120,
                         
                      child: Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.54),
                        ),
                         padding:EdgeInsets.all(17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Servicios", style: TextStyle(fontSize: 22, fontWeight:FontWeight.w600, color:Colors.white )),
                            GestureDetector(
                              onTap:(){
                                print("Se presiona");
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateServiceGeneral(widget.iconmodel,widget.iconmodelUsuario)));
                              },
                              child: Icon(Icons.edit,color:Colors.white)),
                            
                          ],
                        ),
                      ),
                       decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                                 image: new ExactAssetImage("assets/servicios.png"),
                                fit:BoxFit.cover,
                              ),
                        ),
                    ),
                     decoration:BoxDecoration(
                       border: Border(bottom: BorderSide(color: Colors.grey[300], width: 2)),
                        color:Colors.grey[200],
                    ),
                    ),
                ),
              ],
            ),



          
              Row(
              children: [
               
                GestureDetector(
                  onTap:(){
                              print("Se presiona");
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>WidgetUpdateMap(widget.iconmodel, widget.iconmodelUsuario)));
                            },
                  child: Container(
                   width: MediaQuery.of(context).size.width,  
                   padding:EdgeInsets.all(7),
                    child: Container(
                       width: MediaQuery.of(context).size.width,
                        height: 120,
                         
                      child: Container(
                          decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black.withOpacity(0.54),
                        ),
                         padding:EdgeInsets.all(17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Ubicacion de la Tienda", style: TextStyle(fontSize: 22, fontWeight:FontWeight.w600, color:Colors.white )),
                            GestureDetector(
                              onTap:(){
                                print("Se presiona");
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>WidgetUpdateMap(widget.iconmodel, widget.iconmodelUsuario)));
                              },
                              child: Icon(Icons.edit,color:Colors.white)),
                            
                          ],
                        ),
                      ),
                       decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                                 image: new ExactAssetImage("assets/mapa.jpg"),
                                fit:BoxFit.cover,
                              ),
                        ),
                    ),
                     decoration:BoxDecoration(
                       border: Border(bottom: BorderSide(color: Colors.grey[300], width: 2)),
                        color:Colors.grey[200],
                    ),
                    ),
                ),
              ],
            ),

          
           ],
        ),
      ),


      
        floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>QrScanner(widget.iconmodel, widget.iconmodelUsuario))); 
        },
        label: const Text('Escanear QR'),
        icon: const Icon(Icons.qr_code_scanner),
        backgroundColor: Colors.black,
      ), 


    ); 
    
  }
}