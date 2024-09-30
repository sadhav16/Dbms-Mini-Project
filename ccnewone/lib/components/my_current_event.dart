import 'package:flutter/material.dart';

class MyCurrentEvent extends StatelessWidget {
  const MyCurrentEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.secondary),
          borderRadius: BorderRadius.circular(8)
        ),
        padding: const EdgeInsets.all(25),
      
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //event name
            const Column(
              children: [
                Text('IEEE GRSS object detection'),
              ],
            ),
            
      
            //event timing
            Column(
              children: [
                const Text('APJ HALL'),
                Text('Starts 4:30 PM',style: TextStyle(color: Theme.of(context).colorScheme.primary),)
              ],
            )
      
          ],
      
      
        ),
      ),
    );
  }
}