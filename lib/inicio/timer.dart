import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/firebase/authenticatio.dart';
import 'package:z04_app_reservas_firebase/firebase/fetch_data.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/logins/loginss.dart';
import 'package:z04_app_reservas_firebase/models/usuario_models.dart';

class Timer extends StatefulWidget {
  Timer({Key key}) : super(key: key);

  @override
  _TimerState createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  void getCurrentUser() async{
    int status=0;
    var user = await Authentication().getCurrentUser();
    if (user != null) {
     UsuarioModel adminmodel = await FetchData().getAdmin(user.uid);

    if(adminmodel!=null){
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home1(adminmodel,status)));
    }
    }
    else{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
    }
  }

  @override
  void initState() {
    getCurrentUser();
    // TODO: implement initState
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue[900],
        child: Container(
          height: 200,
          width: 400,
          child: Center(child: Image.asset("assets/31.png"))),),
    );
  }
}