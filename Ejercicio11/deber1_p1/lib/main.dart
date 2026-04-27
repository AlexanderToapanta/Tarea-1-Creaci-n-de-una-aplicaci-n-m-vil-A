import 'package:flutter/material.dart';
import 'view/cajero_view.dart';

void main() {
  runApp(const AppCajero());
}

class AppCajero extends StatelessWidget {
  const AppCajero({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Caja',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
      ),
      home: CajeroPage(),
    );
  }
}
