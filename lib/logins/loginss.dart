import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:z04_app_reservas_firebase/firebase/authenticatio.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/register/register_user.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final usuario = TextEditingController();
  final password= TextEditingController();
  String usu;
  String pass;
  bool ver= true;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        color:Colors.blue[900],
        child: Row(children: [
          
          Expanded(
            flex: 4,
            child: Container(
               height: MediaQuery.of(context).size.height,
              width:MediaQuery.of(context).size.width,
              
              child: Center(child: 
              Container(
              height: MediaQuery.of(context).size.height*0.4,
              width:MediaQuery.of(context).size.width*0.90,
              padding: EdgeInsets.only(left:10, right:10,top:20,bottom:10,),
              decoration: BoxDecoration(
                  color:Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      
                      Text("INICIAR SESIÓN",style:TextStyle(color:Colors.black,fontSize: 28, fontWeight:FontWeight.bold)),

                      SizedBox(height: MediaQuery.of(context).size.height*0.04,),
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
                                        usu=value;
                                      },
                                        validator:(value){
                                        if(value.isEmpty){
                                          return "El campo esta vacio";
                                        }
                                      }
                                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                      

                          TextFormField(
                            controller:password,
                                    decoration: InputDecoration(
                                      prefixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: Icon(
                                      Icons.security,
                                      color: Colors.grey,
                                    ), 
                                  ),
                                  suffixIcon: Padding(
                                    padding: EdgeInsets.all(0.0),
                                    child: GestureDetector(
                                      onTap:(){
                                        setState(() {
                                          if(ver==true){
                                            ver=false;
                                          }else{
                                            ver=true;
                                          }
                                        });
                                      },
                                      child: Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: Colors.grey,
                                      ),
                                    ), 
                                  ),
                                      labelText: "Contraseña"),
                                      obscureText: ver,
                                      onChanged:(value){
                                        pass=value;
                                      },
                                        validator:(value){
                                        if(value.isEmpty){
                                          return "El campo esta vacio";
                                        }
                                      }
                                      ),
                        
                       SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: (){
                               _loguearme();
                              },
                              child: Container(
                                width: 130,
                                height: 44,
                                color: Colors.black,
                                child:Center(child: Text("INGRESAR",style:TextStyle(color: Colors.white)))
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*0.01),
                            GestureDetector(
                              onTap:(){
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => RegisterUser()),
                               );
                              },
                              child: Container(
                                width:130,
                                height: 44,
                                
                                child:Center(child: Text("Registrarse", style: TextStyle(decoration: TextDecoration.underline,)),
                                
                              )),
                            ),
                          ],
                        ),

                    ],
                  ),
                )))))
        ],)),
    );
  }

 
 _loguearme() async {
    //ocultar el teclado el focus
    FocusScope.of(context).requestFocus(FocusNode());

    String email = usuario.text.trim();
    String contrasena = password.text.trim();
    String msnToastEmail="Su correo no está escrito correctamente, por favor, verifíquelo";
    String mnsToastContrasena="Su contraseña debe ser minimo de 6 caracteres, por favor, verifíquela";  
    String msnError="Usuario y/o contraseña erronea, intente de nuevo";
    String msnBienvenido="Bienvenido";
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
      if(emailValid==false){
        showToast(msnToastEmail); 
        return;
      }
    if(contrasena.length < 6 ){
     showToast(mnsToastContrasena);
      return;
    }
    var auth = await Authentication().logingUser(email: email, password: contrasena);

    if(auth.succes){
        _cargando(context);
      User user = await Authentication().getCurrentUser();
      UsuarioModel usuario = await FetchData().getAdmin(user.uid);
        
    showToastBienvenido(msnBienvenido, usuario.name);
    if(usuario!=null){
      int status=0;
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(usuario,status)));
    }
    }
    else{
      showToast(msnError);
    }
  }


  void showToast(mensaje) {
    Fluttertoast.showToast(
        msg: mensaje,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
       backgroundColor: Colors.red[700],
        textColor: Colors.white,
        fontSize: 14.0,
        
    );
  }
  void showToastBienvenido(mensaje, nombre) {
    Fluttertoast.showToast(
        msg: "${mensaje} ${nombre}",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.teal[800],
       
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
           
              Text("Por favor espere", style:TextStyle(color:Colors.white)),
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