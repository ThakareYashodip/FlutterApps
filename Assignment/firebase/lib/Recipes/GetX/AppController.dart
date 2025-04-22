import 'package:get/get.dart';

class AppController extends GetxController {
  final _counter = 0.obs;
  final _username = ''.obs;
  final _isLoggedIn = false.obs;

  int get counter => _counter.value;
  String get username => _username.value;
  bool get isLoggedIn => _isLoggedIn.value;

  void incrementCounter() {
    _counter.value++;
  }

  void setUsername(String username) {
    _username.value = username;
  }

  void setIsLoggedIn(bool isLoggedIn) {
    _isLoggedIn.value = isLoggedIn;
  }
}
