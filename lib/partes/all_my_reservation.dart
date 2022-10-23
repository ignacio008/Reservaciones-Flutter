import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/models/reservacion_model.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';
import 'package:z04_app_reservas_firebase/partes/all_my_reservation_widget.dart';

class AllMyReservation extends StatefulWidget {
  UsuarioModel iconmodelUser;
  AllMyReservation(this.iconmodelUser);

  @override
  _AllMyReservationState createState() => _AllMyReservationState();
}

class _AllMyReservationState extends State<AllMyReservation> {
  List<Reservation> iconModelList=[];
   ScrollController controller;
  bool isLoading=false;

 void getlista(String idusuario)async{
    iconModelList=await FetchData().getTopMyReservation(idusuario);
    print('Tengo ${iconModelList.length} cards');
    isLoading=true;
    setState(() {
      
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    controller= ScrollController();
    getlista(widget.iconmodelUser.idUsuario);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text("Mis Reservaciones"),
        elevation: 0,
        bottomOpacity:0.0,
        backgroundColor: Colors.blue[700],
      ),
      body: 
      

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

      iconModelList.isEmpty?Center(
        child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                        Icon(Icons.warning_amber_rounded, size:230, color:Colors.orange[600]),
                        Text("¡No Tienes ninguna reservacion hecha!"),
                      ]),


                    ),
      ):
      Container(
        width:MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
       
        
        child:Scrollbar(
         isAlwaysShown: true,
         controller: controller,
         child: ListView.builder(
            itemCount: iconModelList.length,
           controller: controller,
           
            itemBuilder: (BuildContext context, int index) {
                     return Row(
                       mainAxisAlignment: MainAxisAlignment.center,              
                       children: [              
           iconModelList.isEmpty?CircularProgressIndicator():  WidgetAllMyReservation(iconModelList[index],index),
                     ],);
               },
           



           
         ),
           ),
      ),
    );
  }
}