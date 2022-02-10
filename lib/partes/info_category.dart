import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/models/service_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/columna_dos_service.dart';
import 'package:z04_app_reservas_firebase/partes/columna_uno_description.dart';

class InfoCategory extends StatefulWidget {
  TiendaModel iconmodel;
  UsuarioModel iconmodelUsuario;
  InfoCategory(this.iconmodel,this.iconmodelUsuario);

  @override
  _InfoCategoryState createState() => _InfoCategoryState();
}

class _InfoCategoryState extends State<InfoCategory>with SingleTickerProviderStateMixin {
   TabController controlador;

  // List<Service> iconModelListService=[];
  //   void getlistaCategory(String idShop)async{
  //   iconModelListService=await FetchData().getTopServicios(idShop);
  //   print('Tengo ${iconModelListService.length} serivicios');
  //   setState(() {
      
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    controlador = new TabController(length: 2, vsync: this);
    // controlador.animateTo(1);
     //getlistaCategory(widget.iconmodel.idShop);
    super.initState();
  }
  // changepage(int page){
  //   //controlador.animateTo(page);
  // }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
          bottomNavigationBar: new Material(
          color:Colors.blue[600],
          child: TabBar(
            padding:EdgeInsets.all(0),
            labelPadding:EdgeInsets.all(0),
            controller:controlador,
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
            
         ColumnaUnoDescription(widget.iconmodel),
         ColumnaDosService(widget.iconmodel,widget.iconmodelUsuario,),
        
          ],
        )
    );
  }
}