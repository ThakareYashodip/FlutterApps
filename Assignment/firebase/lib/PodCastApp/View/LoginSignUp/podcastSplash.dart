import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase/PodCastApp/View/DashBoard/PodcastScreen.dart';

class PodcastLogin extends StatefulWidget {
  const PodcastLogin({super.key});

  @override
  State<PodcastLogin> createState() => _PodcastLoginState();
}

class _PodcastLoginState extends State<PodcastLogin> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> _firebaseLogin(LoginData data) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: data.name, password: data.password);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> _firebaseSignUp(SignupData data) async {
    try {
      if (data.name != null && data.password != null) {
        await _auth.createUserWithEmailAndPassword(
            email: data.name!, password: data.password!);
        return null;
      }
      return "Missing email or password";
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> _firebaseRecovery(LoginData data) async {
    try {
      await _auth.sendPasswordResetEmail(email: data.name);
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        title: '🎧 Podcaster',
        messages: LoginMessages(
          userHint: 'Email',
          passwordHint: 'Password',
          confirmPasswordHint: 'Confirm',
          loginButton: 'Sign In',
          signupButton: 'Register',
          forgotPasswordButton: 'Forgot?',
          recoverPasswordButton: 'Recover',
          goBackButton: 'Back',
          recoverPasswordIntro: 'We will send a recovery email.',
          recoverPasswordDescription:
              'Check your inbox and reset your password.',
          recoverPasswordSuccess: 'Recovery Email Sent!',
        ),
        onLogin: _firebaseLogin,
        onSignup: _firebaseSignUp,
        onRecoverPassword: (email) =>
            _firebaseRecovery(LoginData(name: email, password: '')),
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const Podcastscreen()),
          );
        },
        theme: LoginTheme(
          primaryColor: Colors.blueAccent,
          accentColor: Colors.blueAccent,
          errorColor: Colors.redAccent,
          titleStyle: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 32,
            color: Colors.white,
            shadows: [
              Shadow(
                color: Color.fromARGB(66, 227, 96, 96),
                offset: Offset(2, 2),
                blurRadius: 6,
              ),
            ],
          ),
          bodyStyle: const TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 16,
          ),
          cardTheme: const CardTheme(
            color: Colors.white,
            elevation: 20,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            margin: EdgeInsets.only(top: 15),
          ),
          pageColorLight: const Color.fromARGB(255, 255, 79, 35),
          pageColorDark: const Color.fromARGB(255, 20, 114, 255),
          buttonTheme: const LoginButtonTheme(
            backgroundColor: Color.fromARGB(255, 52, 126, 255),
            splashColor: Color.fromARGB(255, 216, 74, 241),
            highlightColor: Colors.white,
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
          beforeHeroFontSize: 16,
          afterHeroFontSize: 14,
          footerBackgroundColor: Colors.white,
          logoWidth: 110,
        ),
      ),
    );
  }
}
