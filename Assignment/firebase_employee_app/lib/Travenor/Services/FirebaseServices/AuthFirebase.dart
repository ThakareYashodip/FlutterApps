import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_employee_app/Travenor/Services/essentials_custom.dart';
import 'package:flutter/material.dart';

/// Firebase Authentication Service
class AuthFirebase {
  /// Firebase Authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      EssentialsCustom()
          .custom_snackBar(context, msg: "Signed in successfully");
    } on FirebaseAuthException catch (e) {
      EssentialsCustom()
          .custom_snackBar(context, msg: e.message ?? "Sign-in failed");
    }
  }

  Future<void> signUp(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .whenComplete(
        () {
          EssentialsCustom()
              .custom_snackBar(context, msg: "Signed up successfully ... ");
        },
      );
    } on FirebaseAuthException catch (e) {
      EssentialsCustom()
          .custom_snackBar(context, msg: e.message ?? "Sign-up failed");
    }
  }

  Future<void> resetPassword({
    required BuildContext context,
    required String email,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      EssentialsCustom().custom_snackBar(context,
          msg: 'Password reset email sent. Please check your email.');
    } on FirebaseAuthException catch (e) {
      EssentialsCustom().custom_snackBar(context, msg: "Error....");
    }
  }
}
