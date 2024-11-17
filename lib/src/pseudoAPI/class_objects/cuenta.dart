// ignore_for_file: avoid_print

class Cuenta {
  final String correo, nombre, numero, pwd;

  Cuenta({
    required this.correo,
    required this.nombre,
    required this.numero,
    required this.pwd
    });
    
  void printCuenta(){
    print('Correo: ${this.correo}');
    print('Nombre: ${this.nombre}');
    print('Numero: ${this.numero}');
    print('Contraseña: ${this.pwd}');
  }
}