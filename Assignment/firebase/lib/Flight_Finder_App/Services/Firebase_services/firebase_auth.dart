import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Creates a new user with the given email and password.
  ///
  /// Throws a [FirebaseAuthException] if the operation fails.
  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      log("Sign Up Successfully ...");
    } on FirebaseAuthException catch (e) {
      log("Sign Up Failed: ${e.message}");
      rethrow;
    }
  }

  /// Signs in the user with the given email and password.
  ///
  /// Throws a [FirebaseAuthException] if the operation fails.
  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      log("Sign In Successfully ...");
    } on FirebaseAuthException catch (e) {
      log("Sign In Failed: ${e.message}");
      rethrow;
    }
  }
}
