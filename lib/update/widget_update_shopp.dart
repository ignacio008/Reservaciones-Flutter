import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/firebase/query.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/models/tienda_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/update/update_general_shop.dart';
import 'package:z04_app_reservas_firebase/update/update_service.dart';

class WidgetUpdateShopp extends StatefulWidget {
  TiendaModel iconmodel;
  UsuarioModel iconmodelUsuario;
  WidgetUpdateShopp(this.iconmodel, this.iconmodelUsuario);

  @override
  _WidgetUpdateShoppState createState() => _WidgetUpdateShoppState();
}

class _WidgetUpdateShoppState extends State<WidgetUpdateShopp> {
  final nombre_tienda= TextEditingController();
  final descripcion_tienda= TextEditingController();
  final phone= TextEditingController();
  String _category;
  ScrollController controller;
  final europeanCountries = ['Lunes','Martes','Miercoles','Jueves','Viernes','Sabado','Domingo'];
  List  principales=[TimeOfDay(hour: 0, minute: 00,),
TimeOfDay(hour: 0, minute: 00,),
TimeOfDay(hour: 0, minute: 00,),
TimeOfDay(hour: 0, minute: 00,),
TimeOfDay(hour: 0, minute: 00,),
TimeOfDay(hour: 0, minute: 00,),
TimeOfDay(hour: 0, minute: 00,),
];
  Set<String> guardarLetras = Set<String>();
  TextEditingController _textEditingController = TextEditingController();
  String hora_sar = "Hora de entrada";
  String hora_salida="Hora de Salida";
  String aceptar="Aceptar";
  String quitar="Quitar de la lista";
  TimeOfDay _selectedDate; 
  TimeOfDay _selectDayUno;
  DateTime _textoPruebaMio;
  DateTime _selectDayUno1=DateTime(2019,1,1,  0,0);

  TimeOfDay _selectedDateSalida;
  DateTime _textoPruebaMioSalida;
  DateTime _selectDayUno1Salida=DateTime(2020,1,1,  0,0);

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
DateTime updateDate= DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    controller= ScrollController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset : false,
      appBar:AppBar(
        
        title:Text("Editar Tienda", style:TextStyle(color:Colors.white)),
         backgroundColor: Colors.blue[700],
          bottomOpacity: 0.0,
          elevation: 0.0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left:23, right:23, top:40, bottom:24),
        color:Colors.grey[800],
        child:datosTienda()
      ));
  }
  Widget datosTienda() {
          return Container(
             width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
         decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                           color: Colors.white,
                        ),
            child: ListView(
              
              children: [Column(
                   // ignore: prefer_const_literals_to_create_immutables
                   children:[
                     SizedBox(height:10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Edite su tienda", style:TextStyle(fontSize:28,fontWeight:FontWeight.bold)),
                          ],
                        ),
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
                                            labelText: "${widget.iconmodel.nameShop}"),
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
                                            labelText: "${widget.iconmodel.descriptionShop}"),
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
                                            labelText: "${widget.iconmodel.numberPhone}"),
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
                                                "${widget.iconmodel.category}",
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
                              color:Colors.grey[100],
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
            
                    SizedBox(height:30),

                    GestureDetector(
                      onTap:(){
                        actualizarTienda(widget.iconmodel.idShop,widget.iconmodel.numberPhone);
                      },
                      child: Container(
                          width:MediaQuery.of(context).size.width*0.8,
                          height:MediaQuery.of(context).size.height*0.07,
                        decoration:BoxDecoration(
                          color:Colors.blue,
                          borderRadius:BorderRadius.circular(10),
                            ),
                        child: Center(child: Text("Actualizar Tienda",style:TextStyle(color:Colors.white, fontSize:18))),),
                    ),

                    SizedBox(height:10),


                     GestureDetector(
                        onTap:(){
                           Navigator.pop(context, MaterialPageRoute(builder: (context)=>UpdateServiceGeneral(widget.iconmodel,   widget.iconmodelUsuario))); 

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

                      SizedBox(height:10),

            
                   ],
              ),
              ],),
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

  void actualizarTienda(String idTienda,String phones) async{
String tiendaActualizada="Felicidades su tienda a sido Actualizada con exito!!!";
  String error="error";
  String name_shoper =nombre_tienda.text.trim();
  String description= descripcion_tienda.text.trim();
  String msnToastNombre="El nombre de la tienda No puede estar vacio";
  String msnToastDesciption ="Por favor ponga una breve descripcion";
  String msnToastImagen ="Por favor Suba una foto de su tienda";
  String msnCategory ="Por favor escoja de nuevo una categoria";
  String phone_ = phone.text.trim();
  bool emailValid = RegExp(r'^\d{10}$').hasMatch(phone_);
  String msnToastTelefono="El telefono solo puede contener numeros y debe tener 10 dígitos.";
  String msnToastSemanasHorario="Por favor seleccione por lo menos 1 dia de la semana que laboran";

    if(guardarLetras.isEmpty){
      showToast(msnToastSemanasHorario);
      return;
    }
    if(phone_.isNotEmpty && emailValid==false){
      showToast(msnToastTelefono);
      return;
    }
 
     bool erroguardar=await QuerysService().actualizarDatosTienda(reference: "tienda", id:idTienda, collectionValues:TiendaModel().toJsonBodyUpdateShopp(idTienda,
     name_shoper.isEmpty?widget.iconmodel.nameShop:name_shoper,
     description.isEmpty?widget.iconmodel.descriptionShop:description,
     _category==null?widget.iconmodel.category:_category,
     phone_.isEmpty?phones:phone_,
     listaseEntrada,
     listaseSalida,
     updateDate),);

      if(erroguardar){
      showToasterror(error);
      }else{
        _cargando(context);
           showToast(tiendaActualizada);
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