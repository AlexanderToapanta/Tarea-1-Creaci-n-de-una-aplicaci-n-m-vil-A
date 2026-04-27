class CajeroModel {
  static List<double> transacionesDelDia = [];
  static double totalDiaAcumulado = 0;

 
  static double agregarPrecio(double precio) {
    if (precio > 0) {
      transacionesDelDia.add(precio);
    }
    return calcularTotalActual();
  }


  static double calcularTotalActual() {
    return transacionesDelDia.fold(0.0, (sum, precio) => sum + precio);
  }


  static List<double> obtenerArticulosActuales() {
    return List.from(transacionesDelDia);
  }

  
  static Map<String, dynamic> cobrarCliente() {
    double totalCobrado = calcularTotalActual();
    int cantidadArticulos = transacionesDelDia.length;

    Map<String, dynamic> resultado = {
      'totalCobrado': totalCobrado,
      'cantidadArticulos': cantidadArticulos,
    };

    if (totalCobrado > 0) {
      totalDiaAcumulado += totalCobrado;
    }

    transacionesDelDia.clear();
    return resultado;
  }

 
  static double obtenerTotalDelDia() {
    return totalDiaAcumulado;
  }

  
  static void nuevoCliente() {
    transacionesDelDia.clear();
  }

  
  static void resetearDelDia() {
    totalDiaAcumulado = 0;
    transacionesDelDia.clear();
  }
}
