import 'package:firebase/Recipes/GetX/AppController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final AppController _controller = Get.put(AppController());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text('Counter: ${_controller.counter}'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _controller.incrementCounter,
              child: Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }
}
