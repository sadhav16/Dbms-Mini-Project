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
          onPressed: (){ 
            Navigator.push(context, MaterialPageRoute(builder: (context) => const AccountSettings(), )
                );
              }, 
          icon: const Icon(Icons.account_box_rounded)
        )
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