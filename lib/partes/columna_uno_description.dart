import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/partes/widegt_columna_uno_description.dart';


class ColumnaUnoDescription extends StatefulWidget {
  TiendaModel iconmodel;
  Function changeAnimation;
 
  ColumnaUnoDescription(this.iconmodel,this.changeAnimation);

  @override
  _ColumnaUnoDescriptionState createState() => _ColumnaUnoDescriptionState();
}

class _ColumnaUnoDescriptionState extends State<ColumnaUnoDescription> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
      title: Text(widget.iconmodel.nameShop),
      floating: true,
      pinned:true,
      flexibleSpace: Container(
        child:  
        
        widget.iconmodel.imagenTienda.isEmpty?Container(
          width:MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height*0.5,
        child:Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.scale(
              scale: 3.0,
              child: CircularProgressIndicator(
                strokeWidth: 4.0,
              ),
            ),
          ],
        )
        ):
        
        Container(
                    color: Colors.black.withOpacity(0.3)
                  ),
                decoration: BoxDecoration(
             
                  image: DecorationImage(
                     image: widget.iconmodel.imagenTienda.isEmpty? CircularProgressIndicator(): NetworkImage(widget.iconmodel.imagenTienda),
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
                
                  WidgetColumnaUnoDesc(widget.iconmodel,widget.changeAnimation),
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