import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/models/service_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/widger_columna_dos_service.dart';
import 'package:z04_app_reservas_firebase/register/resgister_new_service.dart';

class UpdateServiceGeneral extends StatefulWidget {
  TiendaModel iconmodel;
  UsuarioModel iconmodelUsuario;
  UpdateServiceGeneral(this.iconmodel,this.iconmodelUsuario);

  @override
  _UpdateServiceGeneralState createState() => _UpdateServiceGeneralState();
}

class _UpdateServiceGeneralState extends State<UpdateServiceGeneral> {
  ScrollController controller;
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
      controller= ScrollController();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
          title:Text("Edite su Servicios", style:TextStyle(color:Colors.white)),
          backgroundColor: Colors.blue[700],
          bottomOpacity: 0.0,
          elevation: 0.0,
        ),
        body:
        
        
        iconModelListService.isEmpty?
           Center(child:   Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                      Icon(Icons.warning_amber_rounded, size:230, color:Colors.orange[600]),
                      Text("¡No Tienes ningun Servicio!"),
                      ]),
                     ),

                  ):
        
        Container(
          width:MediaQuery.of(context).size.width,
          height:MediaQuery.of(context).size.height,
          child:Column(
            children:[
               Container(
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.895,
             color:Colors.white,
            child:
                  Scrollbar(
                 isAlwaysShown: true,
                 controller: controller,
                 child: ListView.builder(
                    itemCount: iconModelListService.length,
                   controller: controller,
                  
                    itemBuilder: (BuildContext context, int index) {
                             return Row(
                               mainAxisAlignment: MainAxisAlignment.center,              
                               children: [              
                 iconModelListService.isEmpty?CircularProgressIndicator(): SizedBox(height:MediaQuery.of(context).size.height*0.31), WidgetColumnaDosService(iconModelListService[index], widget.iconmodel,widget.iconmodelUsuario),
                             ],);
                       },
                   
                 ),
                 ),
               ),
            ],
          ),
        ),
      

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterNewService(widget.iconmodel,iconModelListService, widget.iconmodelUsuario)
            ));
        },
        label: const Text('Agregar Servicio'),
        icon: const Icon(Icons.add_circle  ),
        backgroundColor:  Colors.blue[600],
      ), 
    );
    
  }

  void _agregarService() {}
}