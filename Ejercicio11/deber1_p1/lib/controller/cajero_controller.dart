import '../model/cajero_model.dart';

class CajeroController {

  String procesarPrecio(String precioString) {
    // Validar que no esté vacío
    if (precioString.isEmpty) {
      return 'Por favor ingrese un precio';
    }

    
    double? precio = double.tryParse(precioString);

   
    if (precio == null) {
      return 'Por favor ingrese un número válido';
    }

    
    if (precio <= 0) {
      return 'El precio debe ser mayor a 0';
    }


    CajeroModel.agregarPrecio(precio);
    return 'Precio agregado: \$${precio.toStringAsFixed(2)}';
  }


  String obtenerTotalCliente() {
    double total = CajeroModel.calcularTotalActual();
    int cantidad = CajeroModel.obtenerArticulosActuales().length;
    return 'Total: \$${total.toStringAsFixed(2)} ($cantidad artículos)';
  }


  List<double> obtenerArticulos() {
    return CajeroModel.obtenerArticulosActuales();
  }


  String cobrarCliente() {
    Map<String, dynamic> resultado = CajeroModel.cobrarCliente();
    double totalCobrado = resultado['totalCobrado'];
    int cantidadArticulos = resultado['cantidadArticulos'];

    if (totalCobrado == 0) {
      return 'No hay artículos que cobrar';
    }

    return 'Cliente cobrado: \$${totalCobrado.toStringAsFixed(2)}\n$cantidadArticulos artículos';
  }

  
  String obtenerTotalDelDia() {
    double total = CajeroModel.obtenerTotalDelDia();
    return 'Total del día: \$${total.toStringAsFixed(2)}';
  }

 
  void nuevoCliente() {
    CajeroModel.nuevoCliente();
  }


  void resetearDelDia() {
    CajeroModel.resetearDelDia();
  }
}
