import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/widget_my_shopp.dart';

class MyShop extends StatefulWidget {
  UsuarioModel iconmodel;
  MyShop(this.iconmodel);

  @override
  _MyShopState createState() => _MyShopState();
}

class _MyShopState extends State<MyShop> {
  ScrollController controller;
  List<TiendaModel> iconModelList=[];
  

 void getlista(String idusuario)async{
    iconModelList=await FetchData().getTopTiendaMia(idusuario);
    print('Tengo ${iconModelList.length} cards');
    setState(() {
      
    });
  }
  @override
  void initState() {
    controller= ScrollController();
    getlista(widget.iconmodel.idUsuario);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        appBar: new AppBar(
        iconTheme: IconThemeData(
    color: Colors.white, //change your color here
  ),
          title:Text("Tiendas", style:TextStyle(color:Colors.white)),
          backgroundColor: Colors.blue[700],
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
    body: Center(
      child: Column(
        children: [
             SizedBox(height:20),
          Text("Mis tiendas", style:TextStyle(fontSize:28,fontWeight:FontWeight.bold)),
             SizedBox(height:20),
          Container(
                width:MediaQuery.of(context).size.width*0.95,
                height: MediaQuery.of(context).size.height*0.80,
               
           child: 
           
            iconModelList.isEmpty?Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                      Icon(Icons.warning_amber_rounded, size:230, color:Colors.orange[600]),
                      Text("¡No Tienes ninguna tienda creada!"),
                    ]),


                  ):
           Scrollbar(
                isAlwaysShown: true,
                controller: controller,
                child: ListView.builder(
                   itemCount: iconModelList.length,
                  controller: controller,
                  
                   itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,              
                              children: [              
              iconModelList.isEmpty?CircularProgressIndicator(): SizedBox(height:80), WidgetMyShopp(iconModelList[index], widget.iconmodel),
                            ],);
                      },
                  



                  
                ),
              ),
            ),
        ],
      ),
    ),
    );
  }
}