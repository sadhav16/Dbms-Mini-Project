import 'dart:convert';
import 'dart:io';
import 'package:ccnewone/backend/api_service.dart';
import 'package:postgres/postgres.dart'; // Use postgres package
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

class EventH {
  final String ename;
  final String eloc;

  EventH({
    required this.ename,
    required this.eloc,
  });

  Map<String, dynamic> toJson() {
    return {
      'ename': ename,
      'eloc': eloc,
    };
  }
}

class DatabaseService {
  late PostgreSQLConnection _connection;

  DatabaseService() {
    _connection = PostgreSQLConnection(
      'localhost', // Replace with your database host
      5432,        // Port for PostgreSQL
      'postgres', // Your database name
      username: 'postgres', // Replace with your PostgreSQL username
      password: 'sadhav16', // Replace with your PostgreSQL password
    );
  }

  Future<void> connect() async {
    try {
      await _connection.open();
      print('Connected to PostgreSQL');
    } catch (e) {
      print('Error connecting to PostgreSQL: $e');
    }
  }

  Future<List<EventH>> getEvents() async {
    try {
      List<List<dynamic>> results = await _connection.query('SELECT ename, eloc FROM Event;');
      
      return results.map((row) {
        return EventH(
          ename: row[0] ?? '',
          eloc: row[1] ?? '',
        );
      }).toList();
    } catch (e) {
      print('Error retrieving events: $e');
      return [];
    }
  }

  Future<void> fetchEvents() async {
    final apiService = ApiService(); // Create an instance of your service

    try {
      await apiService.fetchData(); // Call the fetchData method
      // Handle the successful data processing here
    } catch (e) {
      // Handle the error here
      print('Error fetching events: $e');
    }
  }
  
  Future<void> addEvent(EventH event) async {
    try {
      await _connection.query(
        'INSERT INTO Event (ename, eloc) VALUES (@ename, @eloc);',
        substitutionValues: {
          'ename': event.ename,
          'eloc': event.eloc,
        },
      );
      print('Event added successfully');
    } catch (e) {
      print('Error adding event: $e');
    }
  }

  Future<void> close() async {
    await _connection.close();
    print('Connection to PostgreSQL closed');
  }
}

Future<void> main() async {
  final dbService = DatabaseService();
  await dbService.connect();

  final router = Router();

  // Route to get all events
  router.get('/events', (Request request) async {
    try {
      final events = await dbService.getEvents();
      final jsonEvents = events.map((event) => event.toJson()).toList();
      return Response.ok(jsonEncode(jsonEvents), headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
      });
    } catch (e) {
      print('Error fetching events: $e');
      return Response.internalServerError(body: 'Failed to fetch events');
    }
  });

  // Route to add a new event
  router.post('/events', (Request request) async {
    try {
      final payload = await request.readAsString();
      final Map<String, dynamic> data = jsonDecode(payload);

      final newEvent = EventH(
        ename: data['ename'],
        eloc: data['eloc'],
      );

      await dbService.addEvent(newEvent);
      return Response.ok('Event added successfully');
    } catch (e) {
      print('Error adding event: $e');
      return Response.internalServerError(body: 'Failed to add event');
    }
  });

  final handler = const Pipeline()
      .addMiddleware(logRequests())
      .addHandler(router);

  final server = await shelf_io.serve(handler, 'localhost', 8080);
  print('Serving at http://${server.address.host}:${server.port}');
}
