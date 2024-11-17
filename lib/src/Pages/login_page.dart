// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:app_login/src/Pages/home_page.dart';
import 'package:app_login/src/Pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:app_login/src/Widgets/text_input_box.dart';
import 'package:app_login/src/Widgets/a_button.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _controller = TextEditingController();
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
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children:[

                SizedBox(height: 16),

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

                TextInputBox(controller: _controller, title: 'Correo Institucional', keyboardType: TextInputType.emailAddress, preIcon: Icons.email, isLast: false,),

                SizedBox(height: 22),

                TextInputBox(controller: _passwordController, title: 'Contraseña', keyboardType: TextInputType.visiblePassword, preIcon: Icons.lock_open_rounded, isLast: true),

                SizedBox(height: 22),
                
                GreatButton(text: 'Iniciar Sesion', onPush: (){
                  //TODO: verificar input de las credenciales
                  
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
                },),

                SizedBox(height: 12),

                Center(child: Text('¿No estas registrado?', style:TextStyle(fontSize: 12, fontWeight: FontWeight.w200, fontStyle: FontStyle.italic))),

                SizedBox(height: 12),
                
                GreatButton(text: 'Crear Cuenta', onPush: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterPage()));
                },),
              ],
            ),
          ),
        ),
    );
  }
}

