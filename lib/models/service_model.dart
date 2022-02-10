class Service{
  String idShop;
  String idService;
  String nameService; 
  String descriptionService;
  DateTime createdAtService;
  DateTime updateAtService;
 	int durationService;
  String imageService;
  String idUserShop;

  Service({this.idShop, this.idService, this.nameService, this.descriptionService, this.createdAtService,this.updateAtService,this.durationService,this.imageService,this.idUserShop});



     List  <Service> getServicees(dynamic miInfo){
      List<Service>iconmodelLits=[];

      
for(var datos in miInfo){
      final idShop_ = datos.data()['idShop'];
      final idService_ = datos.data()['idService'];
      final nameService_ = datos.data()['nameService'];
      final descriptionService_ = datos.data()['descriptionService']?? null;;
      final createdAtService_ = datos.data()['createdAtService']?? null;
      final updateAtService_ = datos.data()['updateAtService']?? null;;
      final durationService_ = datos.data()['durationService']?? null;;
      final imageService_ = datos.data()['imageService']?? null;;
      final idUserShop_ = datos.data()['idUserShop']?? null;;
     
     

      Service servicemodel = Service(
        idShop:idShop_,
        idService: idService_,
        nameService: nameService_,
        descriptionService: descriptionService_,
        createdAtService: createdAtService_== null ? null :createdAtService_.toDate(),
        updateAtService: updateAtService_== null ? null :updateAtService_.toDate(),
        durationService:durationService_,
        imageService: imageService_ == null ? null :imageService_.toString(),
        idUserShop:idUserShop_==null ? null : idUserShop_.toString(),
      
      );
 iconmodelLits.add(servicemodel);
}
      return iconmodelLits;
     }

    Map<String, dynamic> toJsonBody(idService,idShop,nameService,descriptionService,durationService,createdAtService,imageService,idUserShop) =>
          {
            'idService': idService,
            'idShop': idShop,
            'nameService': nameService,
            'descriptionService':descriptionService,
            'durationService':durationService,
            'createdAtService':createdAtService,
            'imageService':imageService,
            'idUserShop':idUserShop,
            
          };


       Map<String, dynamic> toJsonBodyUpdateService(nameService,descriptionService,durationService,updateAtService,imageService,) =>
          {
            'nameService': nameService,
            'descriptionService':descriptionService,
            'durationService':durationService,
            'updateAtService':updateAtService,
            'imageService':imageService,
            
          };

     
  
}