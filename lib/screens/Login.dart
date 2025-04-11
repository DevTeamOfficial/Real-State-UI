import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 152, 172, 153),
      body: SafeArea(
        child: Center(
          child: Column(children: [
            SizedBox(height: 50),
            Icon(
              Icons.lock,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 50),
            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 240, 236, 236),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),

            )),
                
          ]),
        ),
      ),
    );
  }
}
