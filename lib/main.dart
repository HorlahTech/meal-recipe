import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_project_app/Onboarding.dart';
import 'package:food_project_app/controller.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (ctx) => Controller(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  int _dotCount = 2;
  Timer? _timer;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        _dotCount = (_dotCount + 1) % 4;
      });
    });

    Timer(Duration(seconds: 8), () {
      _timer?.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboarding(id: 0)),
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade700,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: _opacity,
              child: Text(
                "CRAVINGS",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2.0,
                  fontFamily: "Arial",
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              '.' * _dotCount,
              style: TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
