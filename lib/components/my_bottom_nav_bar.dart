import 'package:ccnewone/pages/explore_favortites_page.dart';
import 'package:ccnewone/pages/explore_find_page.dart';
import 'package:ccnewone/pages/explore_home_page.dart';
import 'package:ccnewone/pages/home_page.dart';
import 'package:ccnewone/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({super.key});

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int _selectedindex = 0;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedindex = index;
    });
  }


  final List<Widget> _pages = [
    ExploreHomePage(),
    ExploreFavortitesPage(),
    ExploreFindPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedindex],
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:  15.0,vertical: 16),
          child: GNav(
            backgroundColor: Theme.of(context).colorScheme.surface,
            color: Theme.of(context).colorScheme.inversePrimary,
            tabBackgroundColor: Theme.of(context).colorScheme.secondary,
            padding: EdgeInsets.all(16),
            gap: 8,
            selectedIndex: _selectedindex,
            onTabChange: (index) {
              setState(() {
                _selectedindex = index;
              });
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ), 
          
              GButton(
                icon: Icons.favorite,
                text: 'Highlights',
              ), 
          
              GButton(
                icon: Icons.search,
                text: 'Find',
              ), 
            ],
          ),
        ),
      ),
    );
  }
}