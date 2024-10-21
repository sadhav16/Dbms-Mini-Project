import 'package:ccnewone/components/my_bottom_nav_bar.dart';
import 'package:ccnewone/components/my_current_event.dart';
import 'package:ccnewone/components/my_current_location.dart';
import 'package:ccnewone/components/my_drawer.dart';
import 'package:ccnewone/components/my_silver_app_bar.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
                ],
              )),
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
}

class ApiService {
  final String baseUrl =
      'http://10.0.2.2:8000/api/events/'; // Use 10.0.2.2 for Android emulator

  Future<List<Event>> fetchEvents() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((event) => Event.fromJson(event)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }
}

class Event {
  final String title;
  final String description;
  final String location;

  Event(
      {required this.title, required this.description, required this.location});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      title: json['title'],
      description: json['description'],
      location: json['location'],
    );
  }
}
