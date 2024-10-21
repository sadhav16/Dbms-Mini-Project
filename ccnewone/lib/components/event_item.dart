import 'package:flutter/material.dart';

class EventItem extends StatelessWidget {
  final String logoPath;
  final String eventTitle;
  final String eventTime;

  const EventItem({
    super.key,
    required this.logoPath,
    required this.eventTitle,
    required this.eventTime,
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
              color: Theme.of(context).colorScheme.tertiary, width: 1),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(logoPath),
              radius: 25, // Adjust the size of the circle avatar
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventTitle,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context)
                          .colorScheme
                          .primary, // Consistent color scheme
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    eventTime,
                    style: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context)
                          .colorScheme
                          .secondary, // Secondary color
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
