import 'dart:io';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:z04_app_reservas_firebase/firebase/authenticatio.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/models/service_model.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';


class RegisterShopp extends StatefulWidget {
  UsuarioModel iconmodel;
  RegisterShopp(this.iconmodel);
  @override
  _RegisterShoppState createState() => _RegisterShoppState();
}

class _RegisterShoppState extends State<RegisterShopp> {

    FToast fToast;
    String _myToken;
GoogleMapController _mapcontroller;
int _currentSep=0;
bool _loading=true;
String id_variable="";
String url;
String _category;
final nombre_tienda= TextEditingController();
final descripcion_tienda= TextEditingController();
 final phone= TextEditingController();
final europeanCountries = ['Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo'];
int index1;
ScrollController controller;

LatLng _center ;
LatLng _Actual_center;
Position currentLocation;
double latitude;
double longitude;
double actuallatitude;
double actuallongitude;
DateTime fechaActual=DateTime.now();

List  principales=[TimeOfDay(hour: 0, minute: 00,),
TimeOfDay(hour: 0, minute: 00,),
TimeOfDay(hour: 0, minute: 00,),
TimeOfDay(hour: 0, minute: 00,),
TimeOfDay(hour: 0, minute: 00,),
TimeOfDay(hour: 0, minute: 00,),
TimeOfDay(hour: 0, minute: 00,),
];

List listaseEntrada = [
  DateTime(2019,1,1,  0,0),
  DateTime(2019,1,1,  0,0),
  DateTime(2019,1,1,  0,0),
  DateTime(2019,1,1,  0,0),
  DateTime(2019,1,1,  0,0),
  DateTime(2019,1,1,  0,0),
  DateTime(2019,1,1,  0,0),
];
List listaseSalida = [
  DateTime(2019,1,1,  0,0),
  DateTime(2019,1,1,  0,0),
  DateTime(2019,1,1,  0,0),
  DateTime(2019,1,1,  0,0),
  DateTime(2019,1,1,  0,0),
  DateTime(2019,1,1,  0,0),
  DateTime(2019,1,1,  0,0),
];

  Set<String> guardarLetras = Set<String>();

   
   TimeOfDay _selectDayUno;
    TimeOfDay _selectedDate; 


    TimeOfDay _selectedDateSalida;
    TimeOfDay _selectDayUnoSalida;


    DateTime _textoPruebaMio;
    DateTime _selectDayUno1=DateTime(2019,1,1,  0,0);

    
    DateTime _textoPruebaMioSalida;
    DateTime _selectDayUno1Salida=DateTime(2020,1,1,  0,0);
  

    String hora_sar = "Hora de entrada";
    String hora_salida="Hora de Salida";
   TextEditingController _textEditingController = TextEditingController();
   String aceptar="Aceptar";
   String quitar="Quitar de la lista";


   ScrollController controllerScroll;
   int indexMio=0;
final nombre_servicios= TextEditingController();
final descripcion_servicios= TextEditingController();
String durationService;
List listaserviciosNombre=[];
List listServiceDescription=[];
List listServiceDuration=[];
List listImagen=[];
File imagenService;

   Future<Position> locateUser() async {
    return Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
    getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
      latitude=currentLocation.latitude;
      longitude=currentLocation.longitude;
    });
    print('center $_center');   
  }
String generateRandomString(int len) {
  var r = Random();
  const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  id_variable= List.generate(len, (index) => _chars[r.nextInt(_chars.length)]).join();
  return id_variable;
}

String idServiceVaribels="";
 @override
  void initState() {
    getUserLocation();
    generateRandomString(15);
     controllerScroll=ScrollController();
       fToast = FToast();
    fToast.init(context);
     
    setState(() {
      _center;
    
    });
    controller= ScrollController();
    
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       resizeToAvoidBottomInset : false,
        appBar: new AppBar(
          title:Text("Crea tu Tienda"),
          bottomOpacity: 0.0,
          elevation: 0.0,
          backgroundColor: Colors.blue[700],
        ),
        body: Container(
          child:Stepper(
            //Nos indica cual es el paso del Steeper
            currentStep: this._currentSep,
            steps: listaDePasos1(),
            onStepContinue: (){
              setState(() {
                if(_currentSep < listaDePasos1().length -1){
                _currentSep=_currentSep+1;      
                }else{
                  _currentSep=0;
                  
                }
              });
              if(_currentSep==0){
            RegistrarTienda();
              }
               print("Mi paso es continue: ${_currentSep}");
            },
            onStepCancel: (){
              setState(() {
                if(_currentSep>0){
                  _currentSep = _currentSep -1;
                }else{
                  _currentSep=0;
                }
              });
               print("Mi paso es: ${_currentSep}");
            },
            //si preciono el touch me dirige a ese paso
            onStepTapped:(step){  
              setState(() {
                _currentSep=step;
              });     
              print("Mi paso es: ${_currentSep}");
            }
          ),
        ),
    );
    
  }

   List<Step>listaDePasos1()=>[
    new Step(
        isActive:_currentSep>=0,
        title: Text("Paso 1 "),
        content: Column(
          children: [
            Text("Por favor sube la imagen de tu tienda", style:TextStyle(fontSize:15, fontWeight: FontWeight.bold )),
            SizedBox(height:14),
            GestureDetector(
              onTap:(){
                 print("subiendo imagen${_imagen}");
                mostrarOpciones(context);
              },
                    child: Container(
                                    width: MediaQuery.of(context).size.width*0.9,
                                    height:160,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                  subirImagen(),
                                      ],
                                    ),
                                      decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius:BorderRadius.circular(10),
                                    ),
                                  ),
                            ),
                          ],
                        ),
                    ),
     new Step(
       isActive:_currentSep>=1,
        title: Text("Paso 2"),
        content: Column(
          children: [
            Text("Datos de la Tienda", style:TextStyle(fontSize:15, fontWeight: FontWeight.bold)),
            SizedBox(height:10),
            Container(
              padding:EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.95,
                child:datosTienda(),
                 decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius:BorderRadius.circular(10),
                ),
            ),
          ],
        ),
    ),
     new Step(
       isActive:_currentSep>=2,
        title: Text("Paso 3"),
        content: GestureDetector(
          
          child: servicios()
          ),
    ),
    new Step(
       isActive:_currentSep>=3,
        title: Text("Paso 4"),
        content: RegisterMapaUno()==null?CircularProgressIndicator():RegisterMapaUno(),
    ),   
  ];
File _imagen;
   Widget subirImagen() {
     if(_imagen==null){
        return Icon(Icons.camera_alt, size:100);
      }else{
        return ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.file(_imagen, width:MediaQuery.of(context).size.width*0.77  ,  height:MediaQuery.of(context).size.width*0.45 , fit:BoxFit.cover));
      }
  }
   void getImage(ImageSource tipp_Imagen) async{   
    var images = await ImagePicker.pickImage(source: tipp_Imagen);
      setState(() {
        _imagen=images;
      });
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


   Widget datosTienda() {
     return Column(
       // ignore: prefer_const_literals_to_create_immutables
       children:[
          TextFormField(
                         controller:nombre_tienda,
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.perm_contact_cal,
                                        color: Colors.grey,
                                      ), // icon is 48px widget.
                                    ),
                                        labelText: "Nombre de la tienda:"),
                                        onChanged:(value){
                                        },
                                          validator:(value){
                                          if(value.isEmpty){
                                            return "El campo esta vacio";
                                          }
                                        }
                                        ),
                                       SizedBox(height: 10,),
                                TextFormField(
                                controller:descripcion_tienda,
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.security,
                                        color: Colors.grey,
                                      ), // icon is 48px widget.
                                    ),
                                        labelText: "Descripcion"),
                                        onChanged:(value){
                                        },
                                          validator:(value){
                                          if(value.isEmpty){
                                            return "El campo esta vacio";
                                          }
                                        }
                                        ),
                                         SizedBox(height:10),
                                TextFormField(
                                   maxLength: 10,
                                  keyboardType: TextInputType.number,
                         controller:phone,
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.contact_phone,
                                        color: Colors.grey,
                                      ), // icon is 48px widget.
                                    ),
                                        labelText: "Telefono de la tienda"),
                                        onChanged:(value){
                                        },
                                          validator:(value){
                                          if(value.isEmpty){
                                            return "El campo esta vacio";
                                          }
                                        }
                                        ),

                                            SizedBox(height: 10,),
                                  Container(



                          child: Row(
                            
                            children: [
                              Text("Categoria: ", style: TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(width: 20,),
                              DropdownButton<String>(
                                          value: _category,
                                          style: TextStyle(color: Colors.black, fontSize:16),
                                         
                                           
                                          items: <String>[
                                            'Belleza',
                                            'Limpieza',
                                            'Restaurante',
                                           
                                          ].map((String value) {
                                            return DropdownMenuItem<String>(
                                            
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                          hint: Text(
                                            "Belleza",
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                                fontSize: 15,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          onChanged: (String value) {
                                            setState(() {
                                                _category = value;
                                            
                                            });
                                          },
                                        ),
                            ],
                          ),
                                  ),







                    SizedBox(height: 25,),
                    Text("Por favor seleccione los dias y horas que laboran", style: TextStyle(fontWeight: FontWeight.bold), ),
                      SizedBox(height: 15,),
                        Container(
                          width:270,
                          height: 393,
                          color:Colors.white,
                          child: 
                         
                              Scrollbar(
                                isAlwaysShown: true,
                                controller:controller,
                                child: ListView.builder(
                                  controller: controller,
                                  scrollDirection: Axis.vertical,
                                  itemCount: europeanCountries.length,
                                  itemBuilder: (BuildContext context, int index1) {
                                  String letra=europeanCountries[index1];
                                TimeOfDay selectday= principales[index1];
                                 TimeOfDay selectdaySalida= principales[index1];
                                  final bool guardarCorazon=guardarLetras.contains(letra);
                                return ListTile(
                                  title: Text(europeanCountries[index1]),
                                  trailing: Icon(
                          guardarCorazon ? Icons.check_box_outlined : Icons.check_box_outline_blank,
                          color: guardarCorazon? Colors.green: null,
                        ),
                        onTap:(){
                          
 print(principales);


                           



    showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
              title: Text("Horario"),
              content: Container(
                height: 150,
                color:Colors.white,
                child: Column(
                  children: [
                       TextFormField(
                                  onTap:(){
                                   FocusScope.of(context).requestFocus(new FocusNode());
                                _selectDate(context,selectday);
                                  },
                        controller: _textEditingController,
                              keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.calendar_today_outlined,
                                        color: Colors.grey,
                                      ), // icon is 48px widget.
                                    ),
                                        labelText: "${_selectedDate==null?hora_sar:_selectedDate}"),
                                        onChanged:(value){
                                        },
                                          validator:(value){
                                          if(value.isEmpty){
                                            return "El campo esta vacio";
                                          }
                                        }
                                        ),


              SizedBox(height:20),
                    TextFormField(
                                  onTap:(){
                                   FocusScope.of(context).requestFocus(new FocusNode());
                                _selectDateSalida(context,selectdaySalida);
                                  },
                        controller: _textEditingController,
                              keyboardType: TextInputType.datetime,
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.calendar_today_outlined,
                                        color: Colors.grey,
                                      ), // icon is 48px widget.
                                    ),
                                        labelText: "${_selectedDateSalida==null?hora_salida:_selectedDateSalida} "),
                                        onChanged:(value){
                                        },
                                          validator:(value){
                                          if(value.isEmpty){
                                            return "El campo esta vacio";
                                          }
                                        }
                                        ),
                   
                  ],
                )),
              actions: <Widget>[

                FlatButton(
                  child: Text("Cancelar", style: (TextStyle(color: Colors.blue))),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("${guardarCorazon==true?quitar:aceptar}"),
                  onPressed: (){
                   // CerrarSesion();
                   
                  
                  setState(() {

                            
                            if(guardarCorazon){
                            guardarLetras.remove(letra);
                            
                     principales.removeAt(index1);
                     principales.insert(index1,_selectDayUno);
                     
                     listaseEntrada.removeAt(index1);
                     listaseEntrada.insert(index1,_selectDayUno1);

                     listaseSalida.removeAt(index1);
                     listaseSalida.insert(index1,_selectDayUno1Salida);

                    print(principales);
                    print(listaseEntrada);
                    print(listaseSalida);
                          Navigator.pop(context);
                            }else{
                              if(_textoPruebaMio==null){
                                String horaEntrada="Por favor seleccione el horario de entrada";
                                showToast(horaEntrada);
                                return;
                              }
                              if(_textoPruebaMioSalida==null){
                                String horaSalida="Por favor seleccione el horario de salida";
                                showToast(horaSalida);
                                return;
                              }
                            guardarLetras.add(letra);
                            
                           
                            principales.removeAt(index1);
                            principales.insert(index1,_selectedDate);
                           
                            listaseEntrada.removeAt(index1);
                            listaseEntrada.insert(index1,_textoPruebaMio);

                            listaseSalida.removeAt(index1);
                            listaseSalida.insert(index1,_textoPruebaMioSalida);
                      
                        print(principales);
                        print(listaseEntrada);
                        print(listaseSalida);
                          Navigator.pop(context);
                            }
                            

                          });
                  },
                ),

                
              ],
          );//alertdialogo
       },//finshowdialog
          barrierDismissible: false);
      
  







                          
                        },
                                );
                              },
                            ),
                        ),                           
                    ),      
       ],
     );
   }

//AQUIE VOY A MANDAR A MI METODO
  void mirarStep() {
    print("termiar step");
    int status=0;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(widget.iconmodel,status)));
  }
  Widget RegisterMapaUno() {
    return Container(
      color:Colors.red,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.39,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target:  _center==null?LatLng(20.977231481065726, -89.66040822350081):_center,
          zoom: 11,
        ),    
        onMapCreated: OnmapCreato,
        onTap:ontaop,
         markers: Set<Marker>.of(
          <Marker>[
            Marker(
              draggable: true,
              markerId: MarkerId("1"),
              position: _center==null?LatLng(20.977231481065726, -89.66040822350081):_center,
              icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
              onDragEnd: (newPosition){
                _Actual_center=newPosition;
                print("este es el metodododod ${newPosition}");
                print("actual position ${_Actual_center}");
                ubicacionActual(_Actual_center);
              },
              infoWindow: const InfoWindow(
                title: 'Usted está aquí',
              ),
            )
          ],
        ),
      ),
    );  
  }
   void OnmapCreato(GoogleMapController controller) {
   _mapcontroller = controller; 
 }
 void ontaop(LatLng position){
 }
  void ubicacionActual(LatLng actual_center) {
    print("ubicaicon : ${actual_center}");
    print("actual ${actual_center.latitude}");
    actuallatitude=actual_center.latitude;
    actuallongitude=actual_center.longitude;
    print("mi nueva latitud es: ${actuallatitude}");  
    print("mi nueva longitud es: ${actuallongitude}");
  }

  void RegistrarTienda()  async{
  String tiendaCreada="Felicidades su tienda a sido creada con exito!!";
  String error="error";
  String name_shoper =nombre_tienda.text.trim();
  String description= descripcion_tienda.text.trim();
  String msnToastNombre="Paso 2: El nombre de la tienda No puede estar vacio";
  String msnToastDesciption ="Paso 2: Por favor ponga una breve descripcion";
  String msnToastImagen ="Paso 1: Por favor Suba una foto de su tienda";
  String msnCategory ="Paso 2: Por favor escoja una categoria";
  String phone_ = phone.text.trim();
  bool emailValid = RegExp(r'^\d{10}$').hasMatch(phone_);
  String msnToastTelefono="Paso 2: El telefono solo puede contener numeros y debe tener 10 dígitos.";
  String msnToastSemanasHorario="Paso 2: Por favor seleccione por lo menos 1 dia de la semana que laboran";
  String msnToasLongitudDescription="Paso 2: La descripcion de la Tienda no puede tener mas de 224 caracteres";
  String msnToastLongitudNombreTienda="Paso 2: El nombre de la Tienda no puede tener mas de 15 Caracteres";
  String msnToastServicios="Paso 3: Por favor agregue por lo menos 1 servicio";




    if(name_shoper==""){
       showToast(msnToastNombre);
      return;
    }
    if(name_shoper.length>17){
       showToast(msnToastLongitudNombreTienda);
      return;
    }

     if(description==""){
       showToast(msnToastDesciption);
      return;
    }
    if(description.length>224){
      showToast(msnToasLongitudDescription);
      return;
    }

    if(_imagen==null){
      showToast(msnToastImagen);
      return;
    }
    if(_category==null){
      showToast(msnCategory);
      return;
    }
    if(phone != null && emailValid==false){
      showToast(msnToastTelefono);
      return;
    }
    if(guardarLetras.isEmpty){
      showToast(msnToastSemanasHorario);
      return;
    }
    if(description.isNotEmpty && listaserviciosNombre.isNotEmpty){
 _cargando(context);
    }
    if(listaserviciosNombre.isEmpty){
      showToast(msnToastServicios);
      return;
    }else{
      for (var i = 0; i < listaserviciosNombre.length; i++) {
        
             
          String incremento=i.toString();
          String idServiceVaribels=id_variable+incremento;
          final Reference storageReference = FirebaseStorage.instance.ref().child("PhotosTiendaServicios").child(idServiceVaribels);
    final UploadTask uploadTask = storageReference.putFile(listImagen[i]);
    var dowurl = await (await uploadTask.whenComplete(() => null)).ref.getDownloadURL();
    String urlService = dowurl.toString();

     bool erroService=await QuerysService().SaveGeneralInfoServicios(reference: "servicios", id:idServiceVaribels, collectionValues:Service().toJsonBody(idServiceVaribels, id_variable,listaserviciosNombre[i],listServiceDescription[i],listServiceDuration[i],fechaActual,urlService,widget.iconmodel.idUsuario),);
             
             
      }
    }

     

     

    User user = await Authentication().getCurrentUser();
    UsuarioModel adminmodel = await FetchData().getAdmin(user.uid);
    final Reference storageReference = FirebaseStorage.instance.ref().child("PhotosTiendas").child(id_variable);
    final UploadTask uploadTask = storageReference.putFile(_imagen);
    var dowurl = await (await uploadTask.whenComplete(() => null)).ref.getDownloadURL();
    String url = dowurl.toString();
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
 _firebaseMessaging.requestPermission();
      _firebaseMessaging.getToken().then((miToken) {
        print("mi Token es: ");
        print("mi token essss: ${miToken}");
        _myToken=miToken;
        // fr-hv4r1TqucqAh1eohElT:APA91bH4c-bzPMWAAxCUqdlRzEX43eq9C7Zjs9_U2WJkUKw23c6doF-1Ftd6hBRqNoC2t_JEjOsMVpKBwJQCNeTosFrUQTb2rzhQM8xaysN7AA5s5fT0OIu7VeYU2YRDdUX9bJYWJcHk
  //https://fcm.googleapis.com/fcm/send
  // key AAAAm8Ge_mE:APA91bGyP7_gtFiq6EKKPOCPiDJv3GQzyizcA_3GZAWd9ph0kt8cRlLrDaJMEWMetrI1R5JrqR9qmVA8q6YW4dXgOgvjEcPJdUMEEG2A9onRPk6gA5T1gFq1qOzihjwjG-DeIHGAXm0B
      });
    
    if(actuallatitude ==null && actuallongitude ==null){

      

      
     bool erroguardar=await QuerysService().SaveGeneralInfoTienda(reference: "tienda", id:id_variable, collectionValues:TiendaModel().toJsonBody(user.uid, id_variable,name_shoper,description,url,_category,latitude,longitude,widget.iconmodel.name,phone_,listaseEntrada,listaseSalida,fechaActual,widget.iconmodel.myToken),);
      






      if(erroguardar){
      showToast(error);
      }else{
      int status=0;
      _loading=false;
       fToast.showToast(
           toastDuration: Duration(seconds: 3),
           gravity: ToastGravity.CENTER,
        child: customizedLeadingIconWidget,
          );
        //  showToastExito(tiendaCreada);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(adminmodel,status)));
      }
    }else{ 
     bool erroguardar=await QuerysService().SaveGeneralInfoTienda(reference: "tienda", id:id_variable, collectionValues:TiendaModel().toJsonBody(user.uid, id_variable,name_shoper,description,url,_category,actuallatitude,actuallongitude,widget.iconmodel.name,phone_,listaseEntrada,listaseSalida,fechaActual,_myToken),);
      
      if(erroguardar){
      showToast(error);
      }else{
       _loading=false;
        fToast.showToast(
           toastDuration: Duration(seconds: 3),
           gravity: ToastGravity.CENTER,
        child: customizedLeadingIconWidget,
          );
         //  showToastExito(tiendaCreada);
           int status=0;
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(adminmodel,status)));
      }
    }
  }

    

   
  void showToast(mensaje) {
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
 void showToastExito(mensaje) {
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


  void _selectDate(BuildContext context,selectday) async {
FocusScope.of(context).requestFocus(new FocusNode());
     TimeOfDay newSelectedDate = await showTimePicker(context: context, initialTime: _selectedDate != null ? _selectedDate : TimeOfDay.now(), 
   
     builder: (BuildContext context, Widget child) {
        return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                 primary: Colors.black,
                onPrimary: Colors.white,
                surface: Colors.grey[300],
                onSurface: Colors.black,
              ),
               dialogBackgroundColor: Colors.blue[700],
            ),
             child: child,
          );
        });

 if (newSelectedDate != null) {
_selectedDate=newSelectedDate;

DateTime _textoPrueba= DateTime(2008,2,2,newSelectedDate.hour,newSelectedDate.minute);
_textoPruebaMio=_textoPrueba;
print(_selectedDate);
print(_textoPruebaMio);
 }
  }

  void _selectDateSalida(BuildContext context, TimeOfDay selectday)  async {
FocusScope.of(context).requestFocus(new FocusNode());
     TimeOfDay newSelectedDate = await showTimePicker(context: context, initialTime: _selectedDateSalida != null ? _selectedDateSalida : TimeOfDay.now(), 
   
     builder: (BuildContext context, Widget child) {
        return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                 primary: Colors.black,
                onPrimary: Colors.white,
                surface: Colors.grey[300],
                onSurface: Colors.black,
              ),
               dialogBackgroundColor: Colors.blue[700],
            ),
             child: child,
          );
        });

 if (newSelectedDate != null) {
_selectedDateSalida=newSelectedDate;

DateTime _textoPruebaSalida= DateTime(2010,2,2,newSelectedDate.hour,newSelectedDate.minute);
_textoPruebaMioSalida=_textoPruebaSalida;
print(_selectedDateSalida);
print(_textoPruebaMioSalida);
 }
  }








 Widget servicios() {
   return Container(
     child: Column(
       children: [
         Text("Servicios de su Tienda",style:TextStyle(fontSize:20, fontWeight: FontWeight.bold )),
          SizedBox(height:20),

          Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround, 
            children: [
              Text("Agregue sus servicios",style:TextStyle(fontSize:18, )),
              FloatingActionButton(
                        heroTag: "uno",
                        child: Icon(Icons.add),
                        onPressed: () {    
                          agregarVistaServicios(context);                 
                        },
                      ),
            ],
          ),
          SizedBox(height:15),
          //aqui va list view
          Container(
            width:MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.37,
            padding:EdgeInsets.all(10),
            decoration:BoxDecoration(
              color:Colors.grey[200],
            ),           
       child: Scrollbar(
            isAlwaysShown: true,
            controller: controllerScroll,
            child: ListView.builder(            
               itemCount: indexMio,
              controller: controllerScroll,             
               itemBuilder: (BuildContext context, int index) {
                    int indezar=index;
                    if(index==indezar){
                      indezar++;
                    }
                        return Row(             
                          children: [    
                            SizedBox(height:MediaQuery.of(context).size.height*0.2),
                            Container(
                              width:255,
                              height:136,
                              decoration:BoxDecoration(
                                color:Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                               image: new FileImage(listImagen[index]),
                              fit:BoxFit.cover,
                            ),
                              ),
                              child:Container(

                                 decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.3),
        ),
                                child: Column( 
                                  children:[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("Servicio Nº ${indezar}",style:TextStyle(color:Colors.white)),
                                       
                                        SizedBox(width:55),
                                        Row(
                                          children: [
                                        GestureDetector(
                                          onTap:(){
                                            eliminarServicio(index);
                                          },
                                          child: Container( 
                                              width: 35,
                                              height: 35,
                                              child: Icon(Icons.delete, color:Colors.white),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20),
                                              
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                   Row(children:[
                                     SizedBox(width:13),
                                      Text("Nombre:", style:TextStyle(fontWeight:FontWeight.bold, color:Colors.white)),
                                      Text("  ${listaserviciosNombre[index]}",style:TextStyle(color:Colors.white)),
                                   ],),
                                   SizedBox(height:13),
                                    Row(children:[
                                     SizedBox(width:13),
                                      Text("Descripcion:", style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white)),
                                       SizedBox(width:8),
                                      Flexible(
                                        child: Text("${listServiceDescription[index]}",style:TextStyle(color:Colors.white),
                                        maxLines: 2,
                                        ),
                                        ),
                                   ],),
                                   SizedBox(height:13),
                                      Row(children:[
                                     SizedBox(width:13),
                                      Text("Tiempo del servicio:", style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white)),
                                      Text("  ${listServiceDuration[index]} minutos",style:TextStyle(color:Colors.white)),
                                   ],),
                                  ],
                                ),
                              ),
                            ),
                        ],);
                  }, 
            ),
          ),
        ),
       ],
     )
     );
 }




  void add_target(int index) {
   String nombre_service =nombre_servicios.text.trim();
   String descripcion_service= descripcion_servicios.text.trim();
   
   String mendajeNombreServicio="El nombre del servicio No puede estar vacio";
   String mendajeNombreLongitudServicio="El nombre del servicio no puede tener mas de 28 Caracteres";
   String mendajDescripcionServicio="Por favor ponga una breve descripcion";
   String mendajTiempoServicio="Por favor escoja el tiempo que dura su servicio";
   String mendajImagen="Por favor seleciona una imagen";
   int index=indexMio;

    if(nombre_service.isEmpty){
      showToast(mendajeNombreServicio);
       return;
    }
    if(nombre_service.length>28){
      showToast(mendajeNombreLongitudServicio);
       return;
    }

    if(descripcion_service.isEmpty){
      showToast(mendajDescripcionServicio);
       return;
    }
    if(durationService==null){
      showToast(mendajTiempoServicio);
       return;
    }
    if(imagenService==null){
      showToast(mendajImagen);
       return; 
    }
    setState(() { 
      indexMio++;
    });

      print(nombre_service);
      print(descripcion_service);

    if(indexMio >= 0){
      int duration_servi= int.parse(durationService);
      listaserviciosNombre.add(nombre_service);
      listServiceDescription.add(descripcion_service);
      listServiceDuration.add(duration_servi);
      listImagen.add(imagenService);

      print(listaserviciosNombre);
      print(listServiceDescription);
      print(listServiceDuration);
      print(listImagen);
        Navigator.pop(context);
      }
  }

  
   void agregarVistaServicios(BuildContext context){
    imagenService=null;
      showDialog(context: context, builder: (context) {
        return AlertDialog(
              title: Text("Servicio", style:TextStyle(fontSize:24, fontWeight: FontWeight.bold)),
              content: SingleChildScrollView(
                child: Container(
                  height: 438,
                  color:Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [



                         GestureDetector(
              onTap:(){
                 print("subiendo imagen${_imagen}");
                mostrarOpcionesServices(context);
              },
                    child: Container(
                                    width: MediaQuery.of(context).size.width*0.9,
                                    height:160,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                  subirImagenService(),
                                      ],
                                    ),
                                      decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius:BorderRadius.circular(10),
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
                                          labelText: "Ejemplo: Lavado de auto"),
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
                                          labelText: "Ejemplo: El mejor lavado de merida"),
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
                                              "15 minutos",
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
                                ],
                              ),
                            ),
                          ),
                          actions: <Widget>[
                FlatButton(
                  child: Text("Cancelar", style: (TextStyle(color: Colors.blue))),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("Guardar", style: (TextStyle(color: Colors.blue))),
                  onPressed: (){
                    add_target(indexMio);
                  },
                ),
               ],
            );
      });
    }

  void eliminarServicio(int index1) {
    setState(() {
       listaserviciosNombre.removeAt(index1);
       listServiceDuration.removeAt(index1);
       listServiceDescription.removeAt(index1);
         listImagen.removeAt(index1);
     indexMio--;
    });
    
     print(listaserviciosNombre);
     print(listServiceDescription);
     print(listServiceDuration);
  }

    String exitiImagen="Imagen selecionada Exitosamente!!!";
   Widget subirImagenService() {
     if(imagenService==null){
        return Icon(Icons.camera_alt, size:100);
      }else{
        
        return ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.file(imagenService, width:MediaQuery.of(context).size.width*0.67  ,  height:MediaQuery.of(context).size.width*0.45 , fit:BoxFit.cover));
      }
  }
   void getImageService(ImageSource tipp_Imagen) async{   
    var imagesService = await ImagePicker.pickImage(source: tipp_Imagen);
      setState(() {
        imagenService=imagesService;
        showToast(exitiImagen);
      });
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
            Text("Felicidades su tienda ha sido creada con exito", style:TextStyle(color: Colors.white)),
          ],
        ),
      );

    
}