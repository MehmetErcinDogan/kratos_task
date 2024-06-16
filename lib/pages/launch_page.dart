import 'package:flutter/material.dart';
import 'login_page.dart'; // imported for navigate to login page
import 'dart:async'; // imported for timer
// launch page is stateful widget because plays gif 
class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _GifViewerState createState() => _GifViewerState();
}

class _GifViewerState extends State<LaunchPage> {
  String path = 'assets/launch_gif.gif'; // path of gif

  Timer? _timer; // create timer variable

  @override
  void initState() {
    super.initState();
    _startGifTimer();// function for starts timer which is defined below
  }

  @override
  void dispose() {
    _timer?.cancel(); // stops timer. If smthings happen before redirect login page, dispose functions run and stops timer.
    super.dispose();
  }

  void _startGifTimer() {
    _timer = Timer(const Duration(seconds: 5), () { // after 5 second setState functions run, function runs which is placed below
      setState(() {
        _timer?.cancel(); // stops timer
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      }); // redirect to new login page
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( // Box which has image inside,  gonna place to page via container  
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover), // put image and image covers their box
        ),
      ),
    );
  }
}
