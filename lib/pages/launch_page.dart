import 'package:flutter/material.dart';
import 'login_page.dart';
import 'dart:async';

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _GifViewerState createState() => _GifViewerState();
}

class _GifViewerState extends State<LaunchPage> {
  String path = 'assets/launch_gif.gif';

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startGifTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startGifTimer() {
    _timer = Timer(const Duration(seconds: 5), () {
      setState(() {
        _timer?.cancel();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(path), fit: BoxFit.cover),
        ),
      ),
    );
  }
}
