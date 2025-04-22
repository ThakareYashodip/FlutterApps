import 'package:flutter/material.dart';

class login_view extends StatelessWidget {
  const login_view({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            10,
            (index) => const Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                "Welcome to our app",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
