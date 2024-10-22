import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ccnewone/components/event_item.dart'; // Import the new EventItem widget

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
        print('Response JSON: ${response.body}');
        setState(() {
          events = json.decode(response.body);
        });
      } else {
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

                    // Create the EventItem widget for each event
                    return EventItem(
                      //eventId: event['_id'],       // Event ID (assuming MongoDB ObjectId)
                      eventName: event['ename'],            // Event name
                      coordinator1: event['cood1'],         // First coordinator
                      coordinator2: event['cood2'],         // Second coordinator
                      location: event['loc'],               // Event location
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

