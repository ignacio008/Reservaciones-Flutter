import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/widget_category.dart';

class Category extends StatefulWidget {
  String category;
  UsuarioModel iconmodel;
  String imagenes;
  Category(this.category, this.iconmodel, this.imagenes);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {


  List vacio=["uno"];
    ScrollController controller;
  List<TiendaModel> iconModelListCategory=[];
//tienda
   void getlistaCategory(String categorybelleza)async{
    iconModelListCategory=await FetchData().getTopTiendaCategory(categorybelleza);
    print('Tengo ${iconModelListCategory.length} cards');
    setState(() {
      
    });
  }

  

  @override
  void initState() {
    // TODO: implement initState
     controller= ScrollController();
     getlistaCategory(widget.category);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(    
      body:CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
      title: Text('Tiendas'),
      floating: true,
      pinned:true,
      flexibleSpace: Container(
        child:  Container(
                    color: Colors.black.withOpacity(0.3)
                  ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: new ExactAssetImage("${widget.imagenes}"),
                    fit: BoxFit.cover,
                  ),
                ),
      ),
      expandedHeight: 160,
    ),

             


         iconModelListCategory.isEmpty?Container(
                  
                    child: SliverList(

                      delegate:SliverChildBuilderDelegate(
                   (context, index) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          SizedBox(height:MediaQuery.of(context).size.height*0.2),
                        Icon(Icons.warning_amber_rounded, size:230, color:Colors.orange[600]),
                        Text("¡No se encuentra ninguna tienda!"),
                      ]),
                      childCount: 1,

                      ),
                    ),


                  ):





        Container(
          child: SliverList(
            delegate: SliverChildBuilderDelegate(
               (context, index) =>  Row(
                                  mainAxisAlignment: MainAxisAlignment.center,              
                                  children: [              
                  iconModelListCategory.isEmpty?CircularProgressIndicator(): SizedBox(height: 210,), WidgetCategory(iconModelListCategory[index], widget.iconmodel,)
                                ],),
                  // Construye 1000 ListTiles
                  childCount: iconModelListCategory.length,
            ),
          ),
        ),
        ],
      ),
    );
    
  }
}