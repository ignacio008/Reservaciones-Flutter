import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';

class QRObtener extends StatefulWidget {
  UsuarioModel iconmodelUsuario;
  QRObtener(this.iconmodelUsuario);

  @override
  State<QRObtener> createState() => _QRObtenerState();
}

class _QRObtenerState extends State<QRObtener> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Mi codigo QR"),
        elevation:0.0,
        bottomOpacity:0.0,
        backgroundColor: Colors.blue[700],
      ),
      body:Container(
        width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              QrImage(data: widget.iconmodelUsuario.idUsuario, size:300),
            ],
          ),
        ),
      ),
    );
  }
}