import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/firebase/authenticatio.dart';
import 'package:z04_app_reservas_firebase/inicio/admin_publicidad.dart';
import 'package:z04_app_reservas_firebase/logins/loginss.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/all_my_reservation.dart';
import 'package:z04_app_reservas_firebase/partes/all_notification.dart';
import 'package:z04_app_reservas_firebase/partes/my_shop.dart';
import 'package:z04_app_reservas_firebase/partes/qr.dart';
import 'package:z04_app_reservas_firebase/update/update_user.dart';

class DrawerMenu extends StatefulWidget {
  UsuarioModel iconmodel;
  DrawerMenu(this.iconmodel);

  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
             
                UserAccountsDrawerHeader(
                accountName: Text("Bienvenido ${widget.iconmodel.name} ${widget.iconmodel.lastName}"),
                 accountEmail: Text("Tel: ${widget.iconmodel.numberPhone}"),
                 
                 currentAccountPicture:  Image.network("https://cdn-icons-png.flaticon.com/512/2907/2907150.png",height: 200,),
                otherAccountsPictures: <Widget>[
                
                ],
                
                // onDetailsPressed: (){
                //    Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateUser(widget.iconmodel)));
                
                // },
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors:[Colors.blue, Colors.black] ),
                  ),                 
                 
                 ),
                 


                ListTile(title: Text("Home"),
                leading: Icon(Icons.home, color:Colors.black),
                onTap:(){
                   Navigator.pop(context);
                },
                ),

                ListTile(title: Text("Mis Tiendas"),
                leading: Icon(Icons.shopping_bag_outlined, color:Colors.black),
                onTap:()=>mostratInicio(context),
                ),


                ListTile(title: Text("Mis Reservaciones"),
                leading: Icon(Icons.save_outlined, color:Colors.black),
                onTap:()=>ir_reservation(context),
                ),


                ListTile(title: Text("Notificaciones"),
                leading: Icon(Icons.notifications, color:Colors.amber[400]),
                onTap:()=>ir_notification(context),
                ),
                

                ListTile(title: Text("Edite su Usuario"),
                leading: Icon(Icons.settings, color:Colors.blueGrey[400]),
                onTap:()=> 
                ir_editarUsuario(context)
                 
                ),


                ListTile(title: Text("Codigo QR"),
                leading: Icon(Icons.qr_code_2_rounded, color:Colors.black),
                onTap:()=>ir_qr(context),
                ),


               widget.iconmodel.admin==1?  ListTile(title: Text("Administrador"),
                leading: Icon(Icons.verified_user_outlined, color:Colors.black),
                onTap:()=>ir_publicidad(context),
                ):Visibility(
          visible: false,
          child: Text("test1",
            style: TextStyle(fontSize: 10),
          ),
        ),

                

                ListTile(title: Text("Cerrar Sesion"),
                leading: Icon(Icons.power_settings_new, color:Colors.red),
                onTap:()=>mostrarDialogo(context),
                ),
            ], 
          ),
      ); 
  }

  mostratInicio(BuildContext context) {
     Navigator.pop(context);
     Navigator.push(context, MaterialPageRoute(builder: (context)=>MyShop(widget.iconmodel)));
  }

 
   void CerrarSesion() async{
    await Authentication().singOut().then((res) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
      });
  }



    void mostrarDialogo(BuildContext context) {

    showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
              title: Text("Cerrar Sesion"),
              content: Text("¿Estas Seguro que deseas cerrar sesion?"),
              actions: <Widget>[
                FlatButton(
                  child: Text("No", style: (TextStyle(color: Colors.blue))),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Si"),
                  onPressed: (){
                    CerrarSesion();
                  },
                ),

                
              ],
          );//alertdialogo
       },//finshowdialog
          barrierDismissible: false);
      
  }

  ir_reservation(BuildContext context) {
     Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AllMyReservation(widget.iconmodel)));
  }

  ir_notification(BuildContext context) {
    Navigator.pop(context);
     Navigator.push(context, MaterialPageRoute(builder: (context)=>AllNotification(widget.iconmodel)));
  }

  ir_qr(BuildContext context) {
    Navigator.pop(context);
     Navigator.push(context, MaterialPageRoute(builder: (context)=>QRObtener(widget.iconmodel)));
  }

   ir_publicidad(BuildContext context) {
    Navigator.pop(context);
     Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminPublicidad(widget.iconmodel)));
  }

  ir_editarUsuario(BuildContext context) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateUser(widget.iconmodel)));
  }
}