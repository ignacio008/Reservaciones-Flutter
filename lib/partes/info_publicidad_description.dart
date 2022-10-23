import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/widegt_columna_uno_description.dart';

class InfoPublicidadDescription extends StatefulWidget {
  TiendaModel iconmodelTienda;
  UsuarioModel iconmodelUsuario;
  Function changepage;
  InfoPublicidadDescription(this.iconmodelTienda,this.iconmodelUsuario,this.changepage);

  @override
  State<InfoPublicidadDescription> createState() => _InfoPublicidadDescriptionState();
}

class _InfoPublicidadDescriptionState extends State<InfoPublicidadDescription> {
  @override
  Widget build(BuildContext context) {
    return 

    CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
      title: Text(widget.iconmodelTienda.nameShop),
      floating: true,
      pinned:true,
      flexibleSpace: Container(
        child:  Container(
                    color: Colors.black.withOpacity(0.3)
                  ),
                decoration: BoxDecoration(
             
                  image: DecorationImage(
                     image: NetworkImage(widget.iconmodelTienda.imagenTienda),
                    fit: BoxFit.cover,
                  ),
                ),
      ),
      expandedHeight: 240,
    ),

             

        Container(
          child: SliverList(
            delegate: SliverChildBuilderDelegate(
               (context, index) =>  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,              
                                  children: [              
                  // iconModelListCategory.isEmpty?CircularProgressIndicator(): SizedBox(height: 210,), WidgetCategory(iconModelListCategory[index], widget.iconmodel,)
                
                  WidgetColumnaUnoDesc(widget.iconmodelTienda,widget.changepage),
                                ],),
                  // Construye 1000 ListTiles
                  childCount: 1,
            ),
          ),
        ),
        ],
      );
  }
}