import 'package:app_login/src/pseudoAPI/class_objects/cuenta.dart';

final Cuenta cuentadef = Cuenta(correo: 'cahernandezn@unah.hn', nombre: 'Carlos', numero: '96268539', pwd: 'nights!young');

class CuentaManager {

  CuentaManager._privateConstructor();

  static final CuentaManager _instance = CuentaManager._privateConstructor(); 

  
  Map<String, Cuenta> cuentaMap = { //mapa de cuentas donde la llave es el correo y el valor es la instancia de cuenta
    cuentadef.correo : cuentadef,
  };

  
  factory CuentaManager() {
    return _instance;
  }

  void addCuenta(Cuenta cuenta) { //metodo para agregar cuentas
    cuentaMap[cuenta.correo] = cuenta;
  }

}
