import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/models/reservacion_model.dart';
import 'package:z04_app_reservas_firebase/models/service_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/reservar.dart';
import 'package:z04_app_reservas_firebase/update/update_service_update.dart';


class WidgetColumnaDosService extends StatefulWidget {
  Service iconmodelService;
  TiendaModel iconmodel;
  UsuarioModel iconmodelUsuario;
  WidgetColumnaDosService(this.iconmodelService,this.iconmodel,this.iconmodelUsuario);

  @override
  _WidgetColumnaDosServiceState createState() => _WidgetColumnaDosServiceState();
}

class _WidgetColumnaDosServiceState extends State<WidgetColumnaDosService> {

  
  

  @override
  void initState() {
   
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return 
    
    
    
    

    
    Container(
      
      child: Container(
       
        width:MediaQuery.of(context).size.width*0.85,
         height: widget.iconmodelService.descriptionService.length>78
         ?MediaQuery.of(context).size.height*0.32
         :MediaQuery.of(context).size.height*0.27,
        
        decoration: BoxDecoration(
           color:Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                                    image: NetworkImage(widget.iconmodelService.imageService==null?"https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg":widget.iconmodelService.imageService),
                                  fit:BoxFit.cover,
                                ),
            ),
        child:Container(
          padding:EdgeInsets.all(15),
               width:MediaQuery.of(context).size.width,
         height: widget.iconmodelService.descriptionService.length>78
         ?MediaQuery.of(context).size.height*0.32
         :MediaQuery.of(context).size.height*0.27,
            decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(8),
              color: Colors.black.withOpacity(0.33),
            ),
          child: Column(children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text("${widget.iconmodelService.nameService}", style:TextStyle(fontSize:20, fontWeight: FontWeight.bold, color:Colors.white )),
            ]),
            SizedBox(height:20),
             Row(  
              children: [
                  Text("Descripcion del servicio:", style:TextStyle(fontSize:16, fontWeight: FontWeight.bold, color:Colors.white  )),
            ]),
              SizedBox(height:8),
             Row(  
              children: [
                  Flexible(
                    child: Text(widget.iconmodelService.descriptionService, style:TextStyle(fontSize:14,color:Colors.white ),
                    maxLines: widget.iconmodelService.descriptionService.length>=40?4:1,
                    ),
                    ),
            ]),
            SizedBox(height:14),
             Row(  
              children: [
                  Text("Tiempo que dura el servicio ${widget.iconmodelService.durationService} minutos", style:TextStyle(fontSize:14, color:Colors.white, fontWeight: FontWeight.bold,  )),
            ]),
            widget.iconmodelService.descriptionService.length>78?SizedBox(height:10):SizedBox(height:20),
          
             Container(
               
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   
                   GestureDetector(
                           onTap:(){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateServiceUpdate(widget.iconmodelService,widget.iconmodel,widget.iconmodelUsuario,)));
    
                                    print("");
                           },
                           child: Container( 
                                  width: 110,
                                  height: 44.6,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Editar",style:TextStyle( color:Colors.black, fontWeight:FontWeight.bold,fontSize:14)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.edit, color:Colors.black, size:20)
                                     
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                     color: Colors.white,
                                  ),
                                ),
                         ),


                         GestureDetector(
                           onTap:(){
                             String eliminarService="Se ha eliminado su servicio";
                      borrarTienda(widget.iconmodelService.idService);
                      showToast(eliminarService);
                      int status=0;
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(widget.iconmodelUsuario,status)));
                                    print("");
                           },
                           child: Container( 
                                  width: 110,
                                  height: 44.6,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Borrar",style:TextStyle( color:Colors.white, fontWeight:FontWeight.bold,fontSize:16)),
                                      SizedBox(width: 5,),
                                      Icon(Icons.delete, color:Colors.white, size:22)
                                     
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                     color: Colors.red,
                                  ),
                                ),
                         ),
                 ],
               ),
             ),
          ],
          ),
        )
      ),
    );
  }
   void borrarTienda(String idService) async{

    bool erroguardar=await QuerysService().deleteDocument(reference: "servicios",idDocument: idService);
  }
   void showToast(mensaje) {
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
}