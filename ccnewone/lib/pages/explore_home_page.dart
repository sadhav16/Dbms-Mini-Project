import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ccnewone/components/favorites_card.dart';

// Database connection details (for reference, typically handled in backend)
final String dbHost = 'localhost'; // Replace with your database host
final int dbPort = 5432;            // Port for PostgreSQL
final String dbName = 'postgres';   // Your database name
final String dbUsername = 'postgres'; // Your PostgreSQL username
final String dbPassword = 'sadhav16'; // Your PostgreSQL password

class ExploreHomePage extends StatefulWidget {
  const ExploreHomePage({super.key});

  @override
  _ExploreHomePageState createState() => _ExploreHomePageState();
}

class _ExploreHomePageState extends State<ExploreHomePage> {
  List<dynamic> events = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
  try {
    final response = await http.get(Uri.parse('http://localhost:8080/events'));
    
    if (response.statusCode == 200) {
      setState(() {
        events = json.decode(response.body);
      });
    } else {
      // Log the status code and body for further debugging
      print('Failed to load events: ${response.statusCode} ${response.body}');
      throw Exception('Failed to load events');
    }
  } catch (e) {
    print('Error fetching events: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upcoming Events',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return FavoriteCard(
                      title: event['ename'],  // Set ename as the title
                      subtitle: event['eloc'],  // Set eloc as the location
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/*
import 'package:ccnewone/components/favorites_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ccnewone/components/event_item.dart'; // Import the new EventItem widget

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ExploreHomePage extends StatefulWidget {
  const ExploreHomePage({super.key});

  @override
  _ExploreHomePageState createState() => _ExploreHomePageState();
}

class _ExploreHomePageState extends State<ExploreHomePage> {
  List<dynamic> events = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    final response = await http.get(Uri.parse('http://localhost:8080/events'));
    print(response.contentLength);

    if (response.statusCode == 200) {
      setState(() {
        events = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load events');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upcoming Events',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    // Use the FavoriteCard widget with event data
                    return FavoriteCard(
                      title: event['ename'],  // Set ename as the title
                      subtitle: event['eloc'],  // Set eloc as the location
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

*/


/*
class ExploreHomePage extends StatefulWidget {
  const ExploreHomePage({super.key});

  @override
  _ExploreHomePageState createState() => _ExploreHomePageState();
}

class _ExploreHomePageState extends State<ExploreHomePage> {
  List<dynamic> events = [];

  @override
  void initState() {
    super.initState();
    fetchEvents();
  }

  Future<void> fetchEvents() async {
    final response = await http.get(Uri.parse('http://localhost:8080/events'));

    if (response.statusCode == 200) {
      setState(() {
        events = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load events');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upcoming Events',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: events.length,
                  itemBuilder: (context, index) {
                    final event = events[index];
                    return EventItem(
                      logoPath: event['ename'], // Use ename as logoPath
                      eventTitle: event['location'], // Use location as eventTitle
                      eventTime: event['coord1'], // Use coord1 as eventTime
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

*/


/*
import 'package:flutter/material.dart';
import 'package:ccnewone/components/event_item.dart'; // Import the new EventItem widget

class ExploreHomePage extends StatelessWidget {
  const ExploreHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upcoming Events',
                style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: const [
                    EventItem(
                      logoPath: 'assets/club_logo1.png', // Club logo image path
                      eventTitle: 'Hacktoberfest 2024',
                      eventTime: '9:00 AM - 12:00 PM',
                    ),
                    EventItem(
                      logoPath: 'assets/club_logo2.png',
                      eventTitle: 'Flutter Workshop',
                      eventTime: '2:00 PM - 4:00 PM',
                    ),
                    EventItem(
                      logoPath: 'assets/club_logo3.png',
                      eventTitle: 'AI Conference',
                      eventTime: '10:00 AM - 1:00 PM',
                    ),
                    // Add more EventItem instances as needed
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/