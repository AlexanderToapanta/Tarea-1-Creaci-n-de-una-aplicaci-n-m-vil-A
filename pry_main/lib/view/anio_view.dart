import "package:flutter/material.dart";
import "../controller/anio_controller.dart";

//Atomos
class Label extends StatelessWidget{
  final String text;
  Label({required this.text, super.key});
  @override
  Widget build(BuildContext context)=>Text(text, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
}

class NumberFiled extends StatelessWidget{
  final TextEditingController controller;
  final String hint;
  NumberFiled({required this.controller, required this.hint, super.key});

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10)
        )
        )
      );
}

class Button extends StatelessWidget{
final String text;
final VoidCallback onPressed;
Button({required this.text, required this.onPressed, super.key});
@override
Widget build(BuildContext context) => ElevatedButton(
onPressed: onPressed,
child: Text(text)
);
}

//molecula


class AniobBisiesto extends StatefulWidget{
  AniobBisiesto({super.key});

  @override
  State<AniobBisiesto> createState() => _AniobBisiestoState();
}

class _AniobBisiestoState extends State<AniobBisiesto> {
  final _anioController = TextEditingController();
  final _aniobBisiestoController = AniobBisiesto_controller();
  String _resultado = '';
  void calcular() {
    setState(() {
      _resultado = _aniobBisiestoController.procesar(_anioController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Label(text: 'Ingrese el año'),
            SizedBox(height: 20),
            NumberFiled(controller: _anioController, hint: 'Año'),
            SizedBox(height: 20,),
            Button(text: 'Calcular', onPressed: calcular),
            SizedBox(height: 25,),
            Label(text: _resultado)
            ]
        )
      )
    );
  }
}

class Bisiesto extends StatelessWidget{
  Bisiesto({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Año Bisiesto'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(10),

        child: AniobBisiesto(),
      ),
    );
  }
}

