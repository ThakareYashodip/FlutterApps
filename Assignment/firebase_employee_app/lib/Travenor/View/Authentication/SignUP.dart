import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_employee_app/Travenor/Services/FirebaseServices/AuthFirebase.dart';
import 'package:firebase_employee_app/Travenor/Services/essentials_custom.dart';
import 'package:firebase_employee_app/Travenor/View/Authentication/SignIn.dart';
import 'package:flutter/material.dart';

class SingUpTravenor extends StatefulWidget {
  const SingUpTravenor({super.key});

  @override
  State<SingUpTravenor> createState() => _SingUpTravenorState();
}

class _SingUpTravenorState extends State<SingUpTravenor> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  var _isVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: EssentialsCustom().custom_Text(
                      msg: "Sign up now",
                      size: 26,
                      color: Colors.black,
                      fontweight: FontWeight.w600),
                ),
                Center(
                  child: EssentialsCustom().custom_Text(
                      msg: "Please fill the details and create account",
                      size: 16,
                      color: Color.fromRGBO(125, 132, 141, 1)),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Email",
                    fillColor: Color.fromRGBO(247, 247, 249, 1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.black,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address.';
                    } else if (!value.contains('@')) {
                      return 'Please enter a valid email address.';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: '* * * * * * * *',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(Icons.password_outlined),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisibility = !_isVisibility;
                        });
                      },
                      icon: _isVisibility
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility_outlined),
                    ),
                  ),
                  obscureText: _isVisibility,
                  maxLength: 16,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 8) {
                      return "Password should be at least 8 characters";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: '* * * * * * * *',
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: const Icon(Icons.password_outlined),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisibility = !_isVisibility;
                        });
                      },
                      icon: _isVisibility
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility_outlined),
                    ),
                  ),
                  obscureText: _isVisibility,
                  maxLength: 16,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please re-enter your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                EssentialsCustom().custom_Text(
                  msg: "Password should be at least 8 characters",
                  size: 14,
                  color: Color.fromRGBO(125, 132, 141, 1),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      try {
                        AuthFirebase().signUp(
                            context: context,
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim());

                        _emailController.clear();
                        _passwordController.clear();
                        _confirmPasswordController.clear();
                      } on FirebaseAuthException catch (e) {
                        // Handle Firebase Authentication errors
                        print(
                            'Firebase Authentication error: ${e.code} - ${e.message}');
                        // Display error message to the user
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error: ${e.message}')),
                        );
                      } catch (e) {
                        // Log unexpected errors
                        print('Unexpected error: $e');
                        // Display a generic error message to the user
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('An unexpected error occurred')),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 50),
                    backgroundColor: Color.fromRGBO(13, 110, 253, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: EssentialsCustom().custom_Text(
                        msg: "Sign Up",
                        size: 16,
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontweight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: EssentialsCustom().custom_Text(
                      msg: "Or connect",
                      size: 16,
                      color: Color.fromRGBO(125, 132, 141, 1)),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          "https://w7.pngwing.com/pngs/837/109/png-transparent-facebook-2020-1-hd-logo-thumbnail.png",
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          "https://w7.pngwing.com/pngs/398/444/png-transparent-instagram-thumbnail.png",
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          "https://w7.pngwing.com/pngs/59/223/png-transparent-bird-tweet-twitter-twitter-logo-social-media-icon-thumbnail.png",
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
