import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/models/admin_publicidad_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/info_publicidad_description.dart';
import 'package:z04_app_reservas_firebase/partes/info_publicidad_service.dart';

class InfoPublicidad extends StatefulWidget {
  AdminModel iconmodelPublicidadUrl;
  UsuarioModel iconmodelUsuario;
  
  InfoPublicidad(this.iconmodelPublicidadUrl,this.iconmodelUsuario);

  @override
  State<InfoPublicidad> createState() => _InfoPublicidadState();
}

class _InfoPublicidadState extends State<InfoPublicidad> with SingleTickerProviderStateMixin {
   TabController controlador;

  List<TiendaModel> iconmodellistTienda=[];



   void getlistaCategory(String idShopp)async{
    iconmodellistTienda=await FetchData().getTopTiendaPublicidad(idShopp);
    print('Tengo ${iconmodellistTienda.length} tiendas');
    setState(() {
      
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    controlador = new TabController(length: 2, vsync: this);
    getlistaCategory(widget.iconmodelPublicidadUrl.urlTienda);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 

     Scaffold(
      
          bottomNavigationBar: new Material(
          color:Colors.blue[600],
          child: TabBar(
            controller:controlador,
            padding:EdgeInsets.all(0),
            labelPadding:EdgeInsets.all(0),
            tabs: [
              Tab(
                
                icon:Icon(Icons.calendar_today,size:20),
                text:"Descripcion",
              ),
               Tab(
                icon:Icon(Icons.alarm,size:20),
                text:"Servicios",
              ),
            

            ],
          ),
        ),
      body: TabBarView(
          controller:controlador,
          children: [
       iconmodellistTienda.isEmpty?
       
       
       Container(
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
       
          InfoPublicidadDescription(iconmodellistTienda[0], widget.iconmodelUsuario),
        //  ColumnaUnoDescription(widget.iconmodel),

       iconmodellistTienda.isEmpty?CircularProgressIndicator()  :    InfoPublicidadService(iconmodellistTienda[0], widget.iconmodelUsuario),
        //  ColumnaDosService(widget.iconmodel,widget.iconmodelUsuario,),
        
          ],
        )
    );
  }
}