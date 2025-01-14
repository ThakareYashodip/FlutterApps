// import 'package:firebase/FirebaseLearning/login.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';

// class Dashboard extends StatefulWidget {
//   const Dashboard({super.key});

//   @override
//   State<Dashboard> createState() => _DashboardState();
// }

// class _DashboardState extends State<Dashboard> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard , Welcome Back '),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: ClipOval(
//           clipBehavior: Clip.antiAlias,
//           child: Image.network(
//             'https://previews.123rf.com/images/starlineart/starlineart1811/starlineart181100075/146198058-christmas-tree-creative-design-background.jpg',
//             width: 250,
//             height: 250,
//             fit: BoxFit.fill,
//             errorBuilder: (context, error, stackTrace) {
//               return const Text('Failed to load image');
//             },
//             loadingBuilder: (context, child, loadingProgress) {
//               if (loadingProgress == null) return child;
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: () async {
//         await FirebaseAuth.instance.signOut();
//         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
//           return const LoginPagState();
//         }));
//       }),
//     );
//   }
// }
