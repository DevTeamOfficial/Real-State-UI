import 'package:flutter/material.dart';
import 'package:real_estate_ui_tutorial/components/mybutton.dart';
import 'package:real_estate_ui_tutorial/components/mytextfield.dart';
import 'package:real_estate_ui_tutorial/screens/home.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff35573B),
      body: SafeArea(
        child: Center(
          child: Column(children: [
            SizedBox(height: 50),
            Icon(
              Icons.house_rounded,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 50),
            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 240, 236, 236),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            MyTextField(
              controller: usernameController,
              hintText: "Username",
              obscureText: false,
            ),
            SizedBox(
              height: 50,
            ),
            MyTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Paswword?',
                      style: TextStyle(
                        color: Color.fromARGB(255, 240, 236, 236),
                        fontSize: 15,
                      )),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            //sign in button
            MyButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
          ]),
        ),
      ),
    );
  }
}
