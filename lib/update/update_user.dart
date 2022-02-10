import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:z04_app_reservas_firebase/firebase/authenticatio.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';

class UpdateUser extends StatefulWidget {
  UsuarioModel iconmodel;
  UpdateUser(this.iconmodel);

  @override
  _UpdateUserState createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset : false,
        
        body: Container(
           width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color:Colors.grey[800],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.68,
                padding: EdgeInsets.only(top:2,left:18,right:18,bottom:5),
              
                child:ListView(
                  children: [Column(
                    children: [
                        SizedBox(height:MediaQuery.of(context).size.height*0.01),
                      Text("Editar Usuario", style:TextStyle(fontSize:28,fontWeight:FontWeight.bold)),

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
                                        labelText: "${widget.iconmodel.name}"),
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
                                        Icons.security,
                                        color: Colors.grey,
                                      ), // icon is 48px widget.
                                    ),
                                        labelText: "${widget.iconmodel.lastName}"),
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
                                        labelText: "${DateFormat.yMMMd().format(widget.iconmodel.dateOfBirday)}"),
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
                                        Icons.security,
                                        color: Colors.grey,
                                      ), // icon is 48px widget.
                                    ),
                                        labelText: "${widget.iconmodel.numberPhone}"),
                                        onChanged:(value){
                                        },
                                          validator:(value){
                                          if(value.isEmpty){
                                            return "El campo esta vacio";
                                          }
                                        }
                                        ),


  SizedBox(height:MediaQuery.of(context).size.height*0.02),

                                         SizedBox(height:MediaQuery.of(context).size.height*0.03),
                                           GestureDetector(
                                onTap: (){
                               ActualizarUsuario();
                                },
                                child: Container(
                                width:MediaQuery.of(context).size.width,
                                height:MediaQuery.of(context).size.height*0.07,
                                  decoration:BoxDecoration(
                                                color:Colors.blue,
                                                borderRadius:BorderRadius.circular(10),
                                                  ),
                                  child:Center(child: Text("Actualizar",style:TextStyle(color:Colors.white, fontSize:18)))
                                ),
                              ),


                                        SizedBox(height:10),
                            
                      GestureDetector(
                        onTap:(){
                          int status=0;
                           Navigator.pop(context, MaterialPageRoute(builder: (context)=>home1(widget.iconmodel, status))); 

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
                  ),],
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

  
  void ActualizarUsuario() async{
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
    bool TelefonoValid = RegExp(r'^\d{10}$').hasMatch(phone_);
    String error="error";
    String usuarioActualizado="El usuario se ha actualizado con exito!!";


    
    
    if(phone_.isNotEmpty && TelefonoValid==false){
      showToast(msnToastTelefono);
      return;
    }
   
   
    
      User user = await Authentication().getCurrentUser();
      // UsuarioModel adminmodel = await FetchData().getAdmin(user.uid);
      bool erroguardar=await QuerysService().actualizarInfo(reference: "usuarios", id:user.uid, collectionValues:UsuarioModel().toJsonBodyActualizar(
        
        user.uid,
        usuarioNombre.isEmpty?widget.iconmodel.name:usuarioNombre,
        lastName_.isEmpty?widget.iconmodel.lastName:lastName_,
        fecha==null?widget.iconmodel.dateOfBirday:fecha,
         phone_.isEmpty?widget.iconmodel.numberPhone:phone_,
         _selectedDatew),);
     
   if(erroguardar){
      showToast(error);
      }else{
        _cargando(context);
           showToast(usuarioActualizado);
           UsuarioModel adminmodel = await FetchData().getAdmin(user.uid);
           int status=0;
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(adminmodel,status))); 
      }
    
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