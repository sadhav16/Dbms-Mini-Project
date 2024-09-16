import 'package:ccnewone/components/my_current_event.dart';
import 'package:ccnewone/components/my_current_location.dart';
import 'package:ccnewone/components/my_drawer.dart';
import 'package:ccnewone/components/my_home_components.dart';
import 'package:ccnewone/components/my_silver_app_bar.dart';
import 'package:flutter/material.dart';
import '../pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: const Text("TKM"),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      */
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
        MySilverAppBar(
          title: const Text('Explore Page'),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            
            children: [
              //my current location
              Divider(
                indent: 25,
                endIndent: 25,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const MyCurrentLocation(),


              //the current/latest events
              const MyCurrentEvent(),
            ],)
        ),
        ],
        
        body: ListView(
          children: [
            MyHomeComponents(
              title: 'Get to',
              color: Colors.green,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              ),
            ),
            MyHomeComponents(
              title: 'Find and Participate Events',
              color: Color.fromARGB(255, 255, 0, 0),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              ),
            ),
            MyHomeComponents(
              title: 'Add Events',
              color: Colors.orange,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              ),
            ),
          ],
          ),
          
        ),
      );
  }
}  