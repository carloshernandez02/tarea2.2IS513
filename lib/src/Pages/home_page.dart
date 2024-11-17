import 'package:flutter/material.dart';
import 'package:app_login/src/Widgets/item_lista.dart';
import 'package:app_login/src/pseudoAPI/class_objects/cuenta.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key,
  this.cuentaLog 
  });

  final Cuenta? cuentaLog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40.0, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Avatar and Info
            CircleAvatar(
              child: Icon(Icons.person),
              radius: 45
            ),
            SizedBox(height: 8),
            Text(
              cuentaLog!.nombre,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              cuentaLog!.correo,
              style: TextStyle(color: Colors.grey),
            ),

            SizedBox(height: 20,),
           
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Area Personal', style:
              TextStyle(color: const Color.fromARGB(113, 36, 36, 36))),
            ),
            SizedBox(height: 20,),
            Card(
              child: Column(
                children: [
                  ItemLista(textTitle: 'Mis Cursos', textNotification: '3', textDetail: 'Tareas Pendientes', icon: Icon(Icons.book_online_outlined), hasNotification: true,),

                  Divider(indent:10, endIndent: 10 ,height: 0,),
                  
                  ItemLista(textTitle: 'Archivo Personal', textNotification: '', textDetail: '', icon: Icon(Icons.cloud_circle_outlined), hasNotification: false,),

                  Divider(indent:10, endIndent: 10 ,height: 0,),

                  ItemLista(textTitle: 'Calendario', textNotification: '', textDetail: '', icon: Icon(Icons.calendar_month_outlined), hasNotification: false,),

                  Divider(indent:10, endIndent: 10 ,height: 0,),

                  ItemLista(textTitle: 'Mensajes', textNotification: '5', textDetail: '', icon: Icon(Icons.messenger_outline_rounded), hasNotification: true,),

            ]
              ),
            ),
            
         ],
        ),
      ),
    );
  }
}

