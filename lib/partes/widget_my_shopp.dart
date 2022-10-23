import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/update/update_general_shop.dart';

class WidgetMyShopp extends StatefulWidget {
  TiendaModel iconmodel;
  UsuarioModel iconmodelUsuario;
  WidgetMyShopp(this.iconmodel, this.iconmodelUsuario);

  @override
  _WidgetMyShoppState createState() => _WidgetMyShoppState();
}

class _WidgetMyShoppState extends State<WidgetMyShopp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.95,
        height: MediaQuery.of(context).size.height*0.26,
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap:(){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateGeneralShop(widget.iconmodel,widget.iconmodelUsuario)));
                              print("estoy presionando");
        },
        child: Container(
          width: MediaQuery.of(context).size.width*0.9,
          height: MediaQuery.of(context).size.height*0.25,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(8.0),
            color:Colors.grey[800],
         ),
            child: Stack(
                            alignment: Alignment.centerLeft,
              children: [
                    Container(
                        width: MediaQuery.of(context).size.width*0.9,
          height: MediaQuery.of(context).size.height*0.25,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10.0),
         ),
                child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),      
                child: Image.network(widget.iconmodel.imagenTienda==null?"https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg":widget.iconmodel.imagenTienda,fit: BoxFit.cover,

                  loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
                   if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: Container(
              width:MediaQuery.of(context).size.width*0.65,
              height:MediaQuery.of(context).size.height*0.3,
               decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),               
            ),
              child: Transform.scale(
                scale:0.5,
                child: CircularProgressIndicator(
                   valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                   strokeWidth:9.0,
                ),
              ),
            ),
          );
                },
                      )),
                    ),


                 Positioned(
                    bottom: 0.0,
                    child:
                Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: MediaQuery.of(context).size.height*0.09,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                  color: Colors.black.withOpacity(0.54),
                ),   
          child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  Container(
                    padding:EdgeInsets.all(6),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [   
                          Text("${widget.iconmodel.nameShop[0].toUpperCase()}${widget.iconmodel.nameShop.substring(1)}",style:TextStyle(fontSize: 27, color:Colors.white, fontWeight:FontWeight.bold ),),
                           SizedBox(height: 3,),
                          Text("Categoria: ${widget.iconmodel.category}" ,style:TextStyle(fontSize: 10,color:Colors.white )),
                      ],
                    ),
                  ),
                 
      
                      Row(
                        children: [

                       GestureDetector(
                         onTap:(){
                                 
                                  print("estoy presionando Borrado");
                                 
                                  mostrarOpciones(context);
                         },
                         child: Container( 
                                width: 40,
                                height: 44,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                   
                                    Icon(Icons.delete, color:Colors.white)
                                   
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                   color: Color(0x00000000),
                                ),
                              ),
                       ),
      
      
      
      
                    ],
                                    ),
      
                ],
          ),
                ),

                 ),
              ],
            ),
        ),
      ),
    );
  }

  void borrarTienda(String idShop) async{

    bool erroguardar=await QuerysService().deleteDocument(reference: "tienda",idDocument: idShop);
 


  }


    void mostrarOpciones(BuildContext context){
       String cardEliminado="La Tienda ha sido eliminado con exito!!";
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          title:Text("¿Seguro que desea eliminar la tienda?"),
         content:Container(
           child:Text("Una vez eliminada la tienda no se podra recuperar de nuevo"),
         ),
            actions: <Widget>[
           FlatButton(
                  child: Text("Cancelar", style: (TextStyle(color: Colors.blue))),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
            FlatButton(
                  child: Text("Aceptar", style: (TextStyle(color: Colors.blue))),
                  onPressed: (){
                    borrarTienda(widget.iconmodel.idShop);
                    showToast(cardEliminado);
                    int status=0;
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(widget.iconmodelUsuario,status)));
                  },
                ),
          ],
        );
      });
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

  
}