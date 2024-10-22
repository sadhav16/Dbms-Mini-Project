/*import 'package:ccnewone/components/my_bottom_nav_bar.dart';
import 'package:ccnewone/components/my_current_event.dart';
import 'package:ccnewone/components/my_current_location.dart';
import 'package:ccnewone/components/my_drawer.dart';
import 'package:ccnewone/components/my_silver_app_bar.dart';
import 'package:flutter/material.dart';

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

        body: const MyBottomNavBar(),
        /*
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
        */  
        ),
      );
  }
}  */
/*import 'package:ccnewone/components/my_bottom_nav_bar.dart';
import 'package:ccnewone/components/my_current_event.dart';
import 'package:ccnewone/components/my_current_location.dart';
import 'package:ccnewone/components/my_drawer.dart';
import 'package:ccnewone/components/my_silver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ccnewone/pages/event_registration.dart'; // Ensure this file exists

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: const Text('Explore Page'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const MyCurrentLocation(),
                const MyCurrentEvent(),
              ],
            ),
          ),
        ],
        body: Column(
          children: [
            Expanded(child: const MyBottomNavBar()), // Existing content

            // Button to navigate to Event Registration Page
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Event Registration Page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const EventRegistrationPage(), // Ensure this class is defined
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 24.0),
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .primary, // Use backgroundColor
                ),
                child: Text(
                  'Register Event',
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
import 'package:ccnewone/components/my_bottom_nav_bar.dart';
import 'package:ccnewone/components/my_current_event.dart';
import 'package:ccnewone/components/my_current_location.dart';
import 'package:ccnewone/components/my_drawer.dart';
import 'package:ccnewone/components/my_silver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:ccnewone/pages/event_registration.dart';
import 'package:ccnewone/pages/student_event_registration.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySilverAppBar(
            title: const Text('Explore Page'),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const MyCurrentLocation(),
                const MyCurrentEvent(),
              ],
            ),
          ),
        ],
        body: Column(
          children: [
            Expanded(child: const MyBottomNavBar()), // Existing content

            // Row containing both buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // Distribute buttons evenly
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to Event Registration Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EventRegistrationPage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 24.0),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: Text(
                      'Register Event',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the existing Student Registration Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const EvntRegistrationPage(), // Make sure this class exists
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 24.0),
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: Text(
                      'Student Registration',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
