import 'package:flutter/material.dart';
import 'package:professional_login_pages/Services/scaffoldMessenger.dart';

import 'homePage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameTextController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 34, 35),
      body: Padding(
        padding: const EdgeInsets.only(top: 100, left: 40, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.arrow_back_outlined,
              size: 24,
              color: Colors.white,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Log In",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 100),
            TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              controller: _nameTextController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Colors.white,
                ),
              ),
              validator: (value) {
                if (value == null && value!.isEmpty) {
                  return 'Please enter your name';
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
              ),
              validator: (value) {
                if (value == null && value!.isEmpty) {
                  return 'Please enter password';
                } else if (value!.length < 6) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 100,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return const Loginpage();
                      },
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      if (_nameTextController.text.isNotEmpty &&
                          _passwordController.text.isNotEmpty) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return const Homepage();
                            },
                          ),
                        );
                      } else {
                        return scaffoldMessngerCustom(
                            "Error : Invalid Credentials...", context);
                      }
                    },
                    child: Center(
                      child: Text(
                        "Log in",
                        style: TextStyle(
                            fontSize: 26,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "First time here ?",
                  style: TextStyle(
                      fontSize: 16,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.w600),
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
