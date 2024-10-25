import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventRegistrationPage extends StatefulWidget {
  const EventRegistrationPage({super.key});

  @override
  EventRegistrationPageState createState() => EventRegistrationPageState();
}

class EventRegistrationPageState extends State<EventRegistrationPage> {
  // Controllers for the TextFields
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _coordinator1Controller = TextEditingController();
  final TextEditingController _coordinator2Controller = TextEditingController();
  final TextEditingController _hallNameController = TextEditingController();

  // Variable for selected date
  DateTime? _selectedDate;

  // Function to handle date selection
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Function to submit form and send data to backend
  Future<void> _submitForm() async {
    if (_eventNameController.text.isEmpty ||
        _coordinator1Controller.text.isEmpty ||
        _coordinator2Controller.text.isEmpty ||
        _hallNameController.text.isEmpty ||
        _selectedDate == null) {
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields and select a date')),
      );
      return;
    }

    // Prepare the event data
    final eventData = {
      'ename': _eventNameController.text,
      'cood1': _coordinator1Controller.text,
      'cood2': _coordinator2Controller.text,
      'loc': _hallNameController.text,
    };

    try {
      // Send POST request to the backend
      final response = await http.post(
        Uri.parse('http://localhost:8080/events'), // Update with your backend URL
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(eventData),
      );

      if (response.statusCode == 201) {
        // Log event details and show success message
        developer.log("Event registered: $eventData", name: 'event_registration');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Event registered successfully!')),
        );

        // Clear fields after successful submission
        _eventNameController.clear();
        _coordinator1Controller.clear();
        _coordinator2Controller.clear();
        _hallNameController.clear();
        setState(() {
          _selectedDate = null;
        });
      } else {
        // Handle server error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to register event: ${response.body}')),
        );
      }
    } catch (error) {
      // Handle connection error
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error connecting to server')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Event Name TextField
            TextField(
              controller: _eventNameController,
              decoration: const InputDecoration(
                labelText: 'Event Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Coordinator 1 TextField
            TextField(
              controller: _coordinator1Controller,
              decoration: const InputDecoration(
                labelText: 'Coordinator 1 Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Coordinator 2 TextField
            TextField(
              controller: _coordinator2Controller,
              decoration: const InputDecoration(
                labelText: 'Coordinator 2 Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Hall Name TextField
            TextField(
              controller: _hallNameController,
              decoration: const InputDecoration(
                labelText: 'Hall to be Booked',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Date Picker
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No date selected'
                        : 'Selected Date: ${_selectedDate!.toLocal()}'.split(' ')[0],
                  ),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Select Date'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Submit Button
            ElevatedButton(
              onPressed: _submitForm, // Call the submit function
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class EventRegistrationPage extends StatefulWidget {
  const EventRegistrationPage({super.key});

  @override
  EventRegistrationPageState createState() => EventRegistrationPageState();
}

class EventRegistrationPageState extends State<EventRegistrationPage> {
  // Controllers for the TextFields
  final TextEditingController _eventNameController = TextEditingController();
  final TextEditingController _coordinatorNameController =
      TextEditingController();
  final TextEditingController _clubNameController = TextEditingController();
  final TextEditingController _hallNameController = TextEditingController();

  // Variable for selected date
  DateTime? _selectedDate;

  // Function to handle date selection
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Function to validate and submit the form
  void _submitForm() {
    if (_eventNameController.text.isEmpty ||
        _coordinatorNameController.text.isEmpty ||
        _clubNameController.text.isEmpty ||
        _hallNameController.text.isEmpty ||
        _selectedDate == null) {
      // Show an error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please fill in all fields and select a date')),
      );
      return;
    }

    // Log event details
    developer.log("Event Name: ${_eventNameController.text}",
        name: 'event_registration');
    developer.log("Coordinator Name: ${_coordinatorNameController.text}",
        name: 'event_registration');
    developer.log("Associated Club: ${_clubNameController.text}",
        name: 'event_registration');
    developer.log("Hall: ${_hallNameController.text}",
        name: 'event_registration');
    developer.log("Event Date: ${_selectedDate!.toLocal()}",
        name: 'event_registration');

    // Clear fields after submission
    _eventNameController.clear();
    _coordinatorNameController.clear();
    _clubNameController.clear();
    _hallNameController.clear();
    setState(() {
      _selectedDate = null;
    });

    // Show a confirmation message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Event registered successfully!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Event Name TextField
            TextField(
              controller: _eventNameController,
              decoration: const InputDecoration(
                labelText: 'Event Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Coordinator Name TextField
            TextField(
              controller: _coordinatorNameController,
              decoration: const InputDecoration(
                labelText: 'Coordinator Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Associated Club TextField
            TextField(
              controller: _clubNameController,
              decoration: const InputDecoration(
                labelText: 'Associated Club',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Hall Name TextField
            TextField(
              controller: _hallNameController,
              decoration: const InputDecoration(
                labelText: 'Hall to be Booked',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Date Picker
            Row(
              children: [
                Expanded(
                  child: Text(
                    _selectedDate == null
                        ? 'No date selected'
                        : 'Selected Date: ${_selectedDate!.toLocal()}'
                            .split(' ')[0],
                  ),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: const Text('Select Date'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Submit Button
            ElevatedButton(
              onPressed: _submitForm, // Call the submit function
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
*/