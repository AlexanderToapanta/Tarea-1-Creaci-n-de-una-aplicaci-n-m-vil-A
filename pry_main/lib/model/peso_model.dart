class PesoModel {
  static List<Map<String, dynamic>> personas = [];

  static Map<String, dynamic> calcularPeso(
      String nombre,
      List<double> pesos,
      double pesoAnterior,
      ) {

    double promedio = pesos.fold(0.0, (sum, peso) => sum + peso) / pesos.length;

    double diferencia = promedio - pesoAnterior;

    String estado = diferencia > 0 ? "SUBIO" : "BAJO";

    return {
      'nombre': nombre,
      'promedio': promedio,
      'diferencia': diferencia.abs(),
      'estado': estado,
    };
  }

  static void agregarPersona(Map<String, dynamic> persona) {
    personas.add(persona);
  }

  static List<Map<String, dynamic>> obtenerPersonas() {
    return List.from(personas);
  }

  static void limpiarDatos() {
    personas.clear();
  }
}