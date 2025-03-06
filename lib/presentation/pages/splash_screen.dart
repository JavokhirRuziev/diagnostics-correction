
// screens/splash_screen.dart
import 'package:child_correction/presentation/pages/selection_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'gender_selection.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,MaterialPageRoute(builder: (context) => const SelectionPage()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(seconds: 2),
          builder: (context, double value, child) {
            return Opacity(
              opacity: value,
              child: const Text(
                'Loading...',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            );
          },
        ),
      ),
    );
  }
}
