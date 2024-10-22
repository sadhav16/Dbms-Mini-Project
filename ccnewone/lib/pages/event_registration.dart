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
