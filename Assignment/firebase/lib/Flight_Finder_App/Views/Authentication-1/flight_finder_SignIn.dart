import 'package:firebase/Flight_Finder_App/Services/Firebase_services/firebase_auth.dart';
import 'package:firebase/Flight_Finder_App/Services/SharedPreferences/SharedPreferences.dart';
import 'package:firebase/Flight_Finder_App/Views/Authentication-1/flight_Finder_SignUp.dart';
import 'package:firebase/Flight_Finder_App/Views/Essential/BottomNavigationController.dart';
import 'package:firebase/Flight_Finder_App/Views/Essential/Custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlightFinderSignin extends StatefulWidget {
  const FlightFinderSignin({super.key});

  @override
  State<FlightFinderSignin> createState() => _FlightFinderSigninState();
}

class _FlightFinderSigninState extends State<FlightFinderSignin> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
                SizedBox(height: Utilities.screenHeight * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 30,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          Get.to(() => BottomNavigationView());
                        },
                        child: const ResponsiveText(
                            text: "Skip",
                            fontSize: 22,
                            fontColor: Color.fromARGB(255, 57, 143, 255),
                            fontWeight: FontWeight.w600))
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                const ResponsiveText(
                  text: "Sign In",
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
                SizedBox(
                  width: screenWidth,
                  child: TextFormField(
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
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: screenWidth,
                  child: TextFormField(
                    controller: _passwordController,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromRGBO(0, 0, 0, 1),
                    ),
                    obscureText: _isVisible,
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: const TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            _isVisible = !_isVisible;
                            setState(() {});
                          },
                          icon: Icon(
                            _isVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
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
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: screenWidth,
                  height: 50,
                  child: GestureDetector(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        FirebaseAuthService()
                            .signIn(
                                _emailController.text, _passwordController.text)
                            .then((value) {
                          _emailController.clear();
                          _passwordController.clear();
                          Sharedpreferences()
                              .saveData(_emailController.text, true);
                        });
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (_) {
                          return BottomNavigationView();
                        }));
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(0, 100, 210, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      // ignore: prefer_const_constructors
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: const [
                          ResponsiveText(
                            text: "Sign In",
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
                ),
                const SizedBox(
                  height: 20,
                ),
                // ignore: prefer_const_constructors
                Center(
                  child: const Center(
                    child: ResponsiveText(
                      text: "Or Sign Up With ",
                      fontSize: 14,
                      fontColor: Color.fromRGBO(128, 128, 128, 1),
                      fontWeight: FontWeight.w500,
                    ),
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
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(20),
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
                  spacing: 5,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Center(
                      child: ResponsiveText(
                        text: "Don't have an account",
                        fontSize: 14,
                        fontColor: Color.fromRGBO(128, 128, 128, 1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const FlightFinderSignup());
                      },
                      // ignore: prefer_const_constructors
                      child: ResponsiveText(
                        text: "Sign Up",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontColor: const Color.fromRGBO(0, 100, 210, 1),
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
