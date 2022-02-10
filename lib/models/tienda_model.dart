

class TiendaModel{

  String idShop;
  String idUsuario;
  String nameShop;
  String descriptionShop;
  String imagenTienda;
  String category;
  double lat;
  double long;
   List entrada;
   List salida;
   String createBy;
   String numberPhone;
   DateTime createAtShop;
   DateTime updateAtShop;
   int favorite;
   String shopToken;
  TiendaModel({this.idShop,this.idUsuario,this.nameShop,this.descriptionShop,this.imagenTienda,this.category, this.lat,this.long,this.entrada,this.salida,this.createBy, this.numberPhone, this.updateAtShop,this.createAtShop,this.shopToken});


  
   List  <TiendaModel> getTienda(dynamic miInfo){
      List<TiendaModel>iconmodelLits=[];

for(var datos in miInfo){
      final idShop_ = datos.data()['idShop'];
      final idUsuario_ = datos.data()['idUsuario'];
      final nameShop_ = datos.data()['nameShop'];
      final descriptionShop_ = datos.data()['descriptionShop'];
      final imagenTienda_ = datos.data()['imagenTienda']?? null;
      final category_ = datos.data()['category'];
      final createBy_ = datos.data()['createBy'];
      final numberPhone_ = datos.data()['numberPhone'];
      final entrada_ = datos.data()['entrada'];
      final salida_ = datos.data()['salida']??null;
      final lat_ = datos.data()['lat'] ?? null;
      final long_ = datos.data()['long'] ?? null;
      final updateAtShop_ = datos.data()['updateAtShop']?? null;
      final createAtShop_ = datos.data()['createAtShop']?? null;
      
      final shopToken_ = datos.data()['shopToken']?? null;
     

      TiendaModel usuariomodel = TiendaModel(
        idShop:idShop_,
        idUsuario: idUsuario_,
        nameShop: nameShop_,
        descriptionShop: descriptionShop_,
        imagenTienda: imagenTienda_ == null ? null :imagenTienda_.toString(),
        category:category_,
        lat:lat_== null ? null : lat_,
        long:long_== null ? null : long_,
        createBy:createBy_,
        numberPhone:numberPhone_,
        entrada: entrada_== null ? null :entrada_.toList(),
        salida:salida_==null ? null :salida_.toList(),
        updateAtShop: updateAtShop_== null ? null :updateAtShop_.toDate(),
        createAtShop: createAtShop_== null ? null :createAtShop_.toDate(),
        shopToken:shopToken_== null?null:shopToken_.toString(),
       
      );
 iconmodelLits.add(usuariomodel);
}
      return iconmodelLits;
     }

      Map<String, dynamic> toJsonBody(idUsuario,idShop,nameShop,descriptionShop,imagenTienda,category,lat,long,createBy,numberPhone,entrada,salida,createAtShop,shopToken) =>
          {
            'idUsuario': idUsuario,
            'idShop': idShop,
            'nameShop': nameShop,
            'descriptionShop':descriptionShop,
            'imagenTienda':imagenTienda,
            'category':category,
            'lat':lat,
            'long':long,
            'createBy':createBy,
            'numberPhone':numberPhone,
            'entrada':entrada,
            'salida':salida,
            'createAtShop':createAtShop,
            'shopToken':shopToken
          };

          
      Map<String, dynamic> toJsonBodyActualizaImagen(imagenTienda) =>
          {       
            'imagenTienda':imagenTienda,          
          };

          Map<String, dynamic> toJsonBodyActualizaToken(shopToken) =>
          {       
            'shopToken':shopToken,          
          };
      
       Map<String, dynamic> toJsonBodyUpdateShopp(idShop,nameShop,descriptionShop,category,numberPhone,entrada,salida,updateAtShop) =>
          {
            'idShop': idShop,
            'nameShop': nameShop,
            'descriptionShop':descriptionShop,
            'category':category,
            'numberPhone':numberPhone,
            'entrada':entrada,
            'salida':salida,
            'updateAtShop':updateAtShop,
          };

            Map<String, dynamic> toJsonBodyActualizaMap(lat,long) =>
          {       
            'lat':lat,
            'long':long,       
          };
}