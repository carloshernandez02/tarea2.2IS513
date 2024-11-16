import 'package:app_login/src/Pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:app_login/src/Widgets/text_input_box.dart';
import 'package:app_login/src/Widgets/a_button.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  final _controller = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _numberController = TextEditingController();
  final _confirmpwdController = TextEditingController();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            child: Card(
              shadowColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              child: ListView(
                children:[
              
                  SizedBox(height: 16),
              
                  TextInputBox(controller:widget._controller, title: 'Nombre', preIcon: Icons.person, maxLength: 10, isLast: false),
              
                  SizedBox(height: 22),
              
                  TextInputBox(controller: widget._emailController, title: 'Correo Institucional', keyboardType: TextInputType.emailAddress, preIcon: Icons.email, isLast: false),
              
                  SizedBox(height: 22),
              
                  TextInputBox(controller: widget._numberController, title: 'Numero de telefono', keyboardType: TextInputType.phone, preIcon: Icons.phone_android, maxLength: 8, isLast: false),
              
                  SizedBox(height: 22),
              
                  TextInputBox(controller: widget._passwordController, title: 'Contraseña', keyboardType: TextInputType.visiblePassword, preIcon: Icons.lock_open_rounded, isLast: false),
              
                  SizedBox(height: 22),
              
                  TextInputBox(controller:widget._confirmpwdController, title: 'Confirme su contraseña', preIcon: Icons.lock_open_rounded,),
              
                  SizedBox(height: 32),
                  
                  GreatButton(text: 'Crear cuenta', onPush: (){
                    //TODO: verificar input de las credenciales
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginPage()));
                  },),
                ],
              ),
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
    );
  }
}