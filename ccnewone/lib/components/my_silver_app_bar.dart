import 'package:ccnewone/pages/account_settings.dart';
import 'package:flutter/material.dart';

class MySilverAppBar extends StatelessWidget {

  final Widget child;
  final Widget title;

  const MySilverAppBar({super.key,required this.child,required this.title});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AccountSettings()),
              );
            },
            icon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.1), // Optional: Set a background color
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary, // Border color
                  width: 5.0, // Border width
                ),
              ), // Optional: Add padding around the icon
              child: const Icon(
                Icons.account_circle_rounded,
                size: 30,// Icon size// Optional: Set the icon color
              ),
            ),
          )

        /*
        IconButton(
          onPressed: (){ 
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings(), )
                );
              }, 
          icon: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              
            ),
              child: const Icon(Icons.account_box_rounded,size: 35,))
        )
        */
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Padding(
        padding: EdgeInsets.all(25.0),
        child: Text("Walking in circles? "),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50.0),
          child: child,
        ),
        title: title,
        centerTitle: true,
        expandedTitleScale: 1,
      ),
    );
  }

}  