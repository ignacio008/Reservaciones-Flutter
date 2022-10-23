import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/models/reservacion_model.dart';
import 'package:z04_app_reservas_firebase/models/service_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/reservar.dart';


class WidgetColumnServiceCarrusel extends StatefulWidget {
   Service iconmodelService;
  TiendaModel iconmodel;
  UsuarioModel iconmodelUsuario;
  WidgetColumnServiceCarrusel(this.iconmodelService,this.iconmodel,this.iconmodelUsuario);

  @override
  _WidgetColumnServiceCarruselState createState() => _WidgetColumnServiceCarruselState();
}

class _WidgetColumnServiceCarruselState extends State<WidgetColumnServiceCarrusel> {
   List<Reservation> iconmodellistReservation=[];

    bool loading =true;
  void getTopReservation()async{
    iconmodellistReservation = await FetchData().getTopResevation();
    var tamano= iconmodellistReservation.length;
    print("EL TAMAÑO DE LA LISTA ES: ${tamano}");
   
   
  }
   @override
  void initState() {
    getTopReservation();
    super.initState();
    setState(() {
      loading=false;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height:35),
        Text("${widget.iconmodelService.nameService[0].toUpperCase()}${widget.iconmodelService.nameService.substring(1)}",
        
        style:TextStyle(fontSize:28, fontWeight:FontWeight.bold)),
         SizedBox(height:45),

           widget.iconmodelService.imageService.isEmpty?Container(
              width:MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                 CircularProgressIndicator()
                 
                ]),


              ):

        Container(
          width:MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.35,
              decoration: BoxDecoration(
           color: 
           
           
           Colors.black.withOpacity(0.74),
        ),
          child: 

         
          GestureDetector(
                   onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Reservar(widget.iconmodel,widget.iconmodelService,widget.iconmodelUsuario,iconmodellistReservation)));
    
                              print("");
                     },
            child: Container(
               width:MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.35,
              child: Image.network(widget.iconmodelService.imageService==null?"https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg":widget.iconmodelService.imageService,fit: BoxFit.cover,

                  loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
                   if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: Container(
              width:MediaQuery.of(context).size.width*0.7,
              height:MediaQuery.of(context).size.height*0.3,
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
        ),

          Container(
            padding: EdgeInsets.all(25),
            child: Column(
            children: [
              
               Row(  
              children: [
                  Text("Descripcion del servicio:", style:TextStyle(fontSize:16, fontWeight: FontWeight.bold, color:Colors.black  )),
            ]),

              SizedBox(height:8),
             Row(  
              children: [
                  Flexible(
                    child: Text(widget.iconmodelService.descriptionService, style:TextStyle(fontSize:14,color:Colors.black ),
                    maxLines: widget.iconmodelService.descriptionService.length>=40?4:1,
                    ),
                    ),
            ]),
             SizedBox(height:12),
             Row(  
              children: [
                  Text("Tiempo que dura el servicio ${widget.iconmodelService.durationService} minutos", style:TextStyle(fontSize:14, color:Colors.black, fontWeight: FontWeight.bold,  )),
            ]),

 SizedBox(height:20),
             GestureDetector(
                     onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Reservar(widget.iconmodel,widget.iconmodelService,widget.iconmodelUsuario,iconmodellistReservation)));
    
                              print("");
                     },
                     child: Container( 
                            width:MediaQuery.of(context).size.width*0.56,
                            height:MediaQuery.of(context).size.height*0.07,
                        
                          
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Reservar",style:TextStyle( color:Colors.white, fontWeight:FontWeight.bold,fontSize:19)),
                                SizedBox(width: 5,),
                                Icon(Icons.calendar_today_rounded, color:Colors.white, size:21)
                               
                              ],
                            ),
                            decoration: BoxDecoration(
                             color:Colors.blue[600],
                              borderRadius:BorderRadius.circular(7),
                             
                            ),
                          ),
                   ),





            ],
          ),
          
          ),
      ],
    );
  }
}