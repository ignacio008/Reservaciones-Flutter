import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/models/admin_publicidad_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/form_publicity.dart';
import 'package:z04_app_reservas_firebase/partes/info_publicidad.dart';
import 'package:z04_app_reservas_firebase/partes/my_shop.dart';

class AllMyFavoriteWidgetPublicity extends StatefulWidget {
  AdminModel iconmodelPublicidadUrl;
  UsuarioModel iconmodelUsuario;
  AllMyFavoriteWidgetPublicity(this.iconmodelPublicidadUrl,this.iconmodelUsuario);

  @override
  State<AllMyFavoriteWidgetPublicity> createState() => _AllMyFavoriteWidgetPublicityState();
}

class _AllMyFavoriteWidgetPublicityState extends State<AllMyFavoriteWidgetPublicity> {


  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        print("hola ${widget.iconmodelPublicidadUrl.urlPublicidad}");
         String _url="${widget.iconmodelPublicidadUrl.urlPublicidad}";


      widget.iconmodelPublicidadUrl.typePublicidad==0
      ?launch(_url) 
      
      : widget.iconmodelPublicidadUrl.typePublicidad==1? Navigator.push(context, MaterialPageRoute(builder: (context)=>FormPublicity(widget.iconmodelPublicidadUrl, widget.iconmodelUsuario)))
      
      : Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoPublicidad(widget.iconmodelPublicidadUrl, widget.iconmodelUsuario)));


        
      },
      child: Container(
               width:MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.35,
                 decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    color:Colors.grey[800],
                  ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.0),

                
                child: Image.network(widget.iconmodelPublicidadUrl.imagenPublicidad==null?"https://ep01.epimg.net/elpais/imagenes/2019/10/30/album/1572424649_614672_1572453030_noticia_normal.jpg":widget.iconmodelPublicidadUrl.imagenPublicidad,fit: BoxFit.cover, 
                loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent loadingProgress) {
                   if (loadingProgress == null) {
            return child;
          }
          return Center(
            child: Container(
              width:MediaQuery.of(context).size.width*0.6,
              height:MediaQuery.of(context).size.height*0.3,
              child: Transform.scale(
                scale:0.5,
                child: CircularProgressIndicator(
                   valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                   strokeWidth:7.0,
                ),
              ),
            ),
          );
                },
                
                  ),
                ),
    
      ),
    );
  }

  void _launchURL() async {
    String _url="https://www.google.com/";
  if (!await launch(_url)) throw 'Could not launch $_url';
}
}