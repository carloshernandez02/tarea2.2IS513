import 'package:flutter/material.dart';

class GreatButton extends StatefulWidget {
  const GreatButton({
    super.key,
    required this.text
  });
  final String text;

  @override
  State<GreatButton> createState() => _GreatButtonState();
}

class _GreatButtonState extends State<GreatButton> {


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){},  
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
    child: Text(widget.text, style: TextStyle(fontWeight: FontWeight.w500),),
    );
  }
}