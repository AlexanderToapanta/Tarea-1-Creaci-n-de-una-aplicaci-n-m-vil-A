import 'package:flutter/material.dart';
import '../controller/peso_controller.dart';


//ATOMOS

class Label extends StatelessWidget {
  final String text;
  final double fontSize;

  const Label(this.text, {super.key, this.fontSize = 20});

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
    ),
  );
}

class InputField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const InputField({
    super.key,
    required this.controller,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: hint,
      border: OutlineInputBorder(),
    ),
  );
}

class NameField extends StatelessWidget {
  final TextEditingController controller;

  const NameField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: "Nombre",
      border: OutlineInputBorder(),
    ),
  );
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: onPressed,
    child: Text(text),
  );
}

class ResultText extends StatelessWidget {
  final String text;

  const ResultText(this.text, {super.key});

  @override
  Widget build(BuildContext context) => Text(
    text,
    style: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );
}


//MOLECULA

class PesoInputs extends StatelessWidget {

  final List<TextEditingController> controllers;

  const PesoInputs({super.key, required this.controllers});

  @override
  Widget build(BuildContext context) => GridView.builder(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: 10,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 3,
    ),
    itemBuilder: (context, index) => InputField(
      controller: controllers[index],
      hint: 'Peso ${index + 1}',
    ),
  );
}

class PersonaItem extends StatelessWidget {

  final Map<String, dynamic> persona;

  const PersonaItem({super.key, required this.persona});

  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      leading: CircleAvatar(
        child: Text(persona['nombre'][0]),
      ),
      title: Text(persona['nombre']),
      subtitle: Text(
        'Promedio: ${persona['promedio'].toStringAsFixed(2)} kg',
      ),
      trailing: Text(
        '${persona['estado']} ${persona['diferencia'].toStringAsFixed(2)} kg',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: persona['estado'] == 'SUBIO'
              ? Colors.red
              : Colors.green,
        ),
      ),
    ),
  );
}


//ORGANISMO

class PesoCard extends StatefulWidget {
  const PesoCard({super.key});

  @override
  State<PesoCard> createState() => _PesoCardState();
}

class _PesoCardState extends State<PesoCard> {

  final controller = PesoController();

  final nombreC = TextEditingController();
  final anteriorC = TextEditingController();

  final List<TextEditingController> pesosControllers =
  List.generate(10, (_) => TextEditingController());

  String mensaje = '';

  void _procesar() {

    List<String> pesos =
    pesosControllers.map((c) => c.text).toList();

    setState(() {
      mensaje = controller.procesarPersona(
        nombreC.text,
        anteriorC.text,
        pesos,
      );
    });
  }

  void _limpiar() {

    setState(() {

      nombreC.clear();
      anteriorC.clear();

      for (var c in pesosControllers) {
        c.clear();
      }

      mensaje = '';

      controller.limpiar();
    });
  }

  @override
  Widget build(BuildContext context) => Card(
    margin: EdgeInsets.all(16),
    child: Padding(
      padding: EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [

            Label("Control de Peso"),

            SizedBox(height: 20),

            NameField(controller: nombreC),

            SizedBox(height: 12),

            InputField(
              controller: anteriorC,
              hint: "Peso anterior",
            ),

            SizedBox(height: 20),

            Label("Pesos actuales", fontSize: 16),

            SizedBox(height: 10),

            PesoInputs(controllers: pesosControllers),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryButton(
                  text: "Procesar",
                  onPressed: _procesar,
                ),
                PrimaryButton(
                  text: "Limpiar",
                  onPressed: _limpiar,
                ),
              ],
            ),

            SizedBox(height: 20),

            if (mensaje.isNotEmpty)
              ResultText(mensaje),

            SizedBox(height: 20),

            Divider(),

            SizedBox(height: 10),

            Label("Resultados", fontSize: 16),

            SizedBox(height: 10),

            if (controller.obtenerResultados().isNotEmpty)
              Column(
                children: controller.obtenerResultados()
                    .map((persona) =>
                    PersonaItem(persona: persona))
                    .toList(),
              )
            else
              ResultText("Sin registros"),
          ],
        ),
      ),
    ),
  );
}


//PAGE

class PesoPage extends StatelessWidget {
  const PesoPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Club Contra la Obesidad"),
      backgroundColor: Colors.blue,
    ),
    body: Padding(
      padding: EdgeInsets.all(10),
      child: PesoCard(),
    ),
  );
}