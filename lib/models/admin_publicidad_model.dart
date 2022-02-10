class AdminModel{
  String idPublicidad;
  String idUserAdmin;
  String imagenPublicidad;

  String urlPublicidad;

  String nombreFormulario;
  String telefonoFormulario;
  String correoFormulario;
  String comentarioFormulario;
  String urlFormulario;

  String urlTienda;

  int typePublicidad;
  DateTime createPublicidad;

  AdminModel({this.idPublicidad, this.idUserAdmin, this.imagenPublicidad, this.urlPublicidad, this.nombreFormulario,this.telefonoFormulario,this.correoFormulario,this.comentarioFormulario,this.urlFormulario, this.urlTienda,this.typePublicidad,this.createPublicidad});



    
   List  <AdminModel> getTienda(dynamic miInfo){
      List<AdminModel>iconmodelLits=[];

for(var datos in miInfo){
      final idPublicidad_ = datos.data()['idPublicidad'] ?? null;;
      final idUserAdmin_ = datos.data()['idUserAdmin'] ?? null;;
      final imagenPublicidad_ = datos.data()['imagenPublicidad'] ?? null;;
      final urlPublicidad_ = datos.data()['urlPublicidad'] ?? null;;
      final nombreFormulario_ = datos.data()['nombreFormulario']?? null;
      final telefonoFormulario_ = datos.data()['telefonoFormulario'] ?? null;;
      final correoFormulario_ = datos.data()['correoFormulario'] ?? null;;
      final comentarioFormulario_ = datos.data()['comentarioFormulario'] ?? null;;
      final urlFormulario_ = datos.data()['urlFormulario'] ?? null;;
      final urlTienda_ = datos.data()['urlTienda'] ?? null;;
      final typePublicidad_ = datos.data()['typePublicidad']??null;;
      final createPublicidad_ = datos.data()['createPublicidad'] ?? null;;

      
     

      AdminModel usuariomodel = AdminModel(
        idPublicidad:idPublicidad_,
        idUserAdmin: idUserAdmin_,
        imagenPublicidad: imagenPublicidad_== null?null:imagenPublicidad_.toString(),
        urlPublicidad: urlPublicidad_,
        nombreFormulario: nombreFormulario_,
        telefonoFormulario:telefonoFormulario_,
        correoFormulario:correoFormulario_,
        comentarioFormulario:comentarioFormulario_,
        urlFormulario:urlFormulario_,
        urlTienda:urlTienda_,
        typePublicidad:typePublicidad_,
        createPublicidad: createPublicidad_== null ? null :createPublicidad_.toDate(),
       
      );
 iconmodelLits.add(usuariomodel);
}
      return iconmodelLits;
     }


     Map<String, dynamic> toJsonBodyUrl(idPublicidad,idUserAdmin,imagenPublicidad,urlPublicidad,nombreFormulario,telefonoFormulario,correoFormulario,comentarioFormulario, urlFormulario, urlTienda,        typePublicidad,createPublicidad) =>
          {
            'idPublicidad': idPublicidad,
            'idUserAdmin': idUserAdmin,
            'imagenPublicidad': imagenPublicidad,
            'urlPublicidad':urlPublicidad,
            'nombreFormulario':nombreFormulario,
            'telefonoFormulario':telefonoFormulario,
            'correoFormulario':correoFormulario,
            'comentarioFormulario':comentarioFormulario,
            'urlFormulario':urlFormulario,
            'urlTienda':urlTienda,
            'typePublicidad':typePublicidad,
            'createPublicidad':createPublicidad,
            
          };

}