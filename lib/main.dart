
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:z04_app_reservas_firebase/home.dart';
import 'package:z04_app_reservas_firebase/inicio/timer.dart';
import 'package:z04_app_reservas_firebase/logins/loginss.dart';



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicacion Basica',
      debugShowCheckedModeBanner:false,
      home: Timer(),
    );
  }
}