import 'package:app_login/src/Pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:app_login/src/Widgets/text_input_box.dart';
import 'package:app_login/src/Widgets/a_button.dart';
import 'package:app_login/src/pseudoAPI/accounts.dart';
import 'package:app_login/src/pseudoAPI/class_objects/cuenta.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final GlobalKey<FormState> _llaveFormulario = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _numberController = TextEditingController();
  final _confirmpwdController = TextEditingController();

  String? _validarNombre(String? value){
    if(value == null || value.isEmpty){
      return '*Campo Requerido';
    } else if(value.length < 3){
      return 'Nombre debe tener al menos 3 caracteres';
    } else {
      return null;
    }
  }

  String? _validarCorreo(String? value){
      if(value == null || value.isEmpty){
        return '*Campo Requerido';
      }
      final emailRegex = RegExp(r'^.+@(unah\.hn|unah\.edu\.hn)$');
      if (!emailRegex.hasMatch(value)) {
        return 'Por favor, ingrese un correo electrónico válido de UNAH';
      }else{
        return null;
      }
  }

  String? _validarNumero(String? value){
    if(value == null || value.isEmpty){
        return '*Campo Requerido';
    }
    RegExp regExp = RegExp(r'[93]\d{7}$');
    if(value.isEmpty){
      return '*Campo Requerido';
    } else if(!regExp.hasMatch(value)) { 
      return 'Numero debe empezar con 9 o 3';
    } else {
      return null;
    }
  }

  String? _validarPwd(String? value){
    if(value == null || value.isEmpty){
        return '*Campo Requerido';
    }
    if(value.length < 8){ 
      return 'La contraseña debe tener al menos 8 caracteres';
    } 
    final specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (!specialCharRegex.hasMatch(value)) {
      return 'La contraseña debe tener al menos 1 caracter especial';
    }else{
      return null;
    }
  }
  
  String? _validarConfirmPwd(String? value){
    if(value == null || value.isEmpty){
      return '*Campo Requerido';
    } else if(value != _passwordController.text){ 
      return 'Las contraseñas no coinciden';
    } else {
      return null;
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Creacion de cuenta'),
          backgroundColor: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _llaveFormulario,
              child: Card(
                shadowColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                child: ListView(
                  children:[
                
                    SizedBox(height: 16),
                
                    TextInputBox(
                      controller:_nameController, 
                      title: 'Nombre', 
                      preIcon: Icons.person, 
                      maxChars: 10, 
                      isLast: false,
                      validador: _validarNombre,
                    ),
                
                    SizedBox(height: 22),
                
                    TextInputBox(
                      controller: _emailController, 
                      title: 'Correo Institucional', 
                      keyboardType: TextInputType.emailAddress, 
                      preIcon: Icons.email, 
                      isLast: false,
                      isEmail: true,
                      validador: _validarCorreo,
                    ),
                
                    SizedBox(height: 22),
                
                    TextInputBox(
                      controller: _numberController, 
                      title: 'Numero de telefono', 
                      keyboardType: TextInputType.phone, 
                      preIcon: Icons.phone_android, 
                      maxChars: 8, 
                      minChars: 8,
                      isLast: false,
                      validador: _validarNumero,
                      ),
                
                    SizedBox(height: 22),
                
                    TextInputBox(
                      controller: _passwordController, 
                      title: 'Contraseña', 
                      keyboardType: TextInputType.visiblePassword, 
                      preIcon: Icons.lock_open_rounded,
                      isPassword: true,
                      minChars: 8,
                      isLast: false,
                      validador: _validarPwd,
                    ),
                
                    SizedBox(height: 22),
                
                    TextInputBox(
                      controller:_confirmpwdController, 
                      title: 'Confirme su contraseña', 
                      preIcon: Icons.lock_open_rounded,
                      isPassword: true,
                      validador: _validarConfirmPwd,

                    ),
                
                    SizedBox(height: 32),
                    
                    GreatButton(text: 'Crear cuenta', onPush: (){
                      if(_llaveFormulario.currentState!.validate()){
                        //formulario valido
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Formulario Valido')));
                        
                        CuentaManager().addCuenta(Cuenta(
                          correo: _emailController.text.toLowerCase(), 
                          nombre: _nameController.text, 
                          numero: _numberController.text, 
                          pwd: _passwordController.text
                        ));
                        CuentaManager().cuentaMap[_emailController.text]!.printCuenta();
                        Navigator.pop(context);
                        
                      }else{
                        //formulario invalido
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Hay valores invalidos, favor verifiquelos y vuelva a intentar')));
                      }
                    },),
                  ],
                ),
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
    );
  }
}