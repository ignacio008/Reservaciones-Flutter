import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' show Encoding, json;
class Reservation{
  String idShop;
  String idUser;
  String idReservation;
  String nameUsuario;
  String numberPhone;
  String nameShop;
  String nameService;
  DateTime startService;
  DateTime endService;
  DateTime createAtReservation;
  DateTime updateAtReservation;
  int status;
  String idUserShop;
  int finishReservation;
  
  
  Reservation({this.idReservation,this.idShop,this.idUser,this.nameUsuario,this.numberPhone,this.nameShop,this.nameService,this.startService,this.endService,this.createAtReservation,this.updateAtReservation,this.status,this.idUserShop,this.finishReservation});



      
   List  <Reservation> getReservation(dynamic miInfo){
      List<Reservation>iconmodelLits=[];


   
for(var datos in miInfo){
      final idReservation_ = datos.data()['idReservation'];
      final idShop_ = datos.data()['idShop'];
      final idUser_ = datos.data()['idUser'];
      final nameUsuario_ = datos.data()['nameUsuario']?? null;;
      final numberPhone_ = datos.data()['numberPhone']?? null; 
      final nameShop_ = datos.data()['nameShop']?? null;;
      final nameService_ = datos.data()['nameService']?? null;;
      final startService_ = datos.data()['startService']??null;;
      final endService_ = datos.data()['endService'] ?? null;;
      final createAtReservation_ = datos.data()['createAtReservation']?? null;;
      final updateAtReservation_ = datos.data()['updateAtReservation']?? null;;
      final status_ = datos.data()['status'] ?? null;;
      final idUserShop_ = datos.data()['idUserShop'] ?? null;;
      final finishReservation_  = datos.data()['finishReservation'] ?? null;;
     

      Reservation usuariomodel = Reservation(
        idReservation:idReservation_,
        idShop: idShop_,
        idUser: idUser_,
        nameUsuario: nameUsuario_,
        numberPhone:numberPhone_,
        nameShop:nameShop_,
        nameService:nameService_,
      
        startService: startService_== null ? null :startService_.toDate(),
        endService: endService_== null ? null :endService_.toDate(),
        createAtReservation:createAtReservation_==null?null:createAtReservation_.toDate(),
       updateAtReservation:updateAtReservation_== null ? null:updateAtReservation_.toDate(),
       status:status_,
       idUserShop:idUserShop_,
       finishReservation:finishReservation_,

      );
 iconmodelLits.add(usuariomodel);
}
      return iconmodelLits;
     }

      Map<String, dynamic> toJsonBody(idReservation,idShop,idUser,nameUsuario,numberPhone,startService,createAtReservation,status, nameShop, nameService,idUserShop,finishReservation) =>
          {
            'idReservation': idReservation,
            'idShop': idShop,
            'idUser': idUser,
            'nameUsuario': nameUsuario,
            'numberPhone': numberPhone,
            'startService': startService,
            'createAtReservation':createAtReservation,
            'status':status,
            'nameShop':nameShop,
            'nameService':nameService,
            'idUserShop':idUserShop,
            'finishReservation':finishReservation,
            
          };
           Map<String, dynamic> toJsonBodyActualizarReservation(idReservation,status) =>
          {
            'idReservation': idReservation,
            
            'status':status,
            
            
          };

           Map<String, dynamic> toJsonBodyActualizarReservationFinih(finishReservation) =>
          {
            'finishReservation':finishReservation,
            
            
          };








}