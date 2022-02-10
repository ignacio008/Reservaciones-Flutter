class NotaModel{

  String idNota;
  String idUsuarioScanner;
  String idShop;
  String nameUser;
  String nameShop;
  String nameService;
  String comentarios;
  DateTime createNotaFinish;

  NotaModel({this.idNota,this.idUsuarioScanner,this.idShop,this.nameUser,this.nameShop,this.nameService,this.comentarios,this.createNotaFinish   });



  
   List  <NotaModel> getNota(dynamic miInfo){
      List<NotaModel>iconmodelLits=[];

for(var datos in miInfo){
      
      final idNota_ = datos.data()['idNota']?? null;;
      final idUsuarioScanner_ = datos.data()['idUsuarioScanner']?? null;;
      final idShop_ = datos.data()['idShop']?? null;;
      final nameUser_ = datos.data()['nameUser']?? null;;
      final nameShop_ = datos.data()['nameShop']?? null;;
      final nameService_ = datos.data()['nameService']?? null;;
      final comentarios_ = datos.data()['comentarios']?? null;;
      final createNotaFinish_ = datos.data()['createNotaFinish']?? null;;
      
     

      NotaModel usuariomodel = NotaModel(
        idNota:idNota_,
        idUsuarioScanner: idUsuarioScanner_,
        idShop:idShop_,
        nameUser:nameUser_,
        nameShop: nameShop_,
        nameService:nameService_,
        comentarios:comentarios_,

        createNotaFinish: createNotaFinish_== null ? null :createNotaFinish_.toDate(),

       
      );
 iconmodelLits.add(usuariomodel);
}
      return iconmodelLits;
     }


     Map<String, dynamic> toJsonBody(idNota,idUsuarioScanner,idShop,nameUser,nameShop,nameService,comentarios,createNotaFinish) =>
          {
            'idNota': idNota,
            'idUsuarioScanner': idUsuarioScanner,
            'idShop': idShop,
            'nameUser': nameUser,
            'nameShop':nameShop,
            'nameService':nameService,
            'comentarios':comentarios,
            'createNotaFinish':createNotaFinish,
            
          };

}