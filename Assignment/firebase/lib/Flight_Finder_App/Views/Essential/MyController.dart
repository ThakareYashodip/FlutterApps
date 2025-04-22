import 'package:get/get.dart';

class MyController extends GetxController {
  var currentIndex = 0.obs; // Observable index

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
