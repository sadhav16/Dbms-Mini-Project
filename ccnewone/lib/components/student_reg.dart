import 'dart:async';

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
