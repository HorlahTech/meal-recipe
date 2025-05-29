import 'package:flutter/material.dart';
import 'package:food_project_app/profile_page.dart';
import 'favorite_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xff388e3c),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavoritePage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
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

              const SizedBox(height: 40),
              Row(
                children: const [
                  Text("Food",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.green)),
                  SizedBox(width: 16),
                  Text("Fruits", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 16),
                  Text("Vegetables", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 16),
                  Text("Grocery", style: TextStyle(color: Colors.grey)),
                ],
              ),
              SizedBox(height: 45,),
              FoodClass(imagepath: "assets/nija jollof.jpeg", Foodname: "Jollof Rice", Discription: "The Amazing Nija Jollof"),
              FoodClass(imagepath: "assets/Egg roll.jpeg", Foodname: "Egg Roll", Discription: "Crunch and delicious egg roll"),
              FoodClass(imagepath: "assets/Making Egusi.jpeg", Foodname: "Egusi/Semo", Discription: "Discription"),
              FoodClass(imagepath: "assets/moi moi.jpeg", Foodname: "Moi-Moi", Discription: "Discription"),
              FoodClass(imagepath: "assets/plantain.jpeg", Foodname: "Plantain/Fried Egg", Discription: "Discription"),
              FoodClass(imagepath: "assets/potatoes.jpeg", Foodname: "Sweet Potatoes", Discription: "Discription")

            ],
          ),
        ),
      ),
    );
  }
}
class FoodClass extends StatelessWidget{
  final String imagepath;
  final String Foodname;
  final String Discription;
  //final VoidCallback? onpressed;
  const FoodClass({
    Key? key,
    required this.imagepath,
    required this.Foodname,
    required this.Discription,
   // required this.onpressed
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: double.infinity,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Image.asset(
              imagepath,
              fit: BoxFit.cover, // Makes image fill the space
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Foodname,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  Discription,
                  style: TextStyle(color: Colors.grey),
                ),

                SizedBox(height: 15,),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade700),
                  onPressed: () {
                    //Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    // builder: (context) => ThirdScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "How to prepare",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.ondemand_video_rounded, color: Colors.white,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}