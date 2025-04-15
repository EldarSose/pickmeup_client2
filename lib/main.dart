import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const PickMeUpApp());
}

class PickMeUpApp extends StatelessWidget {
  const PickMeUpApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PickMeUp',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
