import 'package:flutter/material.dart';
import 'package:ccnewone/components/favorites_card.dart'; // Import the new class

class ExploreFavoritesPage extends StatelessWidget {
  const ExploreFavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Example list of data for the cards
    final List<Map<String, String>> favoriteItems = [
      {
        'image':
            'lib/assets/homeui/eventadd.jpg', // Image URL or local asset
        'title': 'Favorite 1',
        'subtitle': 'This is the first favorite'
      },
      {
        'image': 'lib/assets/homeui/eventdet.jpg',
        'title': 'Favorite 2',
        'subtitle': 'This is the second favorite'
      },
      {
        'image': 'lib/assets/homeui/goto.jpg',
        'title': 'Favorite 3',
        'subtitle': 'This is the third favorite'
      },
      // Add more items as needed
    ];


    return Scaffold(
  appBar: AppBar(
    automaticallyImplyLeading: false, // Removes the back button
    title: const Text('Explore Favorites'),
  ),
    body: Container(
      color: Theme.of(context).colorScheme.surface, // Set your desired background color here
      child: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return FavoriteCard(
            imageUrl: item['image']!,
            title: item['title']!,
            subtitle: item['subtitle']!,
          );
        },
      ),
    ),
  );

    /*
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Removes the back button
        title: const Text('Explore Favorites'),
      ),
      body: ListView.builder(
        itemCount: favoriteItems.length,
        itemBuilder: (context, index) {
          final item = favoriteItems[index];
          return FavoriteCard(
            imageUrl: item['image']!,
            title: item['title']!,
            subtitle: item['subtitle']!,
          );
        },
      ),
    );
    */
  }
}
