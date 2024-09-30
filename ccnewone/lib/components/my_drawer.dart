import 'package:ccnewone/components/my_drawertile.dart';
import 'package:ccnewone/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          //app logo
          const DrawerHeader(
            child: Icon(
              Icons.person,
              size: 64,
              ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //home page
          MyDrawertile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage(), )
                 );
              },
            ),

          //settings
          MyDrawertile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () { 
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage(), )
                );
              },
            ),

          //log out
          MyDrawertile(
            text: "L O G  O U T",
            icon: Icons.logout,
            onTap: (){}
            ),

        ],
      ),
    );
  }
}