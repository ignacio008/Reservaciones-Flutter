import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/models/notification_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/all_notification_shopp_widget.dart';


class AllNotificationShopp extends StatefulWidget {
  UsuarioModel iconmodelUser;
  AllNotificationShopp(this.iconmodelUser);

  @override
  State<AllNotificationShopp> createState() => _AllNotificationShoppState();
}

class _AllNotificationShoppState extends State<AllNotificationShopp> {
  ScrollController controller;
  List<NotificationModel> iconModelList=[];
  bool isLoading=false;
   void getMyNotificationcompue(String idusuarioShop, int status)async{
    iconModelList=await FetchData().getTopMynotificationes(idusuarioShop, status);
    isLoading=true;
    print('Tengo ${iconModelList.length} cards');
    setState(() {

    });
  }
  @override
  void initState() {
    // TODO: implement initState
    getMyNotificationcompue(widget.iconmodelUser.idUsuario,0);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Notificacion de tu tienda"),
        bottomOpacity: 0.0,
        elevation: 0.0,
        backgroundColor: Colors.blue[700],
      ),
     body: Container(
        width:MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height,
        child:Column(
          children:[

              
           Container(
                width:MediaQuery.of(context).size.width,
                    height:MediaQuery.of(context).size.height*0.1,
                    color:Colors.grey[800],
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width:MediaQuery.of(context).size.width*0.07),
                    Text("Tienes ${iconModelList.length} ${iconModelList.length>=2?"reservaciones":"reservacion"}",style:TextStyle(color:Colors.white, fontSize:16)),
                    // SizedBox(width:10),
                    // Icon(Icons.notifications, color:Colors.yellow, size:30),
            
                  ],
                ),
              ),


  SizedBox(height:MediaQuery.of(context).size.height*0.02),
           Container(
             width:MediaQuery.of(context).size.width*0.95,
             height:MediaQuery.of(context).size.height*0.75,
             child:

        isLoading==false? Container(
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
            



              iconModelList.isEmpty?Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                  Icon(Icons.warning_amber_rounded, size:230, color:Colors.orange[600]),
                  Text("¡No Tienes ninguna Notificacion por confirmar!"),
                ]),
              ):

               
      
             Scrollbar(
            isAlwaysShown: true,
            controller: controller,
            child: ListView.builder(
               itemCount: iconModelList.length,
              controller: controller,
              
               itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,              
                          children: [              
          iconModelList.isEmpty?CircularProgressIndicator(): SizedBox(height:MediaQuery.of(context).size.height*0.32), AllNotificationShoppWidget(iconModelList[index], widget.iconmodelUser,),
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