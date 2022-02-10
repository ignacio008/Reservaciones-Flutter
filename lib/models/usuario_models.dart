import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

class UsuarioModel{
  String idUsuario;
  String name;
  String lastName;
  DateTime dateOfBirday;
  String numberPhone;
  DateTime createdAtShop;
 	DateTime updateAtShop;
	String state;
	String city;
  String myToken;
  int admin;

  UsuarioModel({this.idUsuario,this.name,this.lastName,this.dateOfBirday,this.numberPhone,this.createdAtShop,this.updateAtShop,this.state,this.city, this.myToken, this.admin});

  
     UsuarioModel getUsuario(dynamic miInfo){
      final idUsuario_ = miInfo.data()['idUsuario'];
      final name_ = miInfo.data()['name'];
      final lastName_ = miInfo.data()['lastName'];
      final dateOfBirday_ = miInfo.data()['dateOfBirday']?? null;
      final numberPhone_ = miInfo.data()['numberPhone'];
      final createdAtShop_ =miInfo.data()['createdAtShop']?? null;
      final updateAtShop_ = miInfo.data()['updateAtShop']?? null;
      final state_ = miInfo.data()['state']?? null;
      final city_ = miInfo.data()['city']?? null;
      final myToken_ = miInfo.data()['myToken']?? null;
      final admin_ = miInfo.data()['admin']?? null;


      UsuarioModel usuariomodel = UsuarioModel(
        idUsuario: idUsuario_,
        name: name_,
        lastName: lastName_,
        dateOfBirday: dateOfBirday_ == null ? null :dateOfBirday_.toDate(),
        numberPhone: numberPhone_,
        createdAtShop: createdAtShop_== null ? null :createdAtShop_.toDate(),
        updateAtShop: updateAtShop_== null ? null :updateAtShop_.toDate(),
        state:state_,
        city:city_,
        myToken:myToken_,
        admin:admin_,
      );

      return usuariomodel;
     }

  



      Map<String, dynamic> toJsonBody(idUsuario,name,lastName,dateOfBirday,numberPhone,createdAtShop,state,city,myToken,admin) =>
          {
            'idUsuario': idUsuario,
            'name': name,
            'lastName':lastName,
            'dateOfBirday':dateOfBirday,
            'numberPhone':numberPhone,
            'createdAtShop':createdAtShop,
           
            'state':state,
            'city':city,
            'myToken':myToken,
            'admin':admin,


          };
            Map<String, dynamic> toJsonBodyActualizar(idUsuario,name,lastName,dateOfBirday,numberPhone,updateAtShop) =>
          {
            'idUsuario': idUsuario,
            'name': name,
            'lastName':lastName,
            'dateOfBirday':dateOfBirday,
            'numberPhone':numberPhone,
            'updateAtShop':updateAtShop,
           

          };
             Map<String, dynamic> toJsonBodyActualizarToken(idUsuario,name,lastName, myToken) =>
          {
            'idUsuario': idUsuario,
            'name': name,
            'lastName':lastName,
            'myToken':myToken,
           

          };
}