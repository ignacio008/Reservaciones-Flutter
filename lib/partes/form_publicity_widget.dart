import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/models/admin_publicidad_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';

class FormPublicityWidget extends StatefulWidget {
  AdminModel iconmodelPublicidadUrl;
  UsuarioModel iconmodelUsuario;
  FormPublicityWidget(this.iconmodelPublicidadUrl,this.iconmodelUsuario);

  @override
  State<FormPublicityWidget> createState() => _FormPublicityWidgetState();
}

class _FormPublicityWidgetState extends State<FormPublicityWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
       
        Text("${widget.iconmodelPublicidadUrl.nombreFormulario}",
        style:TextStyle(fontSize:29, color:Colors.white, fontWeight:FontWeight.bold)),

        SizedBox(height:MediaQuery.of(context).size.height*0.02),

        Container( 
                                  width: MediaQuery.of(context).size.width*0.85,
                                  height: MediaQuery.of(context).size.height*0.32,
                                  child:ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.network("${widget.iconmodelPublicidadUrl.imagenPublicidad}", fit: BoxFit.cover,),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color:  Colors.blue[200] ,
                                  ),
                                ),


       SizedBox(height:MediaQuery.of(context).size.height*0.03),
         Container(
           width: MediaQuery.of(context).size.width*0.9,
           child: Row(
             children: [
               Text("Contactanos:",
        style:TextStyle(fontSize:25, color:Colors.white, fontWeight:FontWeight.bold)),
             ],
           ),
         ),

         SizedBox(height:MediaQuery.of(context).size.height*0.015),
         Container(
           width: MediaQuery.of(context).size.width*0.9,
           child: Row(
             children: [
               Text("${widget.iconmodelPublicidadUrl.telefonoFormulario}:",
        style:TextStyle(fontSize:20, color:Colors.white, )),
             ],
           ),
         ),

         SizedBox(height:MediaQuery.of(context).size.height*0.015),
         Container(
           width: MediaQuery.of(context).size.width*0.9,
           child: Row(
             children: [
               Text("${widget.iconmodelPublicidadUrl.correoFormulario}:",
        style:TextStyle(fontSize:20, color:Colors.white, )),
             ],
           ),
         ),

         SizedBox(height:MediaQuery.of(context).size.height*0.02),
         Container(
           width: MediaQuery.of(context).size.width*0.9,
           child: Row(
             children: [
               Text("Descripción:",
        style:TextStyle(fontSize:25, color:Colors.white, fontWeight:FontWeight.bold)),
             ],
           ),
         ),

         SizedBox(height:MediaQuery.of(context).size.height*0.015),
         Container(
           width: MediaQuery.of(context).size.width*0.9,
           child: Row(
             children: [
               Flexible(
                 child: Text("${widget.iconmodelPublicidadUrl.comentarioFormulario[0].toUpperCase()}${widget.iconmodelPublicidadUrl.comentarioFormulario.substring(1)}",
                       style:TextStyle(fontSize:20, color:Colors.white, ), maxLines: 7,),
               ),
             ],
           ),
         ),

         SizedBox(height:MediaQuery.of(context).size.height*0.015),
        widget.iconmodelPublicidadUrl.urlPublicidad.isEmpty? Visibility(
          visible: false,
          child: Text("test1",
            style: TextStyle(fontSize: 10),
          ),
        )  : Container(
           width: MediaQuery.of(context).size.width*0.9,
           child: Column(
             children: [
               Row(children:[
                 Text("Visitanos en: ",
        style:TextStyle(fontSize:25, color:Colors.white, fontWeight:FontWeight.bold))
               ]),
               SizedBox(height:MediaQuery.of(context).size.height*0.015),
               Row(
                 children: [
                   Flexible(
                     child: Text("${widget.iconmodelPublicidadUrl.urlPublicidad}",
                           style:TextStyle(fontSize:20, color:Colors.white, ), maxLines: 6,),
                   ),
                 ],
               ),
             ],
           ),
         ),



      ],

      

    );
  }
}