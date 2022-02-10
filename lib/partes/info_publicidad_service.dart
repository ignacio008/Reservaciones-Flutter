import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/models/service_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/widget_column_service_carrusel.dart';

class InfoPublicidadService extends StatefulWidget {
  TiendaModel iconmodel;
  
  UsuarioModel iconmodelUsuario;
  InfoPublicidadService(this.iconmodel,this.iconmodelUsuario);

  @override
  State<InfoPublicidadService> createState() => _InfoPublicidadServiceState();
}

class _InfoPublicidadServiceState extends State<InfoPublicidadService> {
  SwiperController _controller = SwiperController();

List<Service> iconModelListService=[];
    void getlistaCategory(String idShop)async{
    iconModelListService=await FetchData().getTopServicios(idShop);
    print('Tengo ${iconModelListService.length} serivicios');
    setState(() {
      
    });
  }

   @override
  void initState() {
    // TODO: implement initState
    getlistaCategory(widget.iconmodel.idShop);
      _controller = new SwiperController();
      
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: new AppBar(
        
          title:Text("Servicios de la tienda"),
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.blue[700],
        ),
      body: Column(
        children: [
          Center(
            child: Container(
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.80,
             
            child:
            
            
               

              iconModelListService.isEmpty?Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                  Icon(Icons.warning_amber_rounded, size:230, color:Colors.orange[600]),
                  Text("¡No se encuentra ningun servicio para la tienda!"),
                 
                ]),


              ):
              Swiper(
               controller: _controller,
                itemBuilder: (BuildContext context,int index){
                 
                  return new 
                   Container(
                    child: WidgetColumnServiceCarrusel(iconModelListService[index], widget.iconmodel, widget.iconmodelUsuario));
                },
                itemCount: iconModelListService.length,
                viewportFraction: 0.8,
            scale: 0.9,


              
                control: new SwiperControl(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.2),
                  color:Colors.white,
                ),
                
               
              
                   
    pagination: new SwiperPagination(
                  builder: SwiperCustomPagination(
                     builder: (BuildContext context, SwiperPluginConfig config) {
                   
                  
                   
                     return Stack(
                      children:[
                      Positioned(
                       bottom:0,
                        child: Container(
                          
                         ),
                      ),
                       ],
                     );
                    
                     }
                 ),
    ),
              ),

         
              ),
          ),







        //    Row(children: [
        //  iconModelListService.isEmpty?CircularProgressIndicator():  WidgetColumnServiceDatos(iconModelListService[numero]),
        //    ],),

        ],
      ),
        
    );
  }
}