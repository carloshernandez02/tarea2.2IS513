import 'package:flutter/material.dart';

class GreatButton extends StatefulWidget {
  const GreatButton({
    super.key,
    required this.text,
    required this.onPush,
  });
  final String text;
  final void Function()? onPush;
  @override
  State<GreatButton> createState() => _GreatButtonState();
}

class _GreatButtonState extends State<GreatButton> {


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: widget.onPush,  
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blueAccent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
    child: Text(widget.text, style: TextStyle(fontWeight: FontWeight.w500),),
    );
  }
}