import 'package:flutter/material.dart';
import 'view/main_view.dart';
import 'view/cajero_view.dart';
import 'maquina.dart';
import 'view/anio_view.dart';
import 'view/num_perfecto_page.dart';
import 'view/peso_view.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarea 1.1 - ESPE',
      initialRoute: '/',
      routes: {
        '/': (context) => const MainView(),
        '/ejercicio11': (context) => CajeroPage(),
        '/ejercicio12': (context) => Maquina(),
        '/ejercicio13': (context) => Bisiesto(),
        '/ejercicio14': (context) => NumPerfectoPage(),
        '/ejercicio15': (context) => PesoPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
    );
  }
}
