import 'package:flutter/material.dart';

class MyHomeComponents extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;
  const MyHomeComponents({super.key,required this.title,required this.color,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15,top: 8.0,bottom: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).colorScheme.secondary),
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          alignment: Alignment.centerRight,
          
          height: 200,
          width: 200,
          child: Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: Text(title,style: const TextStyle(fontSize: 20),),
            
          ),
          
        ),
      ),
    );
  }
}