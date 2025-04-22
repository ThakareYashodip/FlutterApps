import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_employee_app/InheritedWidgetLearning/View/Services/InheritedWidgetRefresh_custom.dart';
import 'package:firebase_employee_app/InheritedWidgetLearning/View/LoginDetailsInheritedWidget.dart';
import 'package:flutter/material.dart';

class InheritedWidgetLogin extends StatefulWidget {
  const InheritedWidgetLogin({super.key});

  @override
  State<InheritedWidgetLogin> createState() => _InheritedWidgetLoginState();
}

class _InheritedWidgetLoginState extends State<InheritedWidgetLogin> {
  final emailTextController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _addData(String email, String password) async {
    try {
      InheritedWidgetRefreshcustom.of(context).email = email;
      InheritedWidgetRefreshcustom.of(context).password = password;

      Map<String, dynamic> data = {'email': email, 'password': password};
      await FirebaseFirestore.instance
          .collection("InheritedWidgetLearning")
          .add(data);
    } on FirebaseException catch (e) {
      return log(e.message ?? 'An error occurred');
    } catch (e) {
      return log('An unexpected error occurred');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                const SizedBox(
                  height: 300,
                ),
                TextFormField(
                  controller: emailTextController,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  decoration: const InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person_4_outlined)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passwordController,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password_outlined)),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return "Password should be at least 6 characters";
                    }
                    return null;
                  },
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _addData(
                          emailTextController.text, passwordController.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) {
                            return const LoginDetailsInheritedWidget();
                          },
                        ),
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.login,
                    color: Colors.black,
                    size: 20,
                  ),
                  style: ButtonStyle(
                    minimumSize: WidgetStateProperty.all(
                      const Size(200, 50),
                    ),
                    backgroundColor: WidgetStateProperty.all(
                      const Color.fromARGB(255, 208, 234, 255),
                    ),
                  ),
                  label: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return const LoginDetailsInheritedWidget();
              },
            ),
          );
        },
        backgroundColor: Colors.blue[200],
        child: Text(
          "SKIP",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
