import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/models/admin_publicidad_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/all_my_favorite_widget_publicity.dart';

class AllMFavoritePublicity extends StatefulWidget {
  UsuarioModel iconmodelUsuario;
  AllMFavoritePublicity(this.iconmodelUsuario);

  @override
  State<AllMFavoritePublicity> createState() => _AllMFavoritePublicityState();
}

class _AllMFavoritePublicityState extends State<AllMFavoritePublicity> {
   List<AdminModel>iconModelListPublicidadAdmin=[];
  SwiperController _controller = SwiperController();
  bool isLoaded=false;

 

  void getlistaPublicidad()async{
    iconModelListPublicidadAdmin=await FetchData().getTopPublicidadUrl();
    print('Tengo ${iconModelListPublicidadAdmin.length} publicidad');
    isLoaded=true;
    setState(() {
      
    });
  }



  





  @override
  void initState() {
    // TODO: implement initState
 
      _controller = new SwiperController();
      getlistaPublicidad();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
         width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.23,
              decoration: BoxDecoration(
               gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue[700],
                Colors.grey[200],
              ],
            ),
             
                ),

        child:

        
         isLoaded==false? Container(
       child: Center(
         child: Column(
                          children:[
                           
                        Container( 
                          width: MediaQuery.of(context).size.width*0.5,
                          height:MediaQuery.of(context).size.height*0.2,
                   
             child: Transform.scale(
                scale: 0.9,
               child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue[800])
               ))) 
                        ]),
       ),

      ):    
             
             iconModelListPublicidadAdmin.isEmpty?Container(
                   width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.23,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                  Icon(Icons.warning_amber_rounded, size:80, color:Colors.orange[600]),
                  Text("¡No se encuentra ningun servicio para la tienda!"),
                ]),


              ):
              Swiper(
                autoplay: true,
                duration: 500 ,
                autoplayDelay:8000,
               controller: _controller,
                itemBuilder: (BuildContext context,int index){
                 
                  return new  Container(
                    decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                  color:Colors.grey[200],
                ),
                    child: AllMyFavoriteWidgetPublicity(iconModelListPublicidadAdmin[index], widget.iconmodelUsuario));
                },
                itemCount: iconModelListPublicidadAdmin.length,
                viewportFraction: 0.89,
            scale: 0.94,


              
                control: new SwiperControl(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.2),
                  color:Colors.transparent,
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



    );
  }
}