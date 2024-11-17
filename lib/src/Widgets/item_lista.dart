
import 'package:flutter/material.dart';

class ItemLista extends StatelessWidget {
  const ItemLista({
    super.key,
    required this.textTitle,
    required this.textNotification,
    required this.textDetail,
    required this.icon,
    required this.hasNotification
  });
  final String textTitle, textNotification, textDetail;
  final Icon icon;
  final bool hasNotification;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
      leading: icon,
      title: Row(children:[
        Text(textTitle),
        SizedBox(width: 5),
        if(hasNotification)
          CircleAvatar(radius: 15, backgroundColor: Colors.blueAccent, child: Text(textNotification),),
        SizedBox(width: 5),
        
        if(hasNotification)
          Text(textDetail, style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.w300, fontSize: 12),),
        ] ),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('But nothing happened!')));
      },
    );
  }
}