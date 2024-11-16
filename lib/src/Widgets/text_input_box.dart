import 'package:flutter/material.dart';

class TextInputBox extends StatefulWidget {
  const TextInputBox({
    super.key,
    required this.controller,
    required this.title,
    this.keyboardType = TextInputType.text,
    required this.preIcon,
    this.maxLength,
    this.isLast = true
  });

  final int? maxLength;
  final TextEditingController controller;
  final String title;
  final TextInputType keyboardType;
  final IconData preIcon;
  final bool isLast;

  @override
  State<TextInputBox> createState() => _TextInputBoxState();
}

class _TextInputBoxState extends State<TextInputBox> {
  bool visiblePassword = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      child: TextFormField(
        textInputAction: widget.isLast ? TextInputAction.done:TextInputAction.next,
        maxLength: widget.maxLength,
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
      ),
    );
  }
}