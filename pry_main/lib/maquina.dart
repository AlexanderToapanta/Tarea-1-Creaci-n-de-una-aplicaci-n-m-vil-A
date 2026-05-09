import 'package:flutter/material.dart';

class Maquina extends StatefulWidget{
  @override
  MaquinaState createState()=> MaquinaState();
}


class MaquinaState extends State<Maquina> {
TextEditingController precio=TextEditingController();
TextEditingController cantidad=TextEditingController();
double a=0;
double b=0;
double total=0;
double suelto=0;
String resultado='Su vuelto es';

void ingresar(){
  a=double.tryParse(precio.text)??0;
  b=double.tryParse(cantidad.text)??0;
  total= a*b;
}

void calcular(){
  ingresar();
  suelto = 0;

  setState(() {
    resultado = "Su vuelto es ${sumatoria()}";
  });
}

double sumatoria() {
  if (suelto >= total) return suelto;

  double restante = total - suelto;

  if (restante >= 2) {
    suelto += 2;
    return sumatoria();
  }
  else if (restante >= 1) {
    suelto += 1;
    return sumatoria();
  }
  else if (restante >= 0.50) {
    suelto += 0.50;
    return sumatoria();
  }
  else if (restante >= 0.25) {
    suelto += 0.25;
    return sumatoria();
  }
  else if (restante >= 0.10) {
    suelto += 0.10;
    return sumatoria();
  }

  return suelto;
}

void limpiar(){
  setState(() {
    precio.clear();
    cantidad.clear();
    resultado='Su vuelto es';
  });
}

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Maquina de sueltos'),
       backgroundColor: Colors.green,
     ),
     body: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         TextField(
           controller: precio,
           keyboardType: TextInputType.number,
           decoration: InputDecoration(
             labelText: 'Precio',
             border: OutlineInputBorder()
           ),
         ),
         SizedBox(height: 20,),
         TextField(
           controller: cantidad,
           keyboardType: TextInputType.number,
           decoration: InputDecoration(
               labelText: 'cantidad',
               border: OutlineInputBorder()
           ),
         ),
         ElevatedButton(onPressed: calcular, child:Text('Calcular')),
         SizedBox(height: 10,),
         ElevatedButton(onPressed: limpiar, child:Text('Limpiar')),
         Text(
           resultado,
           style: TextStyle(
             fontSize: 30,
             fontWeight: FontWeight.bold
           ),
         ),
       ],
     ),
   );
  }




}