import 'package:flutter/material.dart';
import 'view/peso_view.dart';

void main() {
  runApp(const AppPeso());
}

class AppPeso extends StatelessWidget {
  const AppPeso({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Control de Peso',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: PesoPage(),
    );
  }
}