// import 'dart:developer';

// import 'package:firebase/FirebaseLearning/dashboard.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// class LoginPagState extends StatefulWidget {
//   const LoginPagState({super.key});

//   @override
//   State<LoginPagState> createState() => _LoginPagStateState();
// }

// class _LoginPagStateState extends State<LoginPagState> {
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   bool _isLogin = true;
//   bool _isVisible = true;

//   Future<void> _login() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: _emailController.text,
//           password: _passwordController.text,
//         );
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (_) {
//               return const Dashboard();
//             },
//           ),
//         );
//       } on FirebaseAuthException catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//               content: Text(
//                   e.message! + FirebaseAuth.instance.currentUser.toString())),
//         );
//       }
//     }
//   }

//   Future<void> _signUp() async {
//     if (_formKey.currentState!.validate()) {
//       try {
//         UserCredential userCredential =
//             await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: _emailController.text,
//           password: _passwordController.text,
//         );
//         String userId = userCredential.user!.uid;
//         log(userId);
//         await _addData(userId);
//       } on FirebaseAuthException catch (e) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(e.message!)),
//         );
//       }
//     }
//   }

//   Future<void> _addData(String userId) async {
//     await FirebaseFirestore.instance.collection("users").add({
//       'timestamp': Timestamp.now(),
//       'user_id': userId,
//       'emailId': _emailController.text,
//       'password': _passwordController.text
//     });
//     log("Data Updated...");
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('User registered successfully!')),
//     );
//     setState(() {
//       _emailController.clear();
//       _passwordController.clear();
//     });
//   }

//   Future<void> _getData() async {
//     log("Get Data");
//     try {
//       // Fetch the users collection
//       QuerySnapshot querySnapshot =
//           await FirebaseFirestore.instance.collection("users").get();

//       // Check if there are any documents
//       if (querySnapshot.docs.isNotEmpty) {
//         // Log the first document's data
//         log("First document data: ${querySnapshot.docs.first.data()}");

//         // Update the text controller with the email (assuming the document has an 'email' field)
//         _emailController.text = querySnapshot.docs.first['emailId'] ?? '';
//         _passwordController.text = querySnapshot.docs.first['password'] ?? '';
//       } else {
//         log("No documents found in the users collection.");
//       }
//     } catch (e) {
//       log("Error fetching data: $e");
//     } finally {
//       // Update the state regardless of success or failure
//       setState(() {});
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value!.isEmpty || !value.contains('@')) {
//                     return 'Invalid email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: _isVisible,
//                 decoration: InputDecoration(
//                     labelText: 'Password',
//                     border: const OutlineInputBorder(),
//                     suffixIcon: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             _isVisible = !_isVisible;
//                           });
//                         },
//                         icon: Icon(_isVisible
//                             ? Icons.visibility_off
//                             : Icons.visibility))),
//                 validator: (value) {
//                   if (value!.isEmpty || value.length < 6) {
//                     return 'Invalid password';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _isLogin ? _login : _signUp,
//                 style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(
//                     Colors.blue.withOpacity(1),
//                   ),
//                 ),
//                 child: Text(
//                   _isLogin ? 'Login' : 'Sign Up',
//                   style: const TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   setState(() {
//                     _isLogin = !_isLogin;
//                   });
//                 },
//                 child: Text(
//                   _isLogin
//                       ? 'Don\'t have an account? Sign Up'
//                       : 'Already have an account? Login',
//                   style: const TextStyle(fontSize: 16, color: Colors.blue),
//                 ),
//               ),
//               TextButton(
//                 onPressed: () {
//                   _isLogin ? _getData() : _addData(_emailController.text);
//                 },
//                 child: Text(_isLogin ? "Get Data" : "Add Data"),
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: () async {
//         await FirebaseAuth.instance.signInAnonymously();
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
//           return const Dashboard();
//         }));
//       }),
//     );
//   }
// }
