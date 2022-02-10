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
import 'package:z04_app_reservas_firebase/models/service_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/update/update_service.dart';

class UpdateServiceUpdate extends StatefulWidget {
  Service iconmodelService;
  TiendaModel iconmodelTienda;
  UsuarioModel iconmodelUsuario;
  UpdateServiceUpdate(this.iconmodelService, this.iconmodelTienda,this.iconmodelUsuario);

  @override
  State<UpdateServiceUpdate> createState() => _UpdateServiceUpdateState();
}

class _UpdateServiceUpdateState extends State<UpdateServiceUpdate> {

    FToast fToast;

  File _imagen;
  String durationService;
  final nombre_servicios= TextEditingController();
final descripcion_servicios= TextEditingController();
DateTime updatateDatetime=DateTime.now();



@override
  void initState() {
    // TODO: implement initState

    fToast = FToast();
    fToast.init(context);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:AppBar(
      //   centerTitle:true,
      //   title:Text("Editar servicio"),
      //   elevation:0.0,
      //   bottomOpacity: 0.0,
      //   backgroundColor: Colors.blue[700],

      // ),

      body: Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        color:Colors.grey[800],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[


              Container(
                  height:MediaQuery.of(context).size.height*0.7,
                    width:MediaQuery.of(context).size.width*0.9,
                    padding:EdgeInsets.all(20),
                decoration:BoxDecoration(
                    color:Colors.white,
                  borderRadius: BorderRadius.circular(2.0),
                ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Editar servicio", style:TextStyle(fontSize:28,fontWeight:FontWeight.bold)),
                          ],
                        ),

                    SizedBox(height:20),

                           GestureDetector(
              onTap:(){
                 print("subiendo imagen${_imagen}");
                mostrarOpcionesServices(context);
              },
                      child: Container(
                                      width: MediaQuery.of(context).size.width*0.9,
                                      height:180,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                    subirImagenService(),
                                        ],
                                      ),
                                        decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius:BorderRadius.circular(10),
                                         image: DecorationImage(
                                  image: NetworkImage(_imagen!=null?'https://firebasestorage.googleapis.com/v0/b/reservation-6e1b3.appspot.com/o/images.jpg?alt=media&token=fcf1a1c5-8b9a-4fd9-b21e-b3c8efd95e72':widget.iconmodelService.imageService),
                                fit:BoxFit.cover,
                              ),
                                      ),
                                    ),
                              ),
                        SizedBox(height:15),
                          Text("Nombre de su servicio:" , style:TextStyle(fontWeight: FontWeight.bold )),
                        TextFormField(
                             controller:nombre_servicios,
                                          decoration: InputDecoration(
                                            prefixIcon: Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Icon(
                                            Icons.perm_contact_cal,
                                            color: Colors.grey,
                                          ), // icon is 48px widget.
                                        ),
                                            labelText: "${widget.iconmodelService.nameService}"),
                                            onChanged:(value){
                                            },        
                                            ),
                                          SizedBox(height:20),
                          Text("Descripcion de su servicio:" , style:TextStyle(fontWeight: FontWeight.bold ),
                           maxLines: 2),
                           TextFormField(
                             controller:descripcion_servicios,
                                          decoration: InputDecoration(
                                            prefixIcon: Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Icon(
                                            Icons.perm_contact_cal,
                                            color: Colors.grey,
                                          ), // icon is 48px widget.
                                        ),
                                            labelText: "${widget.iconmodelService.descriptionService}"),
                                            onChanged:(value){
                                            },        
                                            ),
              
              
                                                SizedBox(height:20),
                                               Text("Tiempo que dura el servicio:" , style:TextStyle(fontWeight: FontWeight.bold )),
                                            DropdownButton<String>(
                                              value: durationService,
                                              style: TextStyle(color: Colors.black, fontSize:16),
                                             
                                               
                                              items: <String>[
                                                '15',
                                                '30',
                                                '45',
                                                '60',
                                               
                                              ].map((String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text("${value} minutos"),
                                                );
                                              }).toList(),
                                              hint: Text(
                                                "${widget.iconmodelService.durationService} minutos",
                                                style: TextStyle(
                                                    color: Colors.grey[800],
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w600),
                                              ),
                                              onChanged: (String value) {
                                                setState(() {
                                                    durationService = value;       
                                                });
                                              },
                                           ),

                                           SizedBox(height:30),
                                           Center(
                                             child: GestureDetector(
                                               onTap:(){
                                                    updateService(widget.iconmodelService.idService);
                                               },
                                               child: Container(
                                                 child:Center(child: Text("Confirmar", 
                                              style:TextStyle(color:Colors.white, fontSize:18)
                                              )),
                                               width:MediaQuery.of(context).size.width,
                                              height:MediaQuery.of(context).size.height*0.07,
                                              decoration:BoxDecoration(
                                                color:Colors.blue,
                                                borderRadius:BorderRadius.circular(10),
                                                  ),
                                               ),
                                             ),
                                           ),



                                            SizedBox(height:10),
                            
                      GestureDetector(
                        onTap:(){
                           Navigator.pop(context, MaterialPageRoute(builder: (context)=>UpdateServiceGeneral(widget.iconmodelTienda,   widget.iconmodelUsuario))); 

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
                            ),


          ],
        ),
      ),
    );
  }




      void mostrarOpcionesServices(BuildContext context){
      showDialog(context: context, builder: (context) {
        return SimpleDialog(
          children: <Widget>[
            ListTile(
              title: Text("Camara"),
              leading: Icon(Icons.camera_alt),
              onTap: (){
                 Navigator.pop(context);
                  getImageService(ImageSource.camera);
              },
            ),
            ListTile(
              title: Text("Gallery"),
              leading: Icon(Icons.image),
              onTap: (){
                Navigator.pop(context);
                  getImageService(ImageSource.gallery);
              },
            ),
          ],
        );
      });
    }

     void getImageService(ImageSource tipp_Imagen) async{   
    var imagesService = await ImagePicker.pickImage(source: tipp_Imagen);
      setState(() {
        _imagen=imagesService;
        showToast(exitiImagen);
      });
  }
    String exitiImagen="Imagen selecionada Exitosamente!!!";
   Widget subirImagenService() {
     if(_imagen==null){
        return Icon(Icons.camera_alt, size:100, color:Colors.white);
      }else{
        
        return ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.file(_imagen, width:MediaQuery.of(context).size.width*0.798  ,  height:MediaQuery.of(context).size.width*0.45 , fit:BoxFit.cover));
      }
  }






  void updateService(String idService) async{
      String nombre_service =nombre_servicios.text.trim();
   String descripcion_service= descripcion_servicios.text.trim();
   
   String mendajeNombreServicio="El nombre del servicio No puede estar vacio";
   String mendajeNombreLongitudServicio="El nombre del servicio no puede tener mas de 28 Caracteres";
   String mendajDescripcionServicio="Por favor ponga una breve descripcion";
   String mendajTiempoServicio="Por favor escoja el tiempo que dura su servicio";
   String mendajImagen="Por favor seleciona una imagen";
  String error="Error";
  String ServicoCreado="Felicidades su servicio fue agregado con exito!!!";
  int duration_servi;
  String url;
  if(durationService==null){
  widget.iconmodelService.durationService;
  
  }else{
duration_servi= int.parse(durationService);
  }
   
   
      
     
          String idServiceVaribels;
     User user = await Authentication().getCurrentUser();
    UsuarioModel adminmodel = await FetchData().getAdmin(user.uid);

    if(_imagen!=null){

    
    final Reference storageReference = FirebaseStorage.instance.ref().child("Photos").child(idServiceVaribels);
    final UploadTask uploadTask = storageReference.putFile(_imagen);
    var dowurl = await (await uploadTask.whenComplete(() => null)).ref.getDownloadURL();
    url = dowurl.toString();
    }

    bool erroguardar=await QuerysService().actualizarServicios(reference: "servicios", id:widget.iconmodelService.idService, collectionValues:Service().toJsonBodyUpdateService(

      
      nombre_service.isEmpty?widget.iconmodelService.nameService:nombre_service,
      descripcion_service.isEmpty?widget.iconmodelService.descriptionService:descripcion_service ,
      durationService==null?widget.iconmodelService.durationService:duration_servi,
      updatateDatetime,
      url==null?widget.iconmodelService.imageService:url,
      
      
      ),);
      
      if(erroguardar){
      showToastError(error);
      }else{
          _cargando(context);
      int status=0;
       fToast.showToast(
           toastDuration: Duration(seconds: 2),
           gravity: ToastGravity.CENTER,
        child: customizedLeadingIconWidget,
          );
          
          showToast(ServicoCreado);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(adminmodel,status)));
      }

  }
  void showToastError(mensaje) {
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
            Text("Felicidades se agrego su nuevo servicio!!!", style:TextStyle(color: Colors.white)),
          ],
        ),
      );

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