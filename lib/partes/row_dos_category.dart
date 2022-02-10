import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/category.dart';

class RowDosCategory extends StatefulWidget {
  UsuarioModel iconmodel;
  RowDosCategory(this.iconmodel);

  @override
  _RowDosCategoryState createState() => _RowDosCategoryState();
}

class _RowDosCategoryState extends State<RowDosCategory> {
  String belleza='Belleza';
  String limpieza='Limpieza';
  String restaurante='Restaurante';
  
  String imagenBelleza='assets/este.jpg'; 
  String imagenLimpieza='assets/car.jpg';
  String imagenRestaurante='assets/rest.jpg';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
          Column(
            children: [
              GestureDetector(
                onTap:(){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Category(belleza,widget.iconmodel,imagenBelleza)));
                },
                child: Container( 
                          width: 95,
                          height: 63,
                          child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset("assets/este.jpg"),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                             color:  Colors.blue[200] ,
                          ),
                ),
              ),
                      Text("Belleza"),
            ],
          ),
          SizedBox(width:20,),
              Column(
            children: [
              GestureDetector(
                onTap:(){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Category(limpieza,widget.iconmodel,imagenLimpieza)));
                },
                child: 
                
                Container( 
                          width: 95,
                          height: 63,
                          child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset("assets/car.jpg"),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                             color:  Colors.blue[200] ,
                          ),
                ),
              ),
                      Text("Limpieza"),
            ],
          ),

             SizedBox(width:20,),
              Column(
            children: [
              GestureDetector(
                onTap:(){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>Category(restaurante, widget.iconmodel,imagenRestaurante)));
                },
                child: Container( 
                          width: 95,
                          height: 63,
                          child:ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset("assets/rest.jpg"),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                             color:  Colors.blue[200] ,
                          ),
                ),
              ),
                      Text("Restaurante"),
            ],
          ),
        ],
        ),

      ],
    );
  }
}