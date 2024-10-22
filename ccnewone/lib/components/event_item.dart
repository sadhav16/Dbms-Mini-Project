import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {     // Event ID (from _id.$oid)
  final String eventName;      // Name of the event (ename)
  final String coordinator1;   // First coordinator (cood1)
  final String coordinator2;   // Second coordinator (cood2)
  final String location;       // Event location (loc)

  const EventItem({
    super.key,
    required this.eventName,
    required this.coordinator1,
    required this.coordinator2,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).colorScheme.tertiary, 
            width: 1,
          ),
        ),
        child: Row(
          children: [
            // Event ID placeholder (optional)
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.primary,
              // child: Text(
              //   eventId,  // Display first 2 characters of the event ID
              //   style: TextStyle(color: Colors.white),
              // ),
              radius: 25, // Adjust the size of the circle avatar
            ),
            const SizedBox(width: 16),
            // Event details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event name (ename)
                  Text(
                    eventName,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary, 
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Event coordinators (cood1 and cood2)
                  Text(
                    'Coordinators: $coordinator1, $coordinator2',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.secondary, 
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Event location (loc)
                  Text(
                    'Location: $location',
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.primary, 
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
