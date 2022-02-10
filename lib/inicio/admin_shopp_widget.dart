import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/inicio/admin_shopp_chose.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';

class AdminShoppWidget extends StatefulWidget {
  TiendaModel iconmodel;
  UsuarioModel iconmodelUsuario;
  AdminShoppWidget(this.iconmodel, this.iconmodelUsuario);

  @override
  State<AdminShoppWidget> createState() => _AdminShoppWidgetState();
}

class _AdminShoppWidgetState extends State<AdminShoppWidget> {
  @override
  Widget build(BuildContext context) {
    return 


    Container(
      width: MediaQuery.of(context).size.width*0.95,
        height: MediaQuery.of(context).size.height*0.26,
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap:(){
             Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminShoppChose(widget.iconmodel,widget.iconmodelUsuario)));
                              print("estoy presionando");
        },
        child: Container(
          width: MediaQuery.of(context).size.width*0.9,
          height: MediaQuery.of(context).size.height*0.25,
         decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color:Colors.grey[600],
              image: DecorationImage(
                                    image: NetworkImage(widget.iconmodel.imagenTienda),
                                  fit:BoxFit.cover,
                                ),
            ),
            alignment: Alignment.bottomLeft,
            child: Container(
              width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.09,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
              color: Colors.black.withOpacity(0.54),
            ),
          
          child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              
              Container(
                padding:EdgeInsets.all(6),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                      Text("${widget.iconmodel.nameShop[0].toUpperCase()}${widget.iconmodel.nameShop.substring(1)}",style:TextStyle(fontSize: 27, color:Colors.white, fontWeight:FontWeight.bold ),),
                       SizedBox(height: 3,),
                      Text("Creado por: ${widget.iconmodel.createBy}" ,style:TextStyle(fontSize: 10,color:Colors.white )),
                  ],
                ),
              ),
             
      
      
            ],
          ),
            ),
        ),
      ),
    );
  }
}