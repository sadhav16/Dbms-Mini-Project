import 'package:flutter/material.dart';

class MyProfileHeader extends StatelessWidget {
  const MyProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.orange.shade200,
            child: const Icon(Icons.person, size: 50.0, color: Colors.white),
          ),
          const SizedBox(height: 10.0),
          const Text(
            'Vishal Khadok',                      //backend
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5.0),
          const Text(
            'I love fast food',                   //backend
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
