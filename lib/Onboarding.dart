import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:food_project_app/sign_in_screen.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key, required this.id});
  final int id;
  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "asset/fooding.png",
                      fit: BoxFit.cover,
                      height: 400,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text(
                    "Welcome to",
                    style: TextStyle(fontSize: 27, color: Colors.white),
                  ),
                  SizedBox(
                    height: 50,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade700,
                      ),
                      child: AnimatedTextKit(
                        animatedTexts: [WavyAnimatedText('CravingS')],
                        //  isRepeatingCursorAnimation: true,
                        repeatForever: true,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Where every craving meets a recipe, and every recipe brings you closer to the joy of cooking from the heart. ",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green.shade700,
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => SignInScreen(id: widget.id),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
