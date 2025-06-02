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
        children: const [
          SizedBox(height: 10),
          ListFav(assetpath: "asset/Egg roll.jpeg", Title: "Title", Subtitle: "Subtitle"),
          ListFav(assetpath: "asset/Egg roll.jpeg", Title: "Title", Subtitle: "Subtitle"),
          ListFav(assetpath: "asset/Egg roll.jpeg", Title: "Title", Subtitle: "Subtitle"),
          ListFav(assetpath: "asset/Egg roll.jpeg", Title: "Title", Subtitle: "Subtitle"),
        ],
      ),
    );
  }
}

class ListFav extends StatelessWidget {
  final String assetpath;
  final String Title;
  final String Subtitle;

  const ListFav({
    Key? key,
    required this.assetpath,
    required this.Title,
    required this.Subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(assetpath),
          ),
          title: Text(Title),
          subtitle: Text(
            Subtitle,
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: const Icon(Icons.favorite, color: Colors.green),
        ),
      ),
    );
  }
}
