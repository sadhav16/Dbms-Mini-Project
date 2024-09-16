import 'package:ccnewone/components/my_drawertile.dart';
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
          const Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 40,
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
            text: "Home",
            icon: Icons.home,
            onTap: () => Navigator.pop(context)
            ),

          //settings
          MyDrawertile(
            text: "Settings",
            icon: Icons.settings,
            onTap: () { 
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage(), )
                );
              },
            ),

          //log out
          MyDrawertile(
            text: "LogOut",
            icon: Icons.logout,
            onTap: (){}
            ),

        ],
      ),
    );
  }
}