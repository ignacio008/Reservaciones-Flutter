import 'dart:io';
import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:z04_app_reservas_firebase/firebase/authenticatio.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/update/update_general_shop.dart';
import 'package:z04_app_reservas_firebase/update/update_service.dart';

class WidgetUpdatePhoti extends StatefulWidget {
  TiendaModel iconmodelTienda;
  UsuarioModel iconmodelUsuario;
  WidgetUpdatePhoti(this.iconmodelTienda, this.iconmodelUsuario);

  @override
  _WidgetUpdatePhotiState createState() => _WidgetUpdatePhotiState();
}

class _WidgetUpdatePhotiState extends State<WidgetUpdatePhoti> {
  String src="https://www.google.com/url?sa=i&url=https%3A%2F%2Fbeeimg.com%2Fview%2Fv7389826330%2F&psig=AOvVaw3YYoSDy12Taya6ouchS6Ji&ust=1641335831621000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLDXl83SlvUCFQAAAAAdAAAAABAV";
File _imagen;
String id_variable="";
String generateRandomString(int len) {
  var r = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  id_variable= List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  return id_variable;
}
  @override
  void initState() {
    // TODO: implement initState
    src;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
          centerTitle:true,
        title:Text("Editar Imagen de su tienda", style:TextStyle(color:Colors.white)),
          backgroundColor: Colors.blue[800],
          bottomOpacity: 0.0,
          elevation: 0.0,
      ),
      body: Container(
          width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color:Colors.grey[700],
              child: Column(
                
                children:[
                  SizedBox(height:MediaQuery.of(context).size.height*0.1),

                    Container(
                       width: MediaQuery.of(context).size.width*0.9,
              height: MediaQuery.of(context).size.height*0.65,
              color:Colors.white,

                child:Column(
                 
                  children:[
 SizedBox(height:MediaQuery.of(context).size.height*0.022),
               Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Cambiar imagen", style:TextStyle(fontSize:28,fontWeight:FontWeight.bold)),
                          ],
                        ),
                        
 SizedBox(height:MediaQuery.of(context).size.height*0.022),
                  
                     GestureDetector(
                                      onTap:(){
                                        print("subiendo imagen${_imagen}");
                                         mostrarOpciones(context);
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width*0.8,
                                        height:260,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                      subirImagen(),
                                          ],
                                        ),
                                         decoration: BoxDecoration(
                                          color: Colors.grey[200],
                                          borderRadius:BorderRadius.circular(10),
                                           image: DecorationImage(
                                  image: NetworkImage(_imagen!=null?'https://firebasestorage.googleapis.com/v0/b/reservation-6e1b3.appspot.com/o/images.jpg?alt=media&token=fcf1a1c5-8b9a-4fd9-b21e-b3c8efd95e72':widget.iconmodelTienda.imagenTienda),
                                fit:BoxFit.cover,
                              ),
                                        ),
                                        
                                      ),
                                    ),
                        SizedBox(height: 50,),
                      GestureDetector(
                        onTap:(){
                          actualizarImagen(widget.iconmodelTienda.idShop);
                        },
                        child: Container(
                          width:MediaQuery.of(context).size.width*0.8,
                          height:MediaQuery.of(context).size.height*0.07,
                         
                          child:Center(child: Text("Guardar",style:TextStyle(color:Colors.white, fontSize:18))),
                          decoration:BoxDecoration(
                                                color:Colors.blue,
                                                borderRadius:BorderRadius.circular(10),
                                                  ),
                        ),
                      ),



                    SizedBox(height:10),
                            
                      GestureDetector(
                        onTap:(){
                           Navigator.pop(context, MaterialPageRoute(builder: (context)=>UpdateServiceGeneral(widget.iconmodelTienda,   widget.iconmodelUsuario))); 

                        },
                        child: Container(
                          width:MediaQuery.of(context).size.width*0.8,
                          height:MediaQuery.of(context).size.height*0.07,
                      
                          decoration:BoxDecoration(
                            color:Colors.blue[50],
                            borderRadius:BorderRadius.circular(10),
                          ),
                          child:Center(child: Text("Cancelar", 
                          style:TextStyle(color:Colors.blue[600], fontSize:18,)
                          )),
                        ),
                      ),




                  ],
                ),
                    ),


                ],
              ),
      ));
  }

  void mostrarOpciones(BuildContext context){
      showDialog(context: context, builder: (context) {
        return SimpleDialog(
          children: <Widget>[
            ListTile(
              title: Text("Camara"),
              leading: Icon(Icons.camera_alt),
              onTap: (){
                 Navigator.pop(context);
                  getImage(ImageSource.camera);
              },
            ),
            ListTile(
              title: Text("Gallery"),
              leading: Icon(Icons.image),
              onTap: (){
                Navigator.pop(context);
                  getImage(ImageSource.gallery);
              },
            ),

          ],
        );
      });
    }
     void getImage(ImageSource tipp_Imagen) async{
    
    var images = await ImagePicker.pickImage(source: tipp_Imagen);
      setState(() {
        _imagen=images;
      });
  }
   Widget subirImagen() {
     if(_imagen==null){
        return Icon(Icons.camera_alt, size:100, color:Colors.white);
      }else{
        return ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.file(_imagen, width:MediaQuery.of(context).size.width*0.8  ,  height:MediaQuery.of(context).size.width*0.658 , fit:BoxFit.cover));
      }
  }

   void actualizarImagen(String idshop) async{
     FocusScope.of(context).requestFocus(FocusNode());
  
    String msnToastEmail="Su correo no está escrito correctamente, por favor, verifíquelo";
    String mnsToastContrasena="Su contraseña debe ser minimo de 6 caracteres, por favor, verifíquela";  
    String msnToastNombre="Su nombre No puede estar vacio";
     String msnToastApellido="Su apellido No puede estar vacio";
    String msnError="El correo ya se ha registrado, cambie de correo ";
    String usuarioRegistardo="El usuario se ha registrado con exito!!";
    String msnToastTelefono="El telefono solo puede contener numeros y debe tener 10 dígitos.";
   
    String error="error";
    String usuarioActualizado="La foto ha sido actualizada con exito!!";

       final Reference storageReference = FirebaseStorage.instance.ref().child("Photos").child(id_variable);
    final UploadTask uploadTask = storageReference.putFile(_imagen);
    var dowurl = await (await uploadTask.whenComplete(() => null)).ref.getDownloadURL();
    String url = dowurl.toString();
 
      // UsuarioModel adminmodel = await FetchData().getAdmin(user.uid);
      bool erroguardar=await QuerysService().actualizarTienda(reference: "tienda", id:idshop, collectionValues:TiendaModel().toJsonBodyActualizaImagen(url),);
     
   if(erroguardar){
      showToasterror(error);
      }else{
           _cargando(context);
           showToast(usuarioActualizado);
         int status=0;
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(widget.iconmodelUsuario,status))); 
      }
    
  }
 void showToasterror(mensaje) {
    Fluttertoast.showToast(
        msg: mensaje,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.redAccent,
        textColor: Colors.white,
        fontSize: 14.0,
    );
  }
  void showToast(mensaje) {
    Fluttertoast.showToast(
        msg: mensaje,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.teal[700],
        textColor: Colors.white,
        fontSize: 14.0,
    );
  }

   void _cargando(BuildContext context){
       String cardEliminado="La Tienda ha sido eliminado con exito!!";
      showDialog(context: context, builder: (context) {
        return AlertDialog(
        
          title:Text("Cargando... ", style:TextStyle(color:Colors.white, fontSize:19)),
         content:Container(
           height:130,
          
           child: Column(
             children: [
           
              Text("Por favor espere a que termine de subir los datos", style:TextStyle(color:Colors.white)),
              SizedBox(height:20),
              CircularProgressIndicator(

                valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
              ),
             ],
           ),
         ),
            actions: <Widget>[
          
            
          ],
          backgroundColor: Colors.grey[800],
        );
      });
    }
}