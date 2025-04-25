import 'package:firebase/Recipes/GetX/AppController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final AppController _controller = Get.put(AppController());

   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text('Logged In: ${_controller.isLoggedIn}'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _controller.setIsLoggedIn(true),
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
