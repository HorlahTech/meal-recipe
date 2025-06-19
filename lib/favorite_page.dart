import 'package:flutter/material.dart';
import 'package:food_project_app/controller.dart';
import 'package:food_project_app/models/ameals_model.dart';
import 'package:provider/provider.dart';

import 'details_screen.dart';

// ValueNotifier<List<AmealModel?>> favourites = ValueNotifier([]);

class FavoritePage extends StatelessWidget {
  const FavoritePage({
    super.key,
    required this.id,
    required this.aMealRecipeModel,
  });
  final int id;
  final AMealRecipeModel? aMealRecipeModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorites',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Consumer<Controller>(
        builder: (context, controller, child) {
          return controller.favouriteMeal.isEmpty
              ? Center(child: Text("Favourite is empty"))
              : ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: controller.favouriteMeal.length,
                itemBuilder: (ctx, index) {
                  final item = controller.favouriteMeal[index];
                  return ListFav(
                    assetpath: item.strMealThumb ?? '',
                    Title: item.strMeal ?? '',
                    Subtitle: "Subtitle",
                    id: item.id ?? 0,
                  );
                },
              );
        },
      ),
    );
  }
}

class ListFav extends StatefulWidget {
  final String assetpath;
  final String Title;
  final String Subtitle;
  final int id;
  const ListFav({
    Key? key,
    required this.assetpath,
    required this.Title,
    required this.Subtitle,
    required this.id,
  }) : super(key: key);

  @override
  State<ListFav> createState() => _ListFavState();
}

class _ListFavState extends State<ListFav> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(id: widget.id)),
        );
      },
      child: Consumer<Controller>(
        builder: (context, controller, _) {
          return Card(
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: Image.network(widget.assetpath).image,
              ),
              title: Text(widget.Title),
              subtitle: Text(
                widget.Subtitle,
                style: const TextStyle(color: Colors.grey),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    final meal = controller.favouriteMeal.firstWhere(
                      (ele) => ele.id == widget.id,
                    );
                    controller.removeFavourite(meal);
                    // favourites.value =  [meal] ;
                  });
                },
                icon: Icon(Icons.favorite),
              ),
            ),
          );
        },
      ),
    );
  }
}
