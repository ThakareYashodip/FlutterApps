import 'package:firebase/Recipes/GetX/AppController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  final AppController _controller = Get.put(AppController());

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text('Username: ${_controller.username}'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _controller.setUsername('John Doe'),
              child: Text('Set Username'),
            ),
          ],
        ),
      ),
    );
  }
}
