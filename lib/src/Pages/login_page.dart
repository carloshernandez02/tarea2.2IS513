// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:app_login/src/Widgets/text_input_box.dart';
import 'package:app_login/src/Widgets/a_button.dart';
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Image(image: AssetImage('assets/pictures/logo-carrera-ingenieria-en-sistemas.png')),
          title: Text('Inicio de sesion'),
          backgroundColor: Colors.lightBlueAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children:[

                SizedBox(height: 32),

                Center(
                  child: Text('Ingrese sus credenciales',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 24,
                  ),
                  ),
                ),
                SizedBox(height: 32),

                TextInputBox(userController: _userController, title: 'Correo Institucional', keyboardType: TextInputType.emailAddress,),

                SizedBox(height: 22),

                TextInputBox(userController: _passwordController, title: 'Contraseña', keyboardType: TextInputType.visiblePassword,),

                SizedBox(height: 32),
                
                GreatButton(text: 'Iniciar Sesion'),

                SizedBox(height: 12),

                Center(child: Text('¿No estas registrado?', style:TextStyle(fontSize: 12, fontWeight: FontWeight.w200, fontStyle: FontStyle.italic))),

                SizedBox(height: 12),
                
                GreatButton(text: 'Crear Cuenta'),
              ],
            ),
          ),
        ),
    );
  }
}

