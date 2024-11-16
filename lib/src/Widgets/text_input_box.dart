import 'package:flutter/material.dart';

class TextInputBox extends StatefulWidget {
  const TextInputBox({
    super.key,
    required this.userController,
    required this.title,
    this.keyboardType = TextInputType.text,
  });

  final TextEditingController userController;
  final String title;
  final TextInputType keyboardType;

  @override
  State<TextInputBox> createState() => _TextInputBoxState();
}

class _TextInputBoxState extends State<TextInputBox> {
  bool visiblePassword = false;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.userController,
      keyboardType: widget.keyboardType,
      obscureText: visiblePassword,
      decoration: InputDecoration(
          hintText: 'Ingrese su ${widget.title}',
          label: Text(widget.title),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(1000),
            ),
          ),
          
          prefixIcon: Icon(widget.keyboardType == TextInputType.emailAddress ? Icons.person : Icons.lock_open_rounded),
          suffixIcon: widget.keyboardType == TextInputType.visiblePassword ?
            IconButton(
              icon: Icon(visiblePassword ? Icons.visibility:Icons.visibility_off),
              onPressed: () {
                setState(() {
                  visiblePassword = !visiblePassword;
                });
              },
            ) : null
          ),
    );
  }
}