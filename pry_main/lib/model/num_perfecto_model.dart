class NumPerfectoModel {

  static Map<String, dynamic> esPerfecto(int n) {
    int suma = 0;
    List<int> divisores = [];

    for (int i = 1; i < n; i++) {
      if (n % i == 0) {
        suma += i;
        divisores.add(i);
      }
    }

    bool esPerfecto = suma == n;

    return {
      "numero": n,
      "divisores": divisores,
      "suma": suma,
      "esPerfecto": esPerfecto
    };
  }
}