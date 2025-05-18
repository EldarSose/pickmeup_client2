import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'home_screen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeRed = const Color(0xFFDB2A2A);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Top-right decoration
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: themeRed,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                ),
              ),
            ),
          ),

          // Bottom-left decoration
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: themeRed,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(80),
                ),
              ),
            ),
          ),

          LayoutBuilder(
            builder: (context, constraints) {
              // Scale factor based on screen height
              final double scale = (constraints.maxHeight < 700) ? 0.85 : 1.0;
              final double fontSizeTitle = 32 * scale;
              final double fontSizeLabel = 14 * scale;
              final double spacing = 16 * scale;
              final double buttonHeight = 50 * scale;
              final double inputPadding = 12 * scale;

              return Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24 * scale),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: fontSizeTitle,
                          fontWeight: FontWeight.bold,
                          color: themeRed,
                        ),
                      ),
                      SizedBox(height: spacing),
                      Text(
                        'Sign up to find your taxi',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14 * scale,
                        ),
                      ),
                      SizedBox(height: spacing * 1.5),

                      label('Username', themeRed, fontSizeLabel),
                      inputField(inputPadding),

                      SizedBox(height: spacing),
                      label('Password', themeRed, fontSizeLabel),
                      inputField(inputPadding, isPassword: true),

                      SizedBox(height: spacing),
                      label('Confirm Password', themeRed, fontSizeLabel),
                      inputField(inputPadding, isPassword: true),

                      SizedBox(height: spacing * 1.5),
                      SizedBox(
                        width: double.infinity,
                        height: buttonHeight,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: themeRed,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          child: Text(
                            'SIGN UP',
                            style: TextStyle(fontSize: 16 * scale, color: Colors.white),
                          ),
                        ),
                      ),

                      SizedBox(height: spacing * 1.5),
                      socialButton(
                        'Continue with Facebook',
                        'assets/facebook.png',
                        scale,
                      ),
                      SizedBox(height: spacing * 0.75),
                      socialButton(
                        'Continue with Google',
                        'assets/google.png',
                        scale,
                      ),
                      SizedBox(height: spacing * 1.5),
                      Text(
                        'By continuing, you agree to our\nTerms and Conditions and have read our Privacy Policy.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 10 * scale,
                        ),
                      ),
                      SizedBox(height: spacing),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const LoginScreen(),
                            ),
                          );
                        },
                        child: RichText(
                          text: TextSpan(
                            text: 'Already have an account? ',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14 * scale,
                            ),
                            children: [
                              TextSpan(
                                text: 'Login',
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
                      SizedBox(height: spacing),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget label(String text, Color color, double fontSize) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(text, style: TextStyle(color: color, fontSize: fontSize)),
    );
  }

  Widget inputField(double padding, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: isPassword ? 'Enter Password' : 'Enter Username',
        border: const OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(horizontal: padding),
      ),
    );
  }

  Widget socialButton(String text, String iconPath, double scale) {
    return Container(
      height: 55 * scale,
      width: 270 * scale,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(iconPath, height: 20 * scale, width: 20 * scale),
          SizedBox(width: 10 * scale),
          Text(text, style: TextStyle(fontSize: 16 * scale)),
        ],
      ),
    );
  }
}
