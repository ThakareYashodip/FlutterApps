import 'package:shared_preferences/shared_preferences.dart';

class customSharedPreference{

  static bool? isLogic;
  static String? email;

  static void setData({required bool isLogindata, required String emailID}) async {
    SharedPreferences ref  = await SharedPreferences.getInstance();
    ref.setBool('isLogin', isLogindata);
    ref.setString("EmailID",emailID);
  }

  static void getData() async {
    SharedPreferences ref  = await SharedPreferences.getInstance();
    ref.getBool('isLogin');
    ref.getString('EmailID');
  }
}