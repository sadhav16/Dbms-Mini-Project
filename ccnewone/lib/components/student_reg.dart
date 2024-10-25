import 'dart:async';
import 'dart:convert';  // For JSON encoding/decoding
import 'package:http/http.dart' as http;

class Event {
  final String name;

  Event({required this.name});

  // Factory constructor to create an Event from JSON
  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      name: json['ename'], // Adjust field names based on the schema
    );
  }
}

// Function to fetch events from the server
Future<List<Event>> fetchEvents() async {
  final response = await http.get(Uri.parse('http://localhost:8080/events'));  // Replace with your server's actual URL

  if (response.statusCode == 200) {
    // Decode the JSON response and map it to a list of Event objects
    List<dynamic> body = jsonDecode(response.body);
    List<Event> events = body.map((dynamic item) => Event.fromJson(item)).toList();

    return events;
  } else {
    throw Exception('Failed to load events');
  }
}

/*
class Event {
  final String id;
  final String name;

  Event({required this.id, required this.name});
}

// Simulated function to fetch event details
Future<List<Event>> fetchEvents() async {
  await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

  return [
    Event(id: '1', name: 'Tech Workshop'),
    Event(id: '2', name: 'Science Fair'),
    Event(id: '3', name: 'Art Exhibition'),
    Event(id: '4', name: 'Sports Day'),
  ];
}

*/
