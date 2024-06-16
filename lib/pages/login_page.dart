import 'package:flutter/material.dart';
import 'create_account_page.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
// ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  var chckBx = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/Background.png',
              fit: BoxFit.fill,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Logo.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      TextField(
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
                        obscureText: _obscureText,
                        style: TextStyle(color: Colors.grey[700]),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[900],
                          hintStyle: TextStyle(color: Colors.grey[700]),
                          suffixIconColor: Colors.grey[700],
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: _togglePasswordVisibility,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: chckBx,
                                onChanged: (bool? value) {
                                  setState(() {
                                    chckBx = !chckBx;
                                  });
                                },
                                activeColor: Colors.green,
                                checkColor: Colors.white,
                              ),
                              Text('Remember me',
                                  style: TextStyle(color: Colors.grey[700])),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Forgot password?',
                                style: TextStyle(color: Colors.amber[300])),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber[300],
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: const Text(
                          'Login Now',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?',
                              style: TextStyle(color: Colors.grey[700])),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CreateAccountPage()));
                            },
                            child: Text('Create one',
                                style: TextStyle(color: Colors.amber[300])),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
