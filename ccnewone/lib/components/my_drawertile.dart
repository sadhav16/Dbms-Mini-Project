import 'package:flutter/material.dart';

class MyDrawertile extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? onTap;
  const MyDrawertile({super.key,required this.text,required this.icon,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        text,style: TextStyle(color: Theme.of(context).colorScheme.primary),
        ),
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.primary,  
        ),
      onTap: onTap,    
    );
  }
}