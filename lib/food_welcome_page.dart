import 'package:flutter/material.dart';
import 'package:food_project_app/controller.dart';
import 'package:food_project_app/models/allmeals_model.dart';
import 'package:food_project_app/models/ameals_model.dart';
import 'package:food_project_app/profile_page.dart';
import 'package:provider/provider.dart';

import 'details_screen.dart';
import 'favorite_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, required this.id});
  final int id;
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int currentPage = 0;
  List<Widget> pages = [
    HomeWidget(),
    FavoritePage(id: 0, aMealRecipeModel: AMealRecipeModel()),
    ProfilePage(id: 0),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff388e3c),
        unselectedItemColor: Colors.grey,
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),

      body: IndexedStack(index: currentPage, children: pages),
    );
  }
}

class FoodWidget extends StatefulWidget {
  final String imagepath;
  final AmealModel? meal;
  final String Discription;
  final int id;
  //final VoidCallback? onpressed;
  const FoodWidget({
    Key? key,
    required this.imagepath,
    required this.meal,
    required this.Discription,
    required this.id,
    // required this.onpressed
  }) : super(key: key);

  @override
  State<FoodWidget> createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<FoodWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Controller>(
      builder: (context, controller, _) {
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Hero(
                  tag: widget.id,
                  flightShuttleBuilder: (
                    context,
                    anim1,
                    direction,
                    context2,
                    context3,
                  ) {
                    if (direction == HeroFlightDirection.push) {
                      return RotationTransition(
                        turns: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(parent: anim1, curve: Curves.easeIn),
                        ),
                        child: context2.widget,
                      );
                    } else {
                      return FadeTransition(
                        child: context3.widget,
                        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(parent: anim1, curve: Curves.easeIn),
                        ),
                      );
                    }
                  },
                  transitionOnUserGestures: true,
                  child: Image.network(
                    widget.meal?.strMealThumb ?? '',
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value:
                              loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: Icon(Icons.broken_image, size: 48),
                      );
                    },
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.meal?.strMeal ?? "",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              widget.Discription,
                              style: TextStyle(
                                color: Colors.green.shade700,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 50),
                        Spacer(),
                        IconButton(
                          icon:
                              controller.favouriteMeal.contains(widget.meal)
                                  ? Icon(Icons.favorite)
                                  : Icon(Icons.favorite_border),
                          onPressed: () {
                            setState(() {
                              if (controller.favouriteMeal.contains(
                                widget.meal,
                              )) {
                                controller.removeFavourite(widget.meal!);
                              } else {
                                controller.addFavourite(widget.meal!);
                                // favourites.add(widget.meal);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 15),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green.shade700,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(id: widget.id),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "How to prepare",
                            style: TextStyle(color: Colors.white),
                          ),
                          Icon(
                            Icons.ondemand_video_rounded,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  AllMealRecipeModel? allMealRecipeModel;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((t) async {
      allMealRecipeModel = await Controller().getAllMealRecipe();
      print("Data lenght ${allMealRecipeModel?.data?.data?.length}");
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Hi Blessing',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff388e3c),
                  ),
                ),
                Icon(Icons.menu_rounded),
              ],
            ),

            // Title
            const SizedBox(height: 16),
            const Text(
              "Search for food",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 35),

            Container(
              height: 46,
              margin: const EdgeInsets.symmetric(horizontal: 0),
              decoration: BoxDecoration(
                color: const Color(0xffe4f5cc),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 12),
                  Icon(Icons.search, color: Colors.green.shade700),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search Food',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    height: 46,
                    width: 46,
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Icon(Icons.tune, color: Colors.white),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 23),
            Text(
              "Foods At CravingS",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 25),
            // Center(child: CircularProgressIndicator(color: Colors.green)),
            context.watch<Controller>().isLoading
                ? Center(child: CircularProgressIndicator(color: Colors.green))
                : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    // physics: NeverScrollableScrollPhysics(),
                    itemCount: allMealRecipeModel?.data?.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      // print("Data lenght ${allMealRecipeModel?.data?.data?.length}",);
                      final meal = allMealRecipeModel?.data?.data?[index];
                      return FoodWidget(
                        imagepath: meal?.strMealThumb ?? '',
                        meal: meal,

                        Discription: meal?.strCategory ?? '',
                        id: meal?.id ?? 0,
                      );
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
