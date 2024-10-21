// import 'package:flutter/material.dart';

// class ExploreHomePage extends StatelessWidget {
//   const ExploreHomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Center(
//       child: Text('Welcome to tkm'),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:ccnewone/components/event_item.dart'; // Import the new EventItem widget

class ExploreHomePage extends StatelessWidget {
  const ExploreHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Upcoming Events',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
    );
  }
}
