import 'pages/launch_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData( // set font
        fontFamily: 'Times',
      ),
      home: const LaunchPage(), // Starts app from launchpage which is imported 
    );
  }
}
