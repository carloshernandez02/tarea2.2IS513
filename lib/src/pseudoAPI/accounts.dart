import 'package:app_login/src/pseudoAPI/class_objects/cuenta.dart';

final Cuenta cuentadef = Cuenta(correo: 'cahernandezn@unah.hn', nombre: 'Carlos', numero: '96268539', pwd: 'nights!young');

class CuentaManager {
  // Private constructor for singleton pattern
  CuentaManager._privateConstructor();

  static final CuentaManager _instance = CuentaManager._privateConstructor();

  // The map holding Cuenta objects, where key is correo
  Map<String, Cuenta> cuentaMap = {
    cuentadef.correo : cuentadef,
  };

  // Public factory method to get the singleton instance
  factory CuentaManager() {
    return _instance;
  }

  // Method to add or update a Cuenta
  void addCuenta(Cuenta cuenta) {
    cuentaMap[cuenta.correo] = cuenta;
  }

  // Method to print the map
  void printCuentas() {
    cuentaMap.forEach((key, value) {
      print('Key (Correo): $key');
      value.printCuenta();
    });
  }
}
