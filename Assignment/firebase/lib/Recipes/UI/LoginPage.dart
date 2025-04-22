import 'dart:developer';

import 'package:firebase/FirebaseLearning/dashboard.dart';
import 'package:firebase/Recipes/Services/FirebaseServices.dart';
import 'package:firebase/Recipes/UI/DashBoard.dart';
import 'package:firebase/Recipes/UI/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Future<UserCredential?> login(String emailID, String password) async {
      try {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailID,
          password: password,
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const RecipeDashBoard();
            },
          ),
        );
        log("${userCredential.user} login success...");
        return userCredential;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User not found.')),
          );
          log('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Wrong password.')),
          );
          log('Wrong password provided for that user.');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message.toString())),
          );
          log('Error: ${e.message}');
        }
        return null;
      } catch (e) {
        log('An error occurred: $e');
        return null;
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Blue Section
            Container(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              height: height * 0.30,
              width: width,
              color: const Color.fromARGB(255, 2, 4, 49),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Log In",
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Please sign in to your existing account",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            // Form Section
            Container(
              height: height * 0.70,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      "EMAIL",
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        fillColor: Colors.purple[200],
                        hintText: "example@gmail.com",
                        hintStyle: const TextStyle(color: Colors.black38),
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "PASSWORD",
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _isObscure,
                      maxLength: 12,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: "* * * * * * * * * * * * * *",
                        hintStyle: const TextStyle(color: Colors.black38),
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isObscure
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
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
                    const SizedBox(height: 30),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Perform login logic
                            login(_emailController.text,
                                _passwordController.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Logging in...'),
                              ),
                            );
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
                          "LOG IN",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.indigo, fontSize: 18),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return const SignUp();
                                },
                              ),
                            );
                          },
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 255, 128, 0)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
