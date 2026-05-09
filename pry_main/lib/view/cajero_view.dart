import 'package:flutter/material.dart';
import '../controller/cajero_controller.dart';

//atomos
class Label extends StatelessWidget {
  final String text;
  final double fontSize;
  Label(this.text, {super.key, this.fontSize = 20});

  @override
  Widget build(BuildContext context) =>
      Text(text, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold));
}

class PriceField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  PriceField({super.key, required this.controller, required this.hint});

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    keyboardType: TextInputType.number,
    decoration: InputDecoration(labelText: hint, border: OutlineInputBorder()),
  );
}

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  PrimaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) => ElevatedButton(
    onPressed: onPressed,
    child: Text(text),
  );
}

class ResultText extends StatelessWidget {
  final String text;
  ResultText(this.text, {super.key});

  @override
  Widget build(BuildContext context) =>
      Text(text, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500));
}

//molecula
class PrecioInput extends StatelessWidget {
  final TextEditingController precioC;
  final VoidCallback onAdd;
  PrecioInput({super.key, required this.precioC, required this.onAdd});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(child: PriceField(controller: precioC, hint: "Precio")),
      SizedBox(width: 10),
      PrimaryButton(text: "Agregar", onPressed: onAdd),
    ],
  );
}

class ArticuloItem extends StatelessWidget {
  final int numero;
  final double precio;
  ArticuloItem({super.key, required this.numero, required this.precio});

  @override
  Widget build(BuildContext context) => ListTile(
    leading: CircleAvatar(child: Text('$numero')),
    title: Text('Artículo #$numero'),
    trailing: Text('\$${precio.toStringAsFixed(2)}',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green)),
  );
}

//organismo
class CajeroCard extends StatefulWidget {
  const CajeroCard({super.key});

  @override
  State<CajeroCard> createState() => _CajeroCardState();
}

class _CajeroCardState extends State<CajeroCard> {
  final precioC = TextEditingController();
  final controller = CajeroController();
  String mensaje = '';
  String totalDia = 'Total del día: \$0.00';

  void _agregarPrecio() {
    setState(() {
      mensaje = controller.procesarPrecio(precioC.text);
    });
    precioC.clear();
  }

  void _cobrarCliente() {
    setState(() {
      mensaje = controller.cobrarCliente();
      totalDia = controller.obtenerTotalDelDia();
    });
  }

  void _nuevoCliente() {
    setState(() {
      precioC.clear();
      mensaje = '';
      controller.nuevoCliente();
    });
  }

  @override
  void dispose() {
    precioC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
            Label("Caja del Supermercado"),
            SizedBox(height: 16),
            PrecioInput(precioC: precioC, onAdd: _agregarPrecio),
            SizedBox(height: 16),
            if (mensaje.isNotEmpty) ResultText(mensaje),
            SizedBox(height: 16),
            Divider(),
            Label("Artículos", fontSize: 16),
            SizedBox(height: 12),
            if (controller.obtenerArticulos().isNotEmpty)
              Column(
                children: List.generate(
                  controller.obtenerArticulos().length,
                  (i) => ArticuloItem(
                    numero: i + 1,
                    precio: controller.obtenerArticulos()[i],
                  ),
                ),
              )
            else
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: ResultText("Sin artículos"),
              ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ResultText(controller.obtenerTotalCliente()),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PrimaryButton(text: "Cobrar Cliente", onPressed: _cobrarCliente),
                PrimaryButton(text: "Nuevo Cliente", onPressed: _nuevoCliente),
              ],
            ),
            SizedBox(height: 20),
            Divider(),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.purple.shade50,
                borderRadius: BorderRadius.circular(8),
              ),
              child: ResultText(totalDia),
            ),
          ],)
        ),
      ),
    );
  }
}

//page
class CajeroPage extends StatelessWidget {
  CajeroPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Sistema de Caja"),
      backgroundColor: Colors.deepPurple,
    ),
    body: Padding(
      padding: EdgeInsets.all(10),
      child: CajeroCard(),
    ),
  );
}
