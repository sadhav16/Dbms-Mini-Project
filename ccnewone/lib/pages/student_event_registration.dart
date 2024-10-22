import 'package:flutter/material.dart';
import 'package:ccnewone/components/student_reg.dart'; // Import the backend logic file

class EvntRegistrationPage extends StatefulWidget {
  const EvntRegistrationPage({super.key});

  @override
  State<EvntRegistrationPage> createState() => _EvntRegistrationPageState();
}

class _EvntRegistrationPageState extends State<EvntRegistrationPage> {
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _branchController = TextEditingController();
  final TextEditingController _semesterController = TextEditingController();
  final TextEditingController _studentIdController = TextEditingController();

  String? _selectedEvent;
  List<Event> _events = [];

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  // Function to load events from backend
  Future<void> _loadEvents() async {
    List<Event> events = await fetchEvents();
    setState(() {
      _events = events;
    });
  }

  // Function to handle form submission
  void _submitForm() {
    if (_selectedEvent == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an event')),
      );
      return;
    }

    final studentName = _studentNameController.text;
    final branch = _branchController.text;
    final semester = _semesterController.text;
    final studentId = _studentIdController.text;

    // Here you can handle the registration logic (e.g., send to the backend)
    // For now, we will just show a success message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('Registered $studentName for event: $_selectedEvent')),
    );

    // Clear fields after submission
    _studentNameController.clear();
    _branchController.clear();
    _semesterController.clear();
    _studentIdController.clear();
    setState(() {
      _selectedEvent = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Student Name
              TextField(
                controller: _studentNameController,
                decoration: const InputDecoration(labelText: 'Student Name'),
              ),
              const SizedBox(height: 16),

              // Branch
              TextField(
                controller: _branchController,
                decoration: const InputDecoration(labelText: 'Branch'),
              ),
              const SizedBox(height: 16),

              // Semester
              TextField(
                controller: _semesterController,
                decoration: const InputDecoration(labelText: 'Semester'),
              ),
              const SizedBox(height: 16),

              // Student ID
              TextField(
                controller: _studentIdController,
                decoration: const InputDecoration(labelText: 'Student ID'),
              ),
              const SizedBox(height: 16),

              // Event Dropdown
              DropdownButtonFormField<String>(
                value: _selectedEvent,
                hint: const Text('Select Event'),
                items: _events.map((event) {
                  return DropdownMenuItem(
                    value: event.id,
                    child: Text(event.name),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedEvent = value;
                  });
                },
              ),
              const SizedBox(height: 16),

              // Submit Button
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
