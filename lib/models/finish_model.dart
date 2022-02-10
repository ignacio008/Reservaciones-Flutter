
class FinishModel{


  String idFinish;
  String idReservation;
  String idUsuarioScanner;
  String idShop;
  String nameUser;
  String nameShop;
  String nameService;
  String comentarios;
  DateTime reservationDate;
  DateTime createReservationFinish;
  int typeFile;

  FinishModel({this.idFinish,this.idReservation,this.idUsuarioScanner,this.idShop,this.nameUser,this.nameShop,this.nameService,this.comentarios,this.reservationDate,this.createReservationFinish,this.typeFile} );



  
   List  <FinishModel> getFinish(dynamic miInfo){
      List<FinishModel>iconmodelLits=[];

for(var datos in miInfo){
  
      final idFinish_ = datos.data()['idFinish']?? null;;
      final idReservation_ = datos.data()['idReservation']?? null;;
      final idUsuarioScanner_ = datos.data()['idUsuarioScanner']?? null;;
      final idShop_ = datos.data()['idShop']?? null;;
      final nameUser_ = datos.data()['nameUser']?? null;;
      final nameShop_ = datos.data()['nameShop']?? null;;
      final nameService_ = datos.data()['nameService']?? null;;
      final comentarios_ = datos.data()['comentarios']?? null;;

      final reservationDate_ = datos.data()['reservationDate']?? null;;
      final createReservationFinish_ = datos.data()['createReservationFinish']?? null;;
      final typeFile_ = datos.data()['typeFile']?? null;;
      
     

      FinishModel usuariomodel = FinishModel(
        idFinish:idFinish_,
        idReservation:idReservation_,
        idUsuarioScanner: idUsuarioScanner_,
        idShop:idShop_,
        nameUser:nameUser_,
        nameShop: nameShop_,
        nameService:nameService_,
        comentarios:comentarios_,

        reservationDate: reservationDate_== null ? null :reservationDate_.toDate(),
        createReservationFinish: createReservationFinish_== null ? null :createReservationFinish_.toDate(),
        typeFile:typeFile_,

       
      );
 iconmodelLits.add(usuariomodel);
}
      return iconmodelLits;
     }

      Map<String, dynamic> toJsonBody(idFinish,idReservation,idUsuarioScanner,idShop,nameUser,nameShop,nameService,comentarios,reservationDate,createReservationFinish,typeFile) =>
          {
            'idFinish': idFinish,
            'idReservation': idReservation,
            'idUsuarioScanner': idUsuarioScanner,
            'idShop': idShop,
            'nameUser': nameUser,
            'nameShop':nameShop,
            'nameService':nameService,
            'comentarios':comentarios,
            'reservationDate':reservationDate,
            'createReservationFinish':createReservationFinish,
            'typeFile':typeFile,
            
          };



}