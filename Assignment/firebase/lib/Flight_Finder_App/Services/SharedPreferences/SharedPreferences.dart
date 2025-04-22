import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreferences {
  Future<void> saveData(String userName, bool isActive) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', userName);
    await prefs.setBool('isActive', isActive);
  }

  Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? '';
  }

  Future<bool> getIsActive() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isActive') ?? false;
  }
}
