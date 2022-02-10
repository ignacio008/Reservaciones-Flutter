import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';

class Notificationuser extends StatefulWidget {
   List nameUser;
  UsuarioModel iconmodel;
  Notificationuser(this.nameUser,this.iconmodel);

  @override
  State<Notificationuser> createState() => _NotificationuserState();
}

class _NotificationuserState extends State<Notificationuser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: IconThemeData(
    color: Colors.black, //change your color here
  ),
        
         backgroundColor: Colors.green,
        bottomOpacity: 0.0,
        elevation:0,
      ),
      body: Container(
        width:MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children:[
              Container(
                  width:MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.5,
        color:Colors.green,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
           
            Icon(Icons.check_circle,
            color: Colors.white,
            size: 204.0,
      ),
          Text("¡Felicidades!", style:TextStyle(color:Colors.white, fontSize: 24 )),
          SizedBox(height:20),
          Text("Su reservacion ha sido aprobada", style:TextStyle(color:Colors.white, fontSize: 20 )),

          ],
        ),
              ),
         SizedBox(height:60),
              Container(
                child: Column(
                  children: [
                    Text("Por: ${ widget.nameUser.isEmpty?"Vacio": widget.nameUser[2]}", style:TextStyle( fontSize: 18 )),
                     SizedBox(height:30),
                    GestureDetector(
                      onTap:(){
                        int status=0;
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(widget.iconmodel,status)));
                    
                      },
                      child: Container(
                        width:120,
                        height:50,
                        decoration:BoxDecoration(
                          color:Colors.black,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(child: Text("Inicio", style:TextStyle(color:Colors.white, fontSize: 20 ))),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}