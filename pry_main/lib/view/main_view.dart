import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Universidad de las Fuerzas Armadas "ESPE"'),
        centerTitle: true,
        backgroundColor: Colors.green.shade700,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'Tarea 1.1',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Integrantes:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    Text('Erick Obando', style: TextStyle(fontSize: 16)),
                    Text('Alexander Topanta', style: TextStyle(fontSize: 16)),
                    Text('Alisson Ayo', style: TextStyle(fontSize: 16)),
                    Text('Josue Solano', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            BotonPantalla(
              Texto: 'Ejercicio 11',
              onPressed: () {
                Navigator.pushNamed(context, '/ejercicio11');
              },
            ),
            const SizedBox(height: 10),
            BotonPantalla(
              Texto: 'Ejercicio 12',
              onPressed: () {
                Navigator.pushNamed(context, '/ejercicio12');
              },
            ),
            const SizedBox(height: 10),
            BotonPantalla(
              Texto: 'Ejercicio 13',
              onPressed: () {
                Navigator.pushNamed(context, '/ejercicio13');
              },
            ),
            const SizedBox(height: 10),
            BotonPantalla(
              Texto: 'Ejercicio 14',
              onPressed: () {
                Navigator.pushNamed(context, '/ejercicio14');
              },
            ),
            const SizedBox(height: 10),
            BotonPantalla(
              Texto: 'Ejercicio 15',
              onPressed: () {
                Navigator.pushNamed(context, '/ejercicio15');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BotonPantalla extends StatelessWidget {
  final VoidCallback onPressed;
  final String Texto;
  const BotonPantalla({super.key, required this.onPressed, required this.Texto});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(Texto),
    );
  }
}
