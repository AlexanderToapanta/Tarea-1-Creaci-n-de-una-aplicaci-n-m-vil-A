import '../model/num_perfecto_model.dart';

class NumPerfectoController {

  Map<String, dynamic> verificarNumero(String input) {

    if (input.isEmpty) {
      return {"mensaje": "Ingrese un número", "esPerfecto": null};
    }

    int? n = int.tryParse(input);

    if (n == null || n <= 0) {
      return {"mensaje": "Ingrese un número entero positivo válido", "esPerfecto": null};
    }

    final r = NumPerfectoModel.esPerfecto(n);

    if (r["esPerfecto"]) {
      return {
        "esPerfecto": true,
        "mensaje": "${r["numero"]} es PERFECTO\n"
            "Divisores: ${r["divisores"]}\n"
            "Suma: ${r["suma"]}"
      };
    } else {
      return {
        "esPerfecto": false,
        "mensaje": "${r["numero"]} NO es perfecto\n"
            "Divisores: ${r["divisores"]}\n"
            "Suma: ${r["suma"]}"
      };
    }
  }
}