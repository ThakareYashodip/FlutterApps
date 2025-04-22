import 'dart:developer';

import 'package:firebase/Recipes/Services/FirebaseServices.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    signUp(String userName, String emailId, String password) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: emailId, password: password);

        String userID = userCredential.user!.uid;
        await FirebaseFirestore.instance
            .collection("RecipeApp Users")
            .doc(userID)
            .set({
          'UserName': userName,
          'EmailId': emailId,
          'Password': password,
          'TimeStamp': Timestamp.now(),
        });
        log("$userCredential account created...");
        return userCredential;
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message.toString())),
        );
        log('Error: ${e.message}');
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.30,
              width: width,
              color: const Color.fromARGB(255, 2, 4, 49),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                    const Center(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Center(
                      child: Text(
                        "Please sign up to get started",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              height: height * 0.70,
              width: width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "NAME",
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                      fillColor: Colors.purple[200],
                      hintText: "Bill Gates",
                      hintStyle: const TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "EMAIL",
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      fillColor: Colors.purple[200],
                      hintText: "example@gmail.com",
                      hintStyle: const TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains("@")) {
                        return 'Please enter a valid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "PASSWORD",
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _isObscure,
                    maxLength: 12,
                    decoration: InputDecoration(
                      hintText: "* * * * * * * * * * * * * *",
                      hintStyle: const TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  const Text(
                    "RE-TYPE PASSWORD",
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: rePasswordController,
                    obscureText: _isObscure,
                    maxLength: 12,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please re-enter your password';
                      } else if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.purple[200],
                      hintText: "Re-enter your password",
                      hintStyle: const TextStyle(color: Colors.black38),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscure ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Perform login logic
                        if (rePasswordController.text ==
                            _passwordController.text) {
                          signUp(nameController.text, _emailController.text,
                              _passwordController.text);
                          nameController.clear();
                          _emailController.clear();
                          _passwordController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Signing up...'),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Password is not matched...'),
                          ));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 15),
                          minimumSize: Size(width, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 128, 0)),
                      child: const Text(
                        "SIGN UP",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
