import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:z04_app_reservas_firebase/firebase/authenticatio.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/logins/loginss.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:intl/intl.dart';

class RegisterUser extends StatefulWidget {
  RegisterUser({Key key}) : super(key: key);

  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  FToast fToast;
  final usuario= TextEditingController();
  final password= TextEditingController();
  final lastname= TextEditingController();
  final nombre= TextEditingController();
  
  
  final phone= TextEditingController();
  TextEditingController _dateController = TextEditingController();
 
   DateTime _selectedDate;
   TextEditingController _textEditingController = TextEditingController();

    String dropdownvalue2 = 'Yucatan';
  var items2 =  ['Yucatan'];

    String dropdownvalueCiudad = 'Merida';
  var itemsCiudad =  ['Merida'];

  String _myToken;
  List tokens=[];

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
       resizeToAvoidBottomInset : false,
        
        body: Container(
           width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color:Colors.grey[900],
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.1),
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.8,
                padding: EdgeInsets.only(top:10,left:18,right:18,bottom:10),
              
                child:SingleChildScrollView(
                  child: Column(
                    children: [
                         SizedBox(height:MediaQuery.of(context).size.height*0.02),
                     Text("Registrate", style:TextStyle(fontSize:28,fontWeight:FontWeight.bold)),

                                    SizedBox(height:MediaQuery.of(context).size.height*0.02),
                      
                      
                                      
                              
                      TextFormField(
                         controller:usuario,
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.email,
                                        color: Colors.grey,
                                      ), // icon is 48px widget.
                                    ),
                                        labelText: "Correo electronico"),
                                        onChanged:(value){
                                        },
                                          validator:(value){
                                          if(value.isEmpty){
                                            return "El campo esta vacio";
                                          }
                                        }
                                        ),
                                SizedBox(height:MediaQuery.of(context).size.height*0.02),
                                TextFormField(
                         controller:password,
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.security,
                                        color: Colors.grey,
                                      ), // icon is 48px widget.
                                    ),
                                        labelText: "Contraseña"),
                                        onChanged:(value){
                                        },
                                          validator:(value){
                                          if(value.isEmpty){
                                            return "El campo esta vacio";
                                          }
                                        }
                                        ),
                              
                              
                            
                              
                              
                              
                              
                                    SizedBox(height:MediaQuery.of(context).size.height*0.02),
                             TextFormField(
                         controller:nombre,
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.supervised_user_circle,
                                        color: Colors.grey,
                                      ), // icon is 48px widget.
                                    ),
                                        labelText: "Nombre"),
                                        onChanged:(value){
                                        },
                                          validator:(value){
                                          if(value.isEmpty){
                                            return "El campo esta vacio";
                                          }
                                        }
                                        ),
                              
                                                  SizedBox(height:MediaQuery.of(context).size.height*0.02),
                                TextFormField(
                         controller:lastname,
                                      decoration: InputDecoration(
                                        prefixIcon: Padding(
                                      padding: EdgeInsets.all(0.0),
                                      child: Icon(
                                        Icons.contacts_rounded,
                                        color: Colors.grey,
                                      ), // icon is 48px widget.
                                    ),
                                        labelText: "Apellido"),
                                        onChanged:(value){
                                        },
                                          validator:(value){
                                          if(value.isEmpty){
                                            return "El campo esta vacio";
                                          }
                                        }
                                        ),
                              
                  SizedBox(height:MediaQuery.of(context).size.height*0.02),
                                TextFormField(
                                  onTap:(){
                                   FocusScope.of(context).requestFocus(new FocusNode());
                                _selectDate(context);
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
                                        labelText: "Fecha de nacimiento"),
                                        onChanged:(value){
                                        },
                                          validator:(value){
                                          if(value.isEmpty){
                                            return "El campo esta vacio";
                                          }
                                        }
                                        ),




                   SizedBox(height:MediaQuery.of(context).size.height*0.02),
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
                                        labelText: "Telefono"),
                                        onChanged:(value){
                                        },
                                          validator:(value){
                                          if(value.isEmpty){
                                            return "El campo esta vacio";
                                          }
                                        }
                                        ),


  SizedBox(height:MediaQuery.of(context).size.height*0.02),

  

 Row(
   mainAxisAlignment: MainAxisAlignment.center,
   children: [
     Row(
       children: [
         Text("Estado: "),
         SizedBox(width:MediaQuery.of(context).size.width*0.02),
         DropdownButton(
                        value: dropdownvalue2,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items:items2.map((String items) {
                               return DropdownMenuItem(
                                   value: items,
                                   child: Text(items)
                               );
                          }
                          ).toList(),
                        onChanged: (String newValue){
                          setState(() {
                            dropdownvalue2 = newValue;
                          });
                        },
                      ),
       ],
     ),

SizedBox(width:MediaQuery.of(context).size.width*0.06),

                   Row(
                     children: [
                       Text("Ciudad: "),
                       SizedBox(width:MediaQuery.of(context).size.width*0.02),
                       DropdownButton(
                        value: dropdownvalueCiudad,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items:itemsCiudad.map((String items) {
                               return DropdownMenuItem(
                                   value: items,
                                   child: Text(items,
                                    style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 15,
                                           ),
                                      ),
                               );
                          }
                          ).toList(),
                        onChanged: (String newValue){
                          setState(() {
                            dropdownvalueCiudad = newValue;
                          });
                        },
                  ),
                     ],
                   ),
   ],
 ),










                              
                                         SizedBox(height:MediaQuery.of(context).size.height*0.03),
                                           GestureDetector(
                                onTap: (){
                                  Registarse();
                                },
                                child: Container(
                                  width:MediaQuery.of(context).size.width,
                                height:MediaQuery.of(context).size.height*0.07,
                                  decoration:BoxDecoration(
                                                color:Colors.blue,
                                                borderRadius:BorderRadius.circular(10),
                                                  ),
                                  child:Center(child: Text("Registrar",style:TextStyle(color:Colors.white, fontSize:18)))
                                ),
                              ),

                                SizedBox(height:10),
                            
                      GestureDetector(
                        onTap:(){
                         
                           Navigator.pop(context, MaterialPageRoute(builder: (context)=>Login())); 

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
              
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:BorderRadius.circular(5),
                ),
              ),
            ],
          ),
        ),
    );
  }

  void _selectDate(BuildContext context) async {
FocusScope.of(context).requestFocus(new FocusNode());
     DateTime newSelectedDate = await showDatePicker(context: context, initialDate: _selectedDate != null ? _selectedDate : DateTime.now(), 
     firstDate: DateTime(1920, 1),
     lastDate: DateTime.now(),
     
     builder: (BuildContext context, Widget child) {
        return Theme(
          
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                 primary: Colors.black,
                onPrimary: Colors.white,
                surface: Colors.grey[700],
                onSurface: Colors.white,
              ),
               dialogBackgroundColor: Colors.blue[700],
            ),
             child: child,
          );
        });

     if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat.yMMMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }

  void Registarse() async{
     FocusScope.of(context).requestFocus(FocusNode());
    String email = usuario.text.trim();
    String contrasena = password.text.trim();
    String usuarioNombre = nombre.text.trim();
    String lastName_ = lastname.text.trim();
    String phone_ = phone.text.trim();
    DateTime fecha=_selectedDate;
    DateTime _selectedDatew= DateTime.now();
    String estado_ =dropdownvalue2.trim();
    String ciudad_ =dropdownvalueCiudad.trim();
    String msnToastEmail="Su correo no está escrito correctamente, por favor, verifíquelo";
    String mnsToastContrasena="Su contraseña debe ser minimo de 6 caracteres, por favor, verifíquela";  
    String msnToastNombre="Su nombre No puede estar vacio";
     String msnToastApellido="Su apellido No puede estar vacio";
    String msnError="El correo ya se ha registrado, cambie de correo ";
    String usuarioRegistardo="El usuario se ha registrado con exito!!";
   String msnToastTelefono="El telefono solo puede contener numeros y debe tener 10 dígitos.";

   bool emailValid = RegExp(r'^\d{10}$').hasMatch(phone_);
   int admin=0;

if(!email.contains("@") || email.length < 3 ){
    showToast(msnToastEmail);
      return;
    }
    if(contrasena.length < 6 ){
      showToast(mnsToastContrasena);
      return;
    }
     if(usuarioNombre==""){
       showToast(msnToastNombre);
      return;
    }
    if(phone != null && emailValid==false){
      showToast(msnToastTelefono);
      return;
    }
    if(lastName_==""){
       showToast(msnToastApellido);
      return;
    }

    if(emailValid==true&&lastName_.isNotEmpty){
 _cargando(context);
    }
     
    
    var auth = await Authentication().createUser(email: email, password: contrasena);
    if(auth.succes){
      User user = await Authentication().getCurrentUser();
       final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
        _firebaseMessaging.requestPermission();
      _firebaseMessaging.getToken().then((miToken) async{
        print("mi Token es: ");
        print("mi token essss: ${miToken}");
        // 
      _myToken=miToken;
       
     
      bool erroguardar=await QuerysService().SaveGeneralInfo(reference: "usuarios", id:user.uid, collectionValues:UsuarioModel().toJsonBody(user.uid,usuarioNombre,lastName_,fecha, phone_,_selectedDatew,estado_,ciudad_,_myToken,admin),);

       fToast.showToast(
           toastDuration: Duration(seconds: 3),
           gravity: ToastGravity.CENTER,
        child: customizedLeadingIconWidget,
          );
       showToast(usuarioRegistardo);
       UsuarioModel adminmodel = await FetchData().getAdmin(user.uid);
       int status=0;
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(adminmodel,status))); 
         });
    }
    else{
      showToasterror(msnError);
     // Toast.show(auth.errorMessage, context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
     // setSpinnerStatus(false);
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
            Text("Felicidades te has registrado correctamente", style:TextStyle(color: Colors.white)),
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
     

