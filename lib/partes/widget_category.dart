import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/info_category.dart';

class WidgetCategory extends StatefulWidget {
   TiendaModel iconmodel;
  UsuarioModel iconmodelUsuario;
  WidgetCategory(this.iconmodel, this.iconmodelUsuario);

  @override
  _WidgetCategoryState createState() => _WidgetCategoryState();
}

class _WidgetCategoryState extends State<WidgetCategory> {
  bool _loading=true;

  @override
  void initState() {
    // TODO: implement initState
    _loading=false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoCategory(widget.iconmodel,widget.iconmodelUsuario)));
      },
      child: Container(
            width: MediaQuery.of(context).size.width*0.95,
              height: MediaQuery.of(context).size.height*0.25,
            decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10.0),
            color:Colors.grey[800],
         ),
            
            child:
             Stack(
                            alignment: Alignment.centerLeft,
              children: [
                 Container(
                        width: MediaQuery.of(context).size.width*0.95,
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
                      child: Container(
                        width: MediaQuery.of(context).size.width*0.95,
                        height: MediaQuery.of(context).size.height*0.09,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
                        color: Colors.black.withOpacity(0.54),
                      ),
                          
                                      child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding:EdgeInsets.all(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              
                                Text("${widget.iconmodel.nameShop[0].toUpperCase()}${widget.iconmodel.nameShop.substring(1)}",style:TextStyle(fontSize: 27, color:Colors.white, fontWeight:FontWeight.bold ),),
                                 SizedBox(height: 3,),
                                Text("Creado por: ${widget.iconmodel.createBy==null?"nombre":widget.iconmodel.createBy}" ,style:TextStyle(fontSize: 10,color:Colors.white )),
                            ],
                          ),
                        ), 
                         Column(
                           children: [
                             Container(
                                 margin: const EdgeInsets.only(top: 12.0, right:7),
                               child: GestureDetector(
                                 onTap:(){
                                           Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoCategory(widget.iconmodel,widget.iconmodelUsuario)));
                                 },
                                 child: Container( 
                                        width: 75,
                                        height: 39,
                                        padding:EdgeInsets.all(3),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("Información",style:TextStyle( color:Colors.orange[800], fontWeight:FontWeight.bold, fontSize:12 )),
                                          
                                           
                                           
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                           color: Colors.grey[100],
                                        ),
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
    );
  }
}