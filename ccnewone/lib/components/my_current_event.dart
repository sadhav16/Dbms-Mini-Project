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
            Column(
              children: [
                Text('IEEE GRSS object detection',style: TextStyle(color: Theme.of(context).colorScheme.secondary)),
              ],
            ),
            
      
            //event timing
            Column(
              children: [
                Text('APJ HALL',style:TextStyle(color: Theme.of(context).colorScheme.secondary)),
                Text('Starts 4:30 PM',style: TextStyle(color: Theme.of(context).colorScheme.primary),)
              ],
            )
      
          ],
      
      
        ),
      ),
    );
  }
}