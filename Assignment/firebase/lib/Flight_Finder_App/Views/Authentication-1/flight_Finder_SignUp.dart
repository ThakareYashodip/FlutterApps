import 'package:firebase/Flight_Finder_App/Services/Firebase_services/firebase_auth.dart';
import 'package:firebase/Flight_Finder_App/Views/Authentication-1/flight_finder_SignIn.dart';
import 'package:firebase/Flight_Finder_App/Views/Essential/Custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlightFinderSignup extends StatefulWidget {
  const FlightFinderSignup({super.key});

  @override
  State<FlightFinderSignup> createState() => _FlightFinderSignupState();
}

class _FlightFinderSignupState extends State<FlightFinderSignup> {
  @override
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isVisible1 = true;
  bool _isVisible2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                const ResponsiveText(
                  text: "Sign Up",
                  fontSize: 40,
                  fontColor: Color.fromRGBO(13, 22, 52, 1),
                  fontWeight: FontWeight.w500,
                ),
                const ResponsiveText(
                  text: "Start Your Journey with affordable price",
                  fontSize: 14,
                  fontColor: Color.fromRGBO(128, 128, 128, 1),
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  controller: _emailController,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                        .hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _passwordController,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                  obscureText: _isVisible1,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible1 = !_isVisible1;
                          });
                        },
                        icon: Icon(
                          _isVisible1 ? Icons.visibility_off : Icons.visibility,
                          color: Colors.black,
                        )),
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _confirmPasswordController,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                  obscureText: _isVisible2,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isVisible2 = !_isVisible2;
                          });
                        },
                        icon: Icon(
                          _isVisible2 ? Icons.visibility_off : Icons.visibility,
                          color: Colors.black,
                        )),
                    prefixIcon: const Icon(
                      Icons.password_outlined,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your confirm password';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      FirebaseAuthService()
                          .signUp(
                              _emailController.text, _passwordController.text)
                          .then(
                        (value) {
                          _emailController.clear();
                          _passwordController.clear();
                          _confirmPasswordController.clear();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.info, color: Colors.blue),
                                  SizedBox(width: 10),
                                  ResponsiveText(
                                    text: "Account Created Successfully ... ",
                                    fontSize: 16,
                                    fontColor: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ),
                          );
                          Get.back();
                        },
                      );
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 100, 210, 1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        ResponsiveText(
                          text: "Sign Up",
                          fontSize: 16,
                          fontColor: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        Icon(
                          Icons.check_circle_outline,
                          color: Colors.white,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Center(
                  child: ResponsiveText(
                    text: "Or Sign Up With ",
                    fontSize: 14,
                    fontColor: Color.fromRGBO(128, 128, 128, 1),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: Utilities.screenWidth / 4,
                        width: Utilities.screenWidth / 4,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.g_mobiledata_sharp,
                          size: 50,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: Utilities.screenWidth / 4,
                        width: Utilities.screenWidth / 4,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.facebook_rounded,
                          size: 50,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: Utilities.screenWidth / 4,
                        width: Utilities.screenWidth / 4,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.apple_outlined,
                          size: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ResponsiveText(
                      text: "Allready have an account? ",
                      fontSize: 14,
                      fontColor: Color.fromRGBO(128, 128, 128, 1),
                      fontWeight: FontWeight.w500,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const FlightFinderSignin());
                      },
                      child: const ResponsiveText(
                        text: "Sign In",
                        fontSize: 14,
                        fontColor: Color.fromRGBO(0, 100, 210, 1),
                        fontWeight: FontWeight.w500,
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
