import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/inicio/admin_publicidad.dart';
import 'package:z04_app_reservas_firebase/models/admin_publicidad_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/form_publicity_widget.dart';

class FormPublicity extends StatefulWidget {
  AdminModel iconmodelPublicidadUrl;
  UsuarioModel iconmodelUsuario;
  FormPublicity(this.iconmodelPublicidadUrl,this.iconmodelUsuario);

  @override
  State<FormPublicity> createState() => _FormPublicityState();
}

class _FormPublicityState extends State<FormPublicity> {

  List<AdminModel> iconmodellistPublicidad=[];
  void getTopTienda(String idPublicidad)async{
    iconmodellistPublicidad = await FetchData().getTopPublicidadFormulario(idPublicidad);
    var tamano= iconmodellistPublicidad.length;
    print("EL TAMAÑO DE LA LISTA ES: ${tamano}");   
    setState(() {
    });
  }

  @override
  void initState() {
    getTopTienda(widget.iconmodelPublicidadUrl.idPublicidad);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
       backgroundColor: Colors.grey[700],
        elevation:0.0,
        bottomOpacity: 0.0,
      ),
      body: Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        color:Colors.grey[700],
        child:
        
        
        iconmodellistPublicidad.isEmpty?
        
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
        
         FormPublicityWidget(iconmodellistPublicidad[0], widget.iconmodelUsuario),
        ),
      
    );
  }
}