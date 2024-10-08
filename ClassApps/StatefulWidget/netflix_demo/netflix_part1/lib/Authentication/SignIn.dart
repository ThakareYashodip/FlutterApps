import 'package:flutter/material.dart';
import 'package:netflix_part1/Authentication/userSelection.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State createState() => _SignInState();
}

class _SignInState extends State {

  TextEditingController emailOrPhone = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/NetFlixLogo/Netflix02.png',height: 100,width: 150,),
        leading: Builder(builder: (BuildContext context){
          return IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            icon: const Icon(Icons.arrow_back_ios_rounded,size: 30,color: Colors.white,));
        },),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50,),
            SizedBox(
              width: 320,
              height: 60,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                  filled: true,
                  fillColor: Colors.brown,
                  hintText: "Email or phone number",
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "Montserrat"),
                ),
                style: const TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "Montserrat"),
              ),
            ),
            SizedBox(
              width: 320,
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15), 
                  ),
                  filled: true,
                  fillColor: Colors.brown,
                  hintText: "Password",
                  hintStyle: const TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "Montserrat"),
                ),
                style: const TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.bold,fontFamily: "Montserrat"),
              ),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => const userSelection()));
              },
              child: Container(
                width: 320,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(width: 2,color: Colors.white),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(
                  child: Text("Sign In",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.white,fontFamily: "Montserrat"),
                ),),
              ),
            ),
            const SizedBox(height: 40,),
            GestureDetector(
              onTap: () {
                print("Need Help?");
              },
              child: const Center(
                child: Text("Need help?",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.white,fontFamily: "Montserrat"),
              ),),
            ),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                print("Pressed Sign Up Now");
              },
              child: const Center(
                child: Text("New to Netflix? Sign up now",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color:Colors.white,fontFamily: "Montserrat"),
              ),),
            ),
            const SizedBox(
              height: 40,
            ),
            const Center(
                child: Text("Sign in is protected by Google",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color:Colors.white,fontFamily: "Montserrat"),
              ),),
             const SizedBox(
              height: 5,
            ),
            const Center(
                child: Text("reCAPTCHA to ensure you're not a bot.",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color:Colors.white,fontFamily: "Montserrat"),
              ),),
             const SizedBox(
              height: 5,
            ),
            const Center(
                child: Text("Learn more.",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color:Colors.white,fontFamily: "Montserrat"),
              ),),
          ],
        ),
      ),
    );
  }
}