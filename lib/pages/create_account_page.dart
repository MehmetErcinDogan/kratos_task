import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kratos_task/pages/login_page.dart';
import 'home_page.dart';

class CreateAccountPage extends StatelessWidget {
  CreateAccountPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController= TextEditingController();

// same design structure used with login page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text("Create Account",
                style: TextStyle(
                    color: Colors.amber[300],
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 40,
            ),
            TextField(
              style: TextStyle(color: Colors.grey[700]),
              decoration: InputDecoration(
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[700]),
                fillColor: Colors.grey[900],
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              style: TextStyle(color: Colors.grey[700]),
              decoration: InputDecoration(
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[700]),
                fillColor: Colors.grey[900],
                hintText: 'Surname',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller:_emailController,
              style: TextStyle(color: Colors.grey[700]),
              decoration: InputDecoration(
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[700]),
                fillColor: Colors.grey[900],
                hintText: 'Email Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              style: TextStyle(color: Colors.grey[700]),
              decoration: InputDecoration(
                filled: true,
                hintStyle: TextStyle(color: Colors.grey[700]),
                fillColor: Colors.grey[900],
                hintText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
              try{
                FirebaseAuth.instance.createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                );
              }on FirebaseAuthException catch(e){
                print("Error . . .")
              }
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber[300],
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Create Account',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ))));
  }
}
