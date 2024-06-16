import 'package:flutter/material.dart';
import 'create_account_page.dart'; // going to redirect
import 'home_page.dart'; // going to redirect

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
// ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}
// that page is stateful because of the password visible/unvisible option
class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true; // variable for set password text is shown or not shown
  var chckBx = true; // var for checkBox. 

  void _togglePasswordVisibility() { // toggle function for password visibility
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( // puts in safe area(under the notch of the phone)
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset( // background placed
              'assets/Background.png',
              fit: BoxFit.fill,
            ),
            Column( // created a column and other widgets gonna place inside of that column
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset( // puts logo
                  'assets/Logo.png',
                  width: 150,
                  height: 150,
                ),
                const SizedBox(height: 20), // give space
                Padding( // adds padding to all elements
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Column(
                    children: [
                      TextField( // Textfield for get email address
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
                      TextField(// for password
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
                      Row(// row for place, check box, remember me text and forgot password text
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
                      ElevatedButton( // login now button
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute( // redirect home page
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
                      Row( // row for text don't have account and create button
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?',
                              style: TextStyle(color: Colors.grey[700])),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => // redirect create account page
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
