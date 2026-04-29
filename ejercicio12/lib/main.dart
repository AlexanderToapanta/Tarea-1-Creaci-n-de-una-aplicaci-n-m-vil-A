import 'package:flutter/material.dart';
import 'maquina.dart';
void main(){
  runApp(MiApp());
}

class MiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MAquina Sueltos',
      theme: ThemeData(primaryColor: Colors.greenAccent),
      home: Maquina(),
    );
  }
}

