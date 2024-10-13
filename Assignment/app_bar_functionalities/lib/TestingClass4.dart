import 'package:flutter/material.dart';

class Testingclass4 extends StatefulWidget {
  const Testingclass4({super.key});

  @override
  State<Testingclass4> createState() => _Testingclass4State();
}

class _Testingclass4State extends State<Testingclass4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network("https://img.freepik.com/free-photo/anime-style-mythical-dragon-creature_23-2151112866.jpg?size=626&ext=jpg&ga=GA1.1.915554636.1727464067&semt=ais_hybrid-rr-similar",height: 150,width: 150,),
            Image.network("https://img.freepik.com/free-photo/halloween-scene-illustration-anime-style_23-2151794318.jpg?size=626&ext=jpg&ga=GA1.1.915554636.1727464067&semt=ais_hybrid-rr-similar",height: 150,width: 150,),
            Image.network("https://img.freepik.com/free-photo/anime-style-character-with-fire_23-2151152491.jpg?size=626&ext=jpg&ga=GA1.1.915554636.1727464067&semt=ais_hybrid-rr-similar",height: 150,width: 150,),
          ],
        ),
      )
    );
  }
}