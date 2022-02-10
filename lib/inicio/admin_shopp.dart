import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/inicio/admin_publicidad.dart';
import 'package:z04_app_reservas_firebase/inicio/admin_shopp_widget.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';


class AdminShopp extends StatefulWidget {
  UsuarioModel iconmodelUsuario;
  AdminShopp(this.iconmodelUsuario);

  @override
  State<AdminShopp> createState() => _AdminShoppState();
}

class _AdminShoppState extends State<AdminShopp> {

  ScrollController controller;
  List<TiendaModel> iconmodellistTienda=[];



  void getTopTienda()async{
    iconmodellistTienda = await FetchData().getTopTienda();
    var tamano= iconmodellistTienda.length;
    print("EL TAMAÑO DE LA LISTA ES: ${tamano}");   
    setState(() {
    });
  }

  @override
  void initState() {
    controller= ScrollController();
    getTopTienda();
     
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    var url_Publicidad;
    return Scaffold(
      appBar:AppBar(
        title:Text("Tiendas"),
        elevation:0.0,
        bottomOpacity:0.0,
        backgroundColor: Colors.blue[700],
      ),
      body: Container(
         width:MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
       color:Colors.white,
       
        child: Column(
          children:[
            SizedBox(height:20),
             Text("Escoge una tienda", style:TextStyle(fontSize:28,fontWeight:FontWeight.bold)),

                    SizedBox(height:20),


                    
                    Container(
                       width:MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height*0.8,
                      


                      child:

                     iconmodellistTienda.isEmpty?Container(
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
               itemCount: iconmodellistTienda.length,
              controller: controller,
              
               itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,              
                          children: [              
          iconmodellistTienda.isEmpty?CircularProgressIndicator(): SizedBox(height:80), AdminShoppWidget(iconmodellistTienda[index], widget.iconmodelUsuario),
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