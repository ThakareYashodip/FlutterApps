import 'package:firebase_employee_app/Travenor/Services/essentials_custom.dart';
import 'package:flutter/material.dart';

import '../../Services/FirebaseServices/AuthFirebase.dart';

class PasswordResetPage extends StatefulWidget {
  @override
  _PasswordResetPageState createState() => _PasswordResetPageState();
}

class _PasswordResetPageState extends State<PasswordResetPage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 20,
            children: [
              const SizedBox(
                height: 100,
              ),
              EssentialsCustom().custom_Text(
                msg: 'Reset Password Here',
                size: 20,
                fontweight: FontWeight.w600,
              ),
              EssentialsCustom().custom_Text(
                msg:
                    'Enter your email address to receive a password reset link.',
                size: 18,
                fontweight: FontWeight.w600,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  fillColor: Color.fromRGBO(247, 247, 249, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email address.';
                  } else if (!value.contains('@')) {
                    return 'Please enter a valid email address.';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    try {
                      AuthFirebase().resetPassword(
                        context: context,
                        email: _emailController.text.trim(),
                      );
                      _emailController.clear();
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error: $e'),
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(13, 110, 253, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Center(
                  child: EssentialsCustom().custom_Text(
                      msg: "Reset Password",
                      size: 16,
                      color: Colors.white,
                      fontweight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
