import 'package:flutter/material.dart';
import 'package:professional_login_pages/View/loginPage.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.circle_outlined,
              size: 100,
              color: Colors.black,
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Start",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            const Text(
              "your",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            const Text(
              "adventure",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 200,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return const Loginpage();
                  }));
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 194, 145, 0),
                    borderRadius: BorderRadius.circular(20),
                  ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "You don't have an account?",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Sign up here",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
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
