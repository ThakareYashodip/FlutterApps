import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_employee_app/Travenor/Services/FirebaseServices/AuthFirebase.dart';
import 'package:firebase_employee_app/Travenor/Services/essentials_custom.dart';
import 'package:firebase_employee_app/Travenor/View/Authentication/ForgotPass.dart';
import 'package:firebase_employee_app/Travenor/View/Authentication/SignUP.dart';
import 'package:flutter/material.dart';

class SignInTravenor extends StatefulWidget {
  const SignInTravenor({super.key});

  @override
  State<SignInTravenor> createState() => _SignInTravenorState();
}

class _SignInTravenorState extends State<SignInTravenor> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  var _isVisibility = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: EssentialsCustom().custom_Text(
                      msg: "Sign in now", size: 26, color: Colors.black),
                ),
                Center(
                  child: EssentialsCustom().custom_Text(
                      msg: "Please sign in to continue our app",
                      size: 16,
                      color: Color.fromRGBO(125, 132, 141, 1)),
                ),
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
                TextFormField(
                  controller: _passwordController,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                    labelText: '* * * * * * * *',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    prefixIcon: Icon(Icons.password_outlined),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVisibility = !_isVisibility;
                        });
                      },
                      icon: _isVisibility
                          ? Icon(Icons.visibility_off_outlined)
                          : Icon(Icons.visibility_outlined),
                    ),
                  ),
                  obscureText: _isVisibility,
                  maxLength: 16,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return "Password should be at least 6 characters";
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return PasswordResetPage();
                            },
                          ),
                        );
                      },
                      child: EssentialsCustom().custom_Text(
                        msg: "Forgot password?",
                        size: 16,
                        color: Color.fromRGBO(13, 110, 253, 1),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      try {
                        AuthFirebase().signIn(
                          context: context,
                          email: _emailController.text.trim(),
                          password: _passwordController.text.trim(),
                        );
                        _emailController.clear();
                        _passwordController.clear();

                        // Navigator.pushReplacement(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const SignInTravenor(),
                        //   ),
                        // );
                      } on FirebaseException catch (e) {
                        // Handle Firebase-specific exceptions
                        if (e.code == 'invalid-email') {
                          // Handle invalid email error
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Invalid email')),
                          );
                        } else if (e.code == 'wrong-password') {
                          // Handle wrong password error
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Wrong password')),
                          );
                        } else {
                          // Handle other Firebase exceptions
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Error signing in')),
                          );
                        }
                      } catch (e) {
                        // Handle other exceptions
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error signing in')),
                        );
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 50),
                    backgroundColor: Color.fromRGBO(13, 110, 253, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: EssentialsCustom().custom_Text(
                        msg: "Sign In",
                        size: 16,
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontweight: FontWeight.w600),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    EssentialsCustom().custom_Text(
                        msg: "Don't have any account",
                        size: 16,
                        color: Color.fromRGBO(125, 132, 141, 1)),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SingUpTravenor(),
                          ),
                        );
                      },
                      child: EssentialsCustom().custom_Text(
                        msg: "Sign up",
                        size: 16,
                        color: Color.fromRGBO(13, 110, 253, 1),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: EssentialsCustom().custom_Text(
                      msg: "Or connect",
                      size: 16,
                      color: Color.fromRGBO(125, 132, 141, 1)),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          "https://w7.pngwing.com/pngs/837/109/png-transparent-facebook-2020-1-hd-logo-thumbnail.png",
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          "https://w7.pngwing.com/pngs/398/444/png-transparent-instagram-thumbnail.png",
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: ClipOval(
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                          "https://w7.pngwing.com/pngs/59/223/png-transparent-bird-tweet-twitter-twitter-logo-social-media-icon-thumbnail.png",
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
