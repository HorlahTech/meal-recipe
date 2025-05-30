import 'package:flutter/material.dart';

import 'details_screen.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeScreen()));
            },
            child: Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('asset/Egg roll.jpeg'),
                ),
                title: const Text('Jollof Rice'),
                subtitle: const Text(
                  'Description',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: const Icon(Icons.favorite, color: Colors.green),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
