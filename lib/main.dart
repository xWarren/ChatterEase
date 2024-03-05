import 'package:flutter/material.dart';

import 'feature/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatter Ease',
      theme: ThemeData(),
      home: const SplashPage(),
    );
  }
}
