import 'package:flutter/material.dart';

class TextInputBox extends StatefulWidget {
  const TextInputBox({
    super.key,
    required this.controller,
    required this.title,
    this.keyboardType = TextInputType.text,
    required this.preIcon,
    this.maxChars,
    this.minChars,
    this.isLast = true,
    this.isPassword = false,
    this.isEmail = false,
    this.validador
  });

  final String? Function(String?)? validador;
  final int? minChars;
  final int? maxChars;
  final TextEditingController controller;
  final String title;
  final TextInputType keyboardType;
  final IconData preIcon;
  final bool isLast;
  final bool isPassword;
  final bool isEmail;

  @override
  State<TextInputBox> createState() => _TextInputBoxState();
}

class _TextInputBoxState extends State<TextInputBox> {
  late bool visiblePassword;

  @override
  void initState() {
    super.initState();
    visiblePassword = widget.keyboardType == TextInputType.visiblePassword;
  }
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(

        validator: widget.validador,
        textInputAction: 
          widget.isLast ? TextInputAction.done:TextInputAction.next,
        maxLength: widget.maxChars,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: visiblePassword,
        decoration: InputDecoration(
            hintText: 'Ingrese su ${widget.title}',
            label: Text(widget.title),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            
            prefixIcon: Icon(widget.preIcon),
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