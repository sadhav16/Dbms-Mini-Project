import 'package:flutter/material.dart';

class MyProfileOptions extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const MyProfileOptions({
    required this.icon,
    required this.title,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18.0,
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap ?? () {
        // Define navigation or action here
      },
    );
  }
}
