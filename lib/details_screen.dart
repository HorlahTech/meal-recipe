import 'package:flutter/material.dart';
import 'package:food_project_app/models/ameals_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.id});
  final int id;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AMealRecipeModel? aMealRecipeModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      aMealRecipeModel = await Controller().getAMealRecipe(widget.id);
      print(aMealRecipeModel?.data?.strMealThumb);
      if (mounted) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green.shade700),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Image with Hero and loading spinner
                Container(
                  height: 400,
                  width: double.maxFinite,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                      bottom: Radius.circular(15),
                    ),
                  ),
                  child: Hero(
                    tag: widget.id,
                    transitionOnUserGestures: true,
                    flightShuttleBuilder: (
                      context,
                      anim1,
                      direction,
                      context2,
                      context3,
                    ) {
                      if (direction == HeroFlightDirection.push) {
                        return RotationTransition(
                          child: context2.widget,
                          turns: Tween<double>(begin: 0.0, end: 1.0).animate(
                            CurvedAnimation(
                              parent: anim1,
                              curve: Curves.easeIn,
                            ),
                          ),
                        );
                      }
                      return context3.widget;
                    },
                    child: Image.network(
                      aMealRecipeModel?.data?.strMealThumb ?? '',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(
                          child:
                              CircularProgressIndicator(), // Spinner instead of broken image
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  aMealRecipeModel?.data?.strMeal ?? '',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      aMealRecipeModel?.data?.strCategory ?? '',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green.shade700,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      aMealRecipeModel?.data?.strArea ?? '',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.green.shade700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                Text(
                  aMealRecipeModel?.data?.strTags ?? '',
                  style: TextStyle(fontSize: 20, color: Colors.green.shade700),
                ),

                const SizedBox(height: 20),

                Text(
                  'Ingredient',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),

                const SizedBox(height: 15),

                // Ingredients
                for (int i = 1; i <= 15; i++)
                  Text(
                    aMealRecipeModel?.data?.toJson()['strIngredient$i'] ?? '',
                  ),

                const SizedBox(height: 15),

                Text(
                  'Instruction',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green.shade700,
                  ),
                ),

                const SizedBox(height: 15),

                Text(
                  aMealRecipeModel?.data?.strInstructions ?? '',
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                ),

                const SizedBox(height: 20),

                // Fixed Row: Image + Watch Now Button
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 120,
                      width: 120, // Prevent image from growing too wide
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      child: Image.network(
                        aMealRecipeModel?.data?.strMealThumb ?? '',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade700,
                        ),
                        onPressed: () {
                          launchUrl(
                            Uri.parse(aMealRecipeModel?.data?.strYoutube ?? ''),
                          );
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Watch Now',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.ondemand_video_rounded,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
