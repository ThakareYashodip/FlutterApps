import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControllerGetx extends GetxController {
  RxInt selectedIndexTab = 0.obs;
  void updateIndex(int index) {
    selectedIndexTab.value = index;
  }

  var name = ''.obs;
  var email = ''.obs;
  var subject = ''.obs;
  var message = ''.obs;

  // Add TextEditingControllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final subjectController = TextEditingController();
  final messageController = TextEditingController();

  void clearForm() {
    name.value = '';
    email.value = '';
    subject.value = '';
    message.value = '';
    nameController.clear();
    emailController.clear();
    subjectController.clear();
    messageController.clear();
  }
}
