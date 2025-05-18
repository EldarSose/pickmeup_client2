import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeRed = const Color(0xFFDB2A2A);
    final screenHeight = MediaQuery.of(context).size.height;

    // Scale factor to shrink widgets on small screens
    double scale = screenHeight / 800; // 800 is base design height
    if (scale > 1) scale = 1;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Top-right curve
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 100 * scale,
              height: 100 * scale,
              decoration: BoxDecoration(
                color: themeRed,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100 * scale),
                ),
              ),
            ),
          ),

          // Bottom-left curve
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: 80 * scale,
              height: 80 * scale,
              decoration: BoxDecoration(
                color: themeRed,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(80 * scale),
                ),
              ),
            ),
          ),

          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24 * scale),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 32 * scale,
                      fontWeight: FontWeight.bold,
                      color: themeRed,
                    ),
                  ),
                  SizedBox(height: 10 * scale),
                  Text(
                    'Login to find your taxi.',
                    style: TextStyle(
                      fontSize: 14 * scale,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 30 * scale),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Username',
                      style: TextStyle(color: Colors.red, fontSize: 14 * scale),
                    ),
                  ),
                  SizedBox(height: 6 * scale),
                  TextField(
                    style: TextStyle(fontSize: 14 * scale),
                    decoration: InputDecoration(
                      hintText: 'Enter Username',
                      border: const OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10 * scale,
                        horizontal: 12 * scale,
                      ),
                    ),
                  ),
                  SizedBox(height: 20 * scale),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: TextStyle(color: Colors.red, fontSize: 14 * scale),
                    ),
                  ),
                  SizedBox(height: 6 * scale),
                  TextField(
                    obscureText: true,
                    style: TextStyle(fontSize: 14 * scale),
                    decoration: InputDecoration(
                      hintText: 'Enter Password',
                      border: const OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 10 * scale,
                        horizontal: 12 * scale,
                      ),
                    ),
                  ),
                  SizedBox(height: 8 * scale),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(fontSize: 12 * scale),
                      ),
                    ),
                  ),
                  SizedBox(height: 10 * scale),
                  SizedBox(
                    width: double.infinity,
                    height: 45 * scale,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const HomeScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: Text(
                        'LOGIN',
                        style: TextStyle(fontSize: 16 * scale, color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 20 * scale),
                  FittedBox(
                      child: socialButton(
                        'Continue with Facebook',
                        'assets/facebook.png',
                        scale,
                    ),
                  ),
                  SizedBox(height: 10 * scale),
                  FittedBox(
                      child: socialButton(
                        'Continue with Google',
                        'assets/google.png',
                        scale
                      ),
                  ),
                  SizedBox(height: 20 * scale),
                  Text(
                    'By continuing, you agree to our\nTerms and Conditions and have read our Privacy Policy.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 10 * scale,
                    ),
                  ),
                  SizedBox(height: 16 * scale),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignupScreen()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                          fontSize: 14 * scale,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: 'Sign up',
                            style: TextStyle(
                              color: themeRed,
                              fontWeight: FontWeight.bold,
                              fontSize: 14 * scale,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget socialButton(String text, String iconPath, double scale) {
    return Container(
      height: 55 * scale,
      width: 270 * scale,
      padding: EdgeInsets.symmetric(horizontal: 12 * scale),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(iconPath, height: 20 * scale, width: 20 * scale),
          SizedBox(width: 10 * scale),
          Text(text, style: TextStyle(fontSize: 16 * scale)),
        ],
      ),
    );
  }
}
