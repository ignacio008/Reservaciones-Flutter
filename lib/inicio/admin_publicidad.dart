import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/inicio/admin_formulario.dart';
import 'package:z04_app_reservas_firebase/inicio/admin_shopp.dart';
import 'package:z04_app_reservas_firebase/inicio/admin_url.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';

class AdminPublicidad extends StatefulWidget {
  UsuarioModel iconmodelUsuario;
  AdminPublicidad(this.iconmodelUsuario);

  @override
  State<AdminPublicidad> createState() => _AdminPublicidadState();
}

class _AdminPublicidadState extends State<AdminPublicidad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Crear publicidad"),
        elevation: 0.0,
        bottomOpacity: 0.0,
        backgroundColor: Colors.blue[700],
      ),
      body:Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        color:Colors.blue[50],
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[

           GestureDetector(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminUrl( widget.iconmodelUsuario))); 
                    
              },
              child: Container(
                 width:MediaQuery.of(context).size.width*0.43,
                 height:MediaQuery.of(context).size.height*0.18,
                       decoration:BoxDecoration(
                       borderRadius: BorderRadius.circular(18),
                       color:Colors.white,
                       image: DecorationImage(
                                      image: AssetImage("assets/url.png"),
                                    fit:BoxFit.cover,
                                  ),
                    ),             
                ),
            ),




               SizedBox(height:5), 
              FractionallySizedBox(
                 widthFactor: 0.7, 
                child: FlatButton(
                    
                  onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminUrl( widget.iconmodelUsuario))); 
                         },
                         padding: EdgeInsets.only(left:40,top:18, right:40, bottom:18),
                          child: Text("Crear por URL"),
                          
                          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color:Colors.blue, width:2.0),
                          ),
                          ),
              ),
                SizedBox(height:20), 


               GestureDetector(
                 onTap:(){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminFormulario( widget.iconmodelUsuario))); 
                 },
                 child: Container(
                  width:MediaQuery.of(context).size.width*0.43,
                 height:MediaQuery.of(context).size.height*0.18,
                          decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color:Colors.blue [100],
                          image: DecorationImage(
                                      image: AssetImage("assets/cupon2.jpg"),
                                    fit:BoxFit.cover,
                                  ),
                       ),             
                             ),
               ),
               SizedBox(height:5), 
              FractionallySizedBox(
                widthFactor: 0.7, 
                child: FlatButton(
                    
                  onPressed: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminFormulario( widget.iconmodelUsuario))); 
                         },
                         padding: EdgeInsets.only(left:40,top:18, right:40, bottom:18),
                          child: Text("Crear formulario"),
                          
                          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color:Colors.blue, width:2.0),
                          ),
                          ),
              ),



   SizedBox(height:20), 

            GestureDetector(
                 onTap:(){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminShopp( widget.iconmodelUsuario))); 
                 },
                 child: Container(
                 width:MediaQuery.of(context).size.width*0.43,
                 height:MediaQuery.of(context).size.height*0.18,
                          decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          color:Colors.blue [100],
                          image: DecorationImage(
                                      image: AssetImage("assets/tienda.jpg"),
                                    fit:BoxFit.cover,
                                  ),
                       ),             
                             ),
               ),
               SizedBox(height:5), 
              FractionallySizedBox(
                widthFactor: 0.7, 
                child: FlatButton(
                    
                  onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminShopp( widget.iconmodelUsuario))); 
                         },
                         padding: EdgeInsets.only(left:40,top:18, right:40, bottom:18),
                          child: Text("Enviar a tienda"),
                          
                          shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color:Colors.blue, width:2.0),
                          ),
                          ),
              ),



          ],
        ),
      ),
    );
  }
}