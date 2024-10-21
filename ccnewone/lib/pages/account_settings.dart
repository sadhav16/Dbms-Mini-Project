import 'package:ccnewone/components/my_drawer.dart';
import 'package:ccnewone/components/my_profile_header.dart';
import 'package:ccnewone/components/my_profile_options.dart';
import 'package:flutter/material.dart';

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile Page'),
        toolbarHeight: 70,
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          const MyProfileHeader(), // Profile header remains the same
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0), // Add padding around the list
              children: [
                // First box: Profile and Address
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: const [
                      MyProfileOptions(icon: Icons.person, title: 'Personal Info'),
                      Divider(height: 1), // Divider between each option
                      MyProfileOptions(icon: Icons.location_on, title: 'Addresses'),
                    ],
                  ),
                ),

                const SizedBox(height: 20), // Space between sections

                // Second box: FAQs and Settings
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: const [
                      MyProfileOptions(icon: Icons.question_answer, title: 'FAQs'),
                      Divider(height: 1),
                      MyProfileOptions(icon: Icons.settings, title: 'Settings'),
                    ],
                  ),
                ),

                const SizedBox(height: 20), // Space between sections

                // "Log Out" in a separate box
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: const MyProfileOptions(
                    icon: Icons.logout,
                    title: 'Log Out',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }
}
