import 'package:flutter/material.dart';
import 'package:netflix_part1/Authentication/NetFlixLandingPage1.dart';
import 'package:netflix_part1/DashBoard/HomeScreen.dart';

class ProfilesAndMore extends StatefulWidget {
  const ProfilesAndMore({super.key});

  @override
  State createState() => _ProfileAndMore();
}

class _ProfileAndMore extends State {
  
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profiles & More',
          style: TextStyle(
            fontSize: 20 , fontWeight: FontWeight.w300 , color: Colors.white , fontFamily: 'Montserrat',
          ),
          ),
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: const Icon(Icons.arrow_back_ios_new,color: Colors.white,size : 20));
        }),
      ),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context , MaterialPageRoute(builder: (context) => const HomeScreen()));
                    },
                    child:  Column(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.asset("assets/UserIcons/drawing-anime-character-with-hoodie-it_1308172-177478.avif",
                          fit: BoxFit.cover,),
                        ),
                        const SizedBox(height: 10),
                        const Text("Ganu",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color:Colors.white,fontFamily: "Montserrat"),),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context , MaterialPageRoute(builder: (context) => const HomeScreen()));
                    },
                    child:  Column(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.asset("assets/UserIcons/picture-boy-with-red-background_969863-279244.avif",
                          fit: BoxFit.cover,),
                        ),
                        const SizedBox(height: 10),
                        const Text("Yashodip",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color:Colors.white,fontFamily: "Montserrat"),),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context , MaterialPageRoute(builder: (context) => const HomeScreen()));
                    },
                    child:  Column(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.asset("assets/UserIcons/boy-with-hoodie-that-says-hes-boy_1002151-24837.avif",
                          fit: BoxFit.cover,),
                        ),
                        const SizedBox(height: 10),
                        const Text("Bhushan",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color:Colors.white,fontFamily: "Montserrat"),),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context , MaterialPageRoute(builder: (context) => const HomeScreen()));
                    },
                    child:  Column(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.asset("assets/UserIcons/cartoon-man-with-blue-jacket-blue-jacket_983286-5842.avif",
                          fit: BoxFit.cover,),
                        ),
                        const SizedBox(height: 10),
                        const Text("Sunny",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color:Colors.white,fontFamily: "Montserrat"),),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context , MaterialPageRoute(builder: (context) => const HomeScreen()));
                    },
                    child:  Column(
                      children: [
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: Image.asset("assets/UserIcons/spiderman-figure-wallpaper_1198708-12521.avif",
                          fit: BoxFit.cover,),
                        ),
                        const SizedBox(height: 10),
                        const Text("Spiderman",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w300,color:Colors.white,fontFamily: "Montserrat"),),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 45,),
               Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.edit_rounded,color: Colors.white,),
                  GestureDetector(
                    onTap: (){},
                    child: const Text(
                      "Manage Profiles",
                      style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white,fontFamily: "Montserrat"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 45,),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 91, 72, 66)
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Icon(Icons.notifications_none_outlined,color: Colors.white,size: 35,),
                      GestureDetector(
                        onTap: (){},
                        child: const Text(
                          "Notifications",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "Montserrat"),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 35,),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 91, 72, 66)
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Icon(Icons.list,color: Colors.white,size: 35,),
                      GestureDetector(
                        onTap: (){},
                        child: const Text(
                          "My List",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "Montserrat"),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 35,),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 91, 72, 66)
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Icon(Icons.settings,color: Colors.white,size: 35,),
                      GestureDetector(
                        onTap: (){},
                        child: const Text(
                          "App Settings",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "Montserrat"),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 35,),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 91, 72, 66)
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Icon(Icons.person_outline,color: Colors.white,size: 35,),
                      GestureDetector(
                        onTap: (){},
                        child: const Text(
                          "Account",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "Montserrat"),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 35,),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Container(
                height: 60,
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 91, 72, 66)
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Icon(Icons.help_outline,color: Colors.white,size: 35,),
                      GestureDetector(
                        onTap: (){},
                        child: const Text(
                          "Help",
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "Montserrat"),
                        ),
                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,size: 35,),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context , MaterialPageRoute(builder: (context) => const NetFlixLandingPage1()));
                },
                child:  const Text(
                  "Sign Out",
                  style: TextStyle(
                    fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white,fontFamily: "Montserrat"
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}