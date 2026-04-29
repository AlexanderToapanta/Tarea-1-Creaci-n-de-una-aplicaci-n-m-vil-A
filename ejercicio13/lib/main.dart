import 'package:flutter/material.dart';
import '../view/anio_view.dart';

void main(){
  runApp(MiApp());
}

class MiApp extends StatelessWidget{
 @override
  Widget build(BuildContext context){
   return MaterialApp(
     debugShowCheckedModeBanner:false,
     title: 'Anio Bisiesto',
     theme: ThemeData(primaryColor: Colors.deepOrange),
     home: Bisiesto(),
   );
 }

}
