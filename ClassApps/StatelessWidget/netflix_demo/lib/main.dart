
import 'package:flutter/material.dart';

void main() {
  runApp(const NetflixDemo());
}
class NetflixDemo extends StatelessWidget{
  const NetflixDemo({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Netflix(),
    );
  }
}
class Netflix extends StatefulWidget {
  const Netflix({super.key});

  @override
  State<Netflix> createState() => _NetflixState();
}
class _NetflixState extends State<Netflix> {

List<String> movieGenres = [
  "Action Movies",
  "Comedy Movies",
  "Drama Movies",
  "Horror Movies",
  "Romance Movies",
  "Thriller Movies",
  "Sci-Fi Movies",
  "Adventure Movies",
  "Animation Movies",
  "Fantasy Movies"
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Netflix Demo' , style: TextStyle(
            fontSize: 35.0, fontWeight: FontWeight.bold , color: Colors.white
          ),),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context , int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(movieGenres[index], style: TextStyle(
            fontSize: 30.0, fontWeight: FontWeight.bold , color: Colors.blue
          ),),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  height:150,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  child: Image.network("https://imgc.allpostersimages.com/img/posters/american-sniper_u-L-F7SH1T0.jpg"),
                ),
                Container(
                  height:150,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  child: Image.network("https://imgc.allpostersimages.com/img/posters/marvel-spider-man-into-the-spider-verse-falling_u-L-F9TNGN0.jpg"),
                ),
                Container(
                  height:150,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  child: Image.network("https://imgc.allpostersimages.com/img/posters/the-lion-king-mufasa-and-simba_u-L-F9HNJ60.jpg"),
                ),
                Container(
                  height:150,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  child: Image.network("https://imgc.allpostersimages.com/img/posters/fast-furious-6_u-L-F5UQ7Z0.jpg"),
                ),
                Container(
                  height:150,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  child: Image.network("https://imgc.allpostersimages.com/img/posters/john-wick_u-L-F7SH230.jpg"),
                ),
                Container(
                  height:150,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  child: Image.network("https://imgc.allpostersimages.com/img/posters/pain-and-gain_u-L-F5TR0R0.jpg"),
                ),
                Container(
                  height:150,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  child: Image.network("https://imgc.allpostersimages.com/img/posters/dc-comics-the-dark-knight-batman-logo-on-fire-one-sheet-premium-poster_u-L-F9TM6L0.jpg"),
                ),
                Container(
                  height:150,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  child: Image.network("https://imgc.allpostersimages.com/img/posters/trends-international-marvel-cinematic-universe-captain-america-civil-war-shield-reflection-one-sheet_u-L-Q1RFUA80.jpg"),
                ),
                Container(
                  height:150,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  child: Image.network("https://imgc.allpostersimages.com/img/posters/commando_u-L-F4S77U0.jpg"),
                ),
                Container(
                  height:150,
                  width: 100,
                  padding: const EdgeInsets.all(5),
                  child: Image.network("https://imgc.allpostersimages.com/img/posters/into-the-wild_u-L-F4S4QN0.jpg"),
                ),
              ],
            ),
          )
              ],
            );
          }, )
      );
  }
}