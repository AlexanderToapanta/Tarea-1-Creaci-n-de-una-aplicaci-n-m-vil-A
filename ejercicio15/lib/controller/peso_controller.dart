import '../model/peso_model.dart';

class PesoController {

  String procesarPersona(
      String nombre,
      String pesoAnteriorString,
      List<String> pesosString,
      ) {

    if (nombre.isEmpty) {
      return 'Ingrese el nombre';
    }

    if (pesoAnteriorString.isEmpty) {
      return 'Ingrese el peso anterior';
    }

    double? pesoAnterior = double.tryParse(pesoAnteriorString);

    if (pesoAnterior == null || pesoAnterior <= 0) {
      return 'Peso anterior inválido';
    }

    List<double> pesos = [];

    for (String peso in pesosString) {

      if (peso.isEmpty) {
        return 'Complete los 10 pesos';
      }

      double? valor = double.tryParse(peso);

      if (valor == null || valor <= 0) {
        return 'Ingrese pesos válidos';
      }

      pesos.add(valor);
    }

    Map<String, dynamic> resultado =
    PesoModel.calcularPeso(nombre, pesos, pesoAnterior);

    PesoModel.agregarPersona(resultado);

    return '${resultado['nombre']} ${resultado['estado']} '
        '${resultado['diferencia'].toStringAsFixed(2)} kg';
  }

  List<Map<String, dynamic>> obtenerResultados() {
    return PesoModel.obtenerPersonas();
  }

  void limpiar() {
    PesoModel.limpiarDatos();
  }
}