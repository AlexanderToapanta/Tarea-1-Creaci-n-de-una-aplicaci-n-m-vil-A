import 'package:flutter/material.dart';
import '../controller/num_perfecto_controller.dart';

//ATOMOS

class Label extends StatelessWidget {
  final String text;
  Label(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.indigo,
    ),
  );
}

class NumberField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  NumberField({required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  PrimaryButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) =>
      ElevatedButton(
        onPressed: onPressed,
        child: Text(text),
      );
}

//MOLECULA

class NumeroInput extends StatelessWidget {
  final TextEditingController controller;

  NumeroInput({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: NumberField(
        controller: controller,
        hint: "Ingrese un número",
      ),
    );
  }
}

//ORGANISMO

class NumPerfectoCard extends StatefulWidget {
  @override
  State<NumPerfectoCard> createState() => _NumPerfectoCardState();
}

class _NumPerfectoCardState extends State<NumPerfectoCard> {

  final _ctrlNumero = TextEditingController();
  final _controller = NumPerfectoController();

  String _resultado = "";

  void _verificar() {
    final r = _controller.verificarNumero(_ctrlNumero.text);

    setState(() {
      _resultado = r["mensaje"];
    });
  }

  @override
  void dispose() {
    _ctrlNumero.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Label("Número Perfecto"),
            NumeroInput(controller: _ctrlNumero),
            SizedBox(height: 10),
            PrimaryButton(
              text: "Verificar",
              onPressed: _verificar,
            ),
            if (_resultado.isNotEmpty) ...[
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 10),
              Text(
                _resultado,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ]
          ],
        ),
      ),
    );
  }
}

class NumPerfectoPage extends StatelessWidget {
  NumPerfectoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Número Perfecto"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: NumPerfectoCard(),
        ),
      ),
    );
  }
}