import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({super.key,required this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: [
          //first tab
          const Tab(
            icon: Icon(Icons.home),
          ),

          //2nd tab
          Tab(

          ),

        ],

      ),
    );
  }
}