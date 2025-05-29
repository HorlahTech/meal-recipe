import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     /* bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff388e3c),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ), */

      appBar: AppBar(title: const Text('Favorites')),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Card(
            elevation: 1,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/Egg roll.jpeg'),
              ),
              title: Text('Jollof Rice'),
              subtitle: Text(
                'Description',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: Icon(Icons.favorite, color: Colors.green),
            ),
          ),
        ],
      ),

    );

  }
}
