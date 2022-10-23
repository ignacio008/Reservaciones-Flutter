import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/models/notification_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/all_notification_shopp.dart';
import 'package:z04_app_reservas_firebase/partes/all_notification_widget.dart';

class AllNotification extends StatefulWidget {
  UsuarioModel iconmodelUser;
  AllNotification(this.iconmodelUser);

 @override
  _AllNotificationState createState() => _AllNotificationState();
}
class _AllNotificationState extends State<AllNotification> {
  bool isLoaded=false;
 
 List iconmodellistNotificationUsuario=[];

   void getlistaNotificacion(String idusuario, int status,)async{
     iconmodellistNotificationUsuario=await FetchData().getTopMynotificationUsuario(idusuario,status, );
    setState(() {
       isLoaded=true;
    });
     print('Tengo ${iconmodellistNotificationUsuario.length} Tiendas');
   }

  ScrollController controller;
  List<NotificationModel> iconModelList=[];

  void getMyNotificationcompue(String idusuarioShop, int status)async{
    iconModelList=await FetchData().getTopMynotificationes(idusuarioShop, status);
    print('Tengo ${iconModelList.length} cards');
    setState(() {
      
    });
  }

  @override
  void initState() {
    // TODO: implement initState
     controller= ScrollController();
      getlistaNotificacion(widget.iconmodelUser.idUsuario,0);

    getMyNotificationcompue(widget.iconmodelUser.idUsuario,0);
    super.initState();
  }
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Notificaciones"),
        elevation:0.0,
        bottomOpacity: 0.0,
        backgroundColor: Colors.blue[700],
      ),
      body:Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        child:Column(
          children:[

             
            GestureDetector(
              onTap:(){
                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AllNotificationShopp(widget.iconmodelUser) ));
   
              },
              child: Container(
                width:MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height*0.1,
                    color:Colors.grey[800],
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width:MediaQuery.of(context).size.width*0.07),
                    Text("Tienes ${iconModelList.length} solicitudes por confirmar",style:TextStyle(color:Colors.white)),
                    SizedBox(width:10),
                    Icon(Icons.notifications, color:Colors.yellow, size:30),
            
                  ],
                ),
              ),
            ),
          







  SizedBox(height:MediaQuery.of(context).size.height*0.02),
           Container(
             width:MediaQuery.of(context).size.width,
             height:MediaQuery.of(context).size.height*0.75,
             child:



              isLoaded==false? Container(
       child: Center(
         child: Column(
                         
                          children:[
                            SizedBox(height:MediaQuery.of(context).size.height*0.2),
                        Container( 
                          width: MediaQuery.of(context).size.width*0.7,
                          height:MediaQuery.of(context).size.height*0.3,
                        
             child: Transform.scale(
                scale: 0.9,
               child: CircularProgressIndicator())) 
                        ]),
       ),

      ):


              iconmodellistNotificationUsuario.isEmpty?Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                  Icon(Icons.warning_amber_rounded, size:230, color:Colors.orange[600]),
                  Text("¡No Tienes ninguna Notificacion!"),
                ]),


              ):
             Scrollbar(
            isAlwaysShown: true,
            controller: controller,
            child: ListView.builder(
               itemCount: iconmodellistNotificationUsuario.length,
              controller: controller,
              
               itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,              
                          children: [              
          iconmodellistNotificationUsuario.isEmpty?CircularProgressIndicator(): SizedBox(height:MediaQuery.of(context).size.height*0.27), AllNotificationWidget(iconmodellistNotificationUsuario[index], widget.iconmodelUser,),
                        ],);
                  },
              



              
            ),
          ),
           ),
          ],
        ),
      ),
    );
  }
}