import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/result_scanner.dart';

class QrScanner extends StatefulWidget {
  TiendaModel iconmodelShop;
  UsuarioModel iconmodelUsuario;
  QrScanner(this.iconmodelShop,this.iconmodelUsuario);

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  String idUserQr;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Scanear codigo QR"),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.blue[700],
      ),
      body:Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
         
          
            Icon(Icons.qr_code_scanner, size:200),
            SizedBox(height:30),
           
           FlatButton(onPressed: (){
                _scanner();
           },
           padding: EdgeInsets.only(left:80,top:17, right:80, bottom:17),
            child: Text("Scanear codigo QR"),
            
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color:Colors.blue, width:2.0),
            ),
            ),

          SizedBox(height:40),
          ],
        ),
      ),

    );
  }

  void _scanner() async{
   String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.BARCODE);
    idUserQr=barcodeScanRes;
   
    if(idUserQr.length>=10){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ResultScanner(idUserQr, widget.iconmodelShop, widget.iconmodelUsuario))); 
     
    }
    else{
      print("Lo sentimos no has selecionado un codigo QR valido");
    }
  }
}