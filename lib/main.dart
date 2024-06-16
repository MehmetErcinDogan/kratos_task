import 'package:flutter/material.dart';
import 'pages/launch_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LaunchPage(),
    ); // Loads Launch page
  }
}
