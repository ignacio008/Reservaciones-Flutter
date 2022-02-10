import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/my_shop.dart';

class ContaienrMyShopp extends StatefulWidget {
  UsuarioModel iconmodel;
  ContaienrMyShopp(this.iconmodel);

  @override
  _ContaienrMyShoppState createState() => _ContaienrMyShoppState();
}

class _ContaienrMyShoppState extends State<ContaienrMyShopp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyShop(widget.iconmodel)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,
        height: MediaQuery.of(context).size.height*0.25,
       decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                                 image: new ExactAssetImage("assets/mitienda.jpg"),
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
          children: [
            SizedBox(width: 15,),
              Text("Mis Tiendas",style:TextStyle(fontSize: 30, color:Colors.white, fontWeight:FontWeight.bold ),),
          ],
        ),
          ),
      ),
    );
  }
}