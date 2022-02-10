import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/inicio/admin_publicidad.dart';
import 'package:z04_app_reservas_firebase/models/admin_publicidad_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';

class AdminUrl extends StatefulWidget {
  UsuarioModel iconmodelUsuario;
  AdminUrl(this.iconmodelUsuario);

  @override
  State<AdminUrl> createState() => _AdminUrlState();
}

class _AdminUrlState extends State<AdminUrl> {
    FToast fToast;
    File _imagen;
    String id_variable="";
    DateTime hoy= DateTime.now();
    final url_Publicidad= TextEditingController();


  String generateRandomString(int len) {
  var r = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  id_variable= List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  return id_variable;
}

  @override
  void initState() {
    // TODO: implement initState
     fToast = FToast();
    fToast.init(context);
    generateRandomString(10);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      resizeToAvoidBottomInset : false,
      body: Container(
        width:MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color:Colors.grey[800],
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            
            Container(
              width:MediaQuery.of(context).size.width*0.85,
             height: MediaQuery.of(context).size.height*0.62,
             color:Colors.white,
             padding:EdgeInsets.all(24),
             child: Column(
               children:[
                 Text("Crear publicidad", style:TextStyle(fontSize:28,fontWeight:FontWeight.bold)),

                    SizedBox(height:20),


                    GestureDetector(
                                      onTap:(){
                                        print("subiendo imagen${_imagen}");
                                         mostrarOpciones(context);
                                      },
                                      child: Container(
                                        width: MediaQuery.of(context).size.width*0.7,
                                        height:160,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                      subirImagen(),
                                          ],
                                        ),
                                         decoration: BoxDecoration(
                                          color: Colors.grey[400],
                                          borderRadius:BorderRadius.circular(10),
                                        ),
                                        
                                      ),
                                    ),






                         SizedBox(height:20),

                       Row(
                         children: [
                           Text("URL:", style:TextStyle(fontSize:18, fontWeight:FontWeight.bold)),
                         ],
                       ),
                    TextFormField(
                                
                                 
                                    
                                    controller:url_Publicidad,
                                          decoration: InputDecoration(
                                           
                                            labelText: "https://www.google.com/", 
                                            labelStyle: TextStyle(
                                  fontSize: 18,
                                ),
                                            ),
                                            onChanged:(value){
                                            },
                                              validator:(value){
                                              if(value.isEmpty){
                                                return "El campo esta vacio";
                                              }
                                            }
                                            ),







                     SizedBox(height:25),
                            
                      GestureDetector(
                        onTap:(){
                           // _agregar_cupon();
                           crearPublicidadUrl();
                        },
                        child: Container(
                          width:MediaQuery.of(context).size.width,
                          height:MediaQuery.of(context).size.height*0.07,
                      
                          decoration:BoxDecoration(
                            color:Colors.blue,
                            borderRadius:BorderRadius.circular(10),
                          ),
                          child:Center(child: Text("Confirmar", 
                          style:TextStyle(color:Colors.white, fontSize:18)
                          )),
                        ),
                      ),


                       SizedBox(height:10),
                            
                      GestureDetector(
                        onTap:(){
                          Navigator.pop(context, MaterialPageRoute(builder: (context)=>AdminPublicidad( widget.iconmodelUsuario))); 

                        },
                        child: Container(
                          width:MediaQuery.of(context).size.width,
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

      ),
    );
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
        return Icon(Icons.camera_alt, size:110, color:Colors.white);
      }else{
        
        return ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.file(_imagen, width:MediaQuery.of(context).size.width*0.7  ,  height:MediaQuery.of(context).size.width*0.45 , fit:BoxFit.cover));
      }
  }

  

      void crearPublicidadUrl() async{
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


    String url_publicidad_=url_Publicidad.text.trim();
    String nombre_formulario="URL nombre";
    String telefono_fomrulario="URL Tel: ";
    String correo_formulario="URL Correo";
    String comentario_formulario="URL Comentario ";
    String url_formulario="URL del url Formulario";
    String url_tienda="URL del url tienda";
    int tippPublicidad=0;
    String msnImagen="La imagen no puede estar vacia";
    String msnUrl="Verifique que el URL este bien escrito";
    bool validadURL= RegExp(r'^https?:\/\/[\w\-]+(\.[\w\-]+)+[/#?]?.*$').hasMatch(url_publicidad_);


    if(_imagen==null){
      showToast(msnImagen);
      return;
    }
    if(url_publicidad_.isEmpty || validadURL==false ){
      showToast(msnUrl);
      return;
    }



       final Reference storageReference = FirebaseStorage.instance.ref().child("PhotosPublicidad").child(id_variable);
    final UploadTask uploadTask = storageReference.putFile(_imagen);
    var dowurl = await (await uploadTask.whenComplete(() => null)).ref.getDownloadURL();
    String url = dowurl.toString();

    print(url);
    print(id_variable);
    print(url_publicidad_);
 
      // UsuarioModel adminmodel = await FetchData().getAdmin(user.uid);
      bool erroguardar=await QuerysService().SaveGeneralURL(reference: "publicidadAdmin", id:id_variable, collectionValues:AdminModel().toJsonBodyUrl(
          id_variable,
          widget.iconmodelUsuario.idUsuario,
          url,
          url_publicidad_,
          nombre_formulario,
          telefono_fomrulario,
          correo_formulario,
          comentario_formulario,
          url_formulario,
          url_tienda,
          tippPublicidad,
          hoy,






      ),);
     
   if(erroguardar){
      showToast(error);
      }else{
        
          fToast.showToast(
           toastDuration: Duration(seconds: 2),
           gravity: ToastGravity.CENTER,
        child: customizedLeadingIconWidget,
          );
           showToast(usuarioActualizado);
         int status=0;
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1( widget.iconmodelUsuario,status))); 
      }
    
  }

























  void showToast(mensaje) {
    Fluttertoast.showToast(
        msg: mensaje,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.teal[400],
        textColor: Colors.white,
        fontSize: 14.0,
    );
  }

  
   

      Widget customizedLeadingIconWidget = 
      
            Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        width: 400,
        height:230,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.teal[700],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle, // Set your own leading icon!
              color: Colors.white,
              size:140,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text("Felicidades se agrego la publicidad!!!", style:TextStyle(color: Colors.white)),
          ],
        ),
      );


  
}