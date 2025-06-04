import 'package:flutter/material.dart';
import 'package:food_project_app/sign_in_screen.dart';
import 'favorite_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Added padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Profile Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green.shade700,
                    radius: 50,
                    child: const Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "A. Blessing",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text("@blessing22"),
                    ],
                  ),
                ],
              ),

               SizedBox(height: 20),
               Divider(indent: 30, endIndent: 30),
               SizedBox(height: 20),

               MyProfile(
                leading: Icon(Icons.favorite),
                title: "Favorites",
                trailing: Icon(Icons.arrow_forward_ios, size: 12),
              ),


               NoClicks(
                leading: Icon(Icons.person),
                title: "Ayodele Blessing",
              ),
              NoClicks(
                leading: Icon(Icons.language),
                title: "English/Yoruba",
              ),
              NoClicks(
                leading: Icon(Icons.email),
                title: "@ayodeleblessing",
              ),
              NoClicks(
                leading: Icon(Icons.call),
                title: "+234 906 6117 025",
              ),

              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignInScreen()),
                  );
                },
                child: const NoClicks(
                  leading: Icon(Icons.logout, color: Colors.red),
                  title: "Logout",
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class MyProfile extends StatelessWidget {
  final Icon leading;
  final String title;
  final Icon trailing;

  const MyProfile({
    Key? key,
    required this.leading,
    required this.title,
    required this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoritePage()));
      },
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          leading: leading,
          title: Text(title),
          trailing: trailing,
        ),
      ),
    );
  }
}

class NoClicks extends StatelessWidget {
  final Icon leading;
  final String title;

  const NoClicks({
    Key? key,
    required this.leading,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: leading,
        title: Text(title),
      ),
    );
  }
}
