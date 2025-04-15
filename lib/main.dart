import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import 'package:real_estate_ui_tutorial/screens/login.dart';
=======
import 'package:real_estate_ui_tutorial/screens/Login.dart';
import 'package:real_estate_ui_tutorial/screens/onboarding.dart';
>>>>>>> 183750e32d7b4266bdcca5a8ca7fbf31d2f21a93

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff35573B),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(),
        primaryColor: const Color(0xff35573B),
      ),
<<<<<<< HEAD
      home: const LoginPage(),
=======
      home: OnboardingPage(),
>>>>>>> 183750e32d7b4266bdcca5a8ca7fbf31d2f21a93
    );
  }
}
