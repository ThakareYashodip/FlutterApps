import 'package:flutter/material.dart';
import 'package:netflix_part1/DashBoard/HomeScreen.dart';

class userSelection extends StatefulWidget {
  const userSelection({super.key});

  @override
  State<userSelection> createState() => _userSelectionState();
}

class _userSelectionState extends State<userSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      toolbarHeight: 80,
      title: Image.network(
        "https://wallpaperaccess.com/full/6075689.png",
        width: 150,
        fit: BoxFit.fitWidth,
      ),
      centerTitle: true,
      backgroundColor: Colors.black,
      actions: [
        IconButton(
            icon: const Icon(
              Icons.edit,
              size: 30,
              color: Colors.grey,
            ),
            onPressed: () {}),
      ],
    ),
    body: Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Who's Watching?",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: "Montserrat",
                color: Colors.white),
          ),
          const SizedBox(
            height: 50,
          ),
          //1st row yashbhai
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Ganu");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen() ));
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.all(5),
                      child: Image.network(
                        "https://img.freepik.com/premium-photo/drawing-anime-character-with-hoodie-it_1308172-177478.jpg?size=338&ext=jpg&ga=GA1.1.915554636.1727464067&semt=ais_hybrid",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Ganu",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Montserrat",
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Yashodip");
                      Navigator.push(context ,MaterialPageRoute(builder: (context) => HomeScreen() ));
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.all(5),
                      child: Image.network(
                        "https://img.freepik.com/premium-vector/picture-boy-with-red-background_969863-279244.jpg?size=338&ext=jpg&ga=GA1.1.915554636.1727464067&semt=ais_hybrid",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Yashodip",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Montserrat",
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          //2nd row spidey
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Bhushan");
                      Navigator.push(context , MaterialPageRoute(builder: (context) => HomeScreen() ));
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.all(5),
                      child: Image.network(
                        "https://img.freepik.com/premium-photo/boy-with-hoodie-that-says-hes-boy_1002151-24837.jpg?size=338&ext=jpg&ga=GA1.1.915554636.1727464067&semt=ais_hybrid",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Bhushan",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Montserrat",
                        color: Colors.white),
                  ),
                ],
              ),
              const SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      print("Sunny");
                      Navigator.push(context , MaterialPageRoute(builder: (context) => HomeScreen() ));
                    },
                    child: Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.all(5),
                      child: Image.network(
                        "https://img.freepik.com/premium-vector/cartoon-man-with-blue-jacket-blue-jacket_983286-5842.jpg?size=338&ext=jpg&ga=GA1.1.915554636.1727464067&semt=ais_hybrid",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Sunny",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: "Montserrat",
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              print("Spiderman");
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            child: Container(
              height: 100,
              width: 100,
              margin: const EdgeInsets.all(5),
              child: Image.network(
                "https://img.freepik.com/premium-photo/spiderman-figure-wallpaper_1198708-12521.jpg?ga=GA1.1.915554636.1727464067&semt=ais_hybrid",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const Text(
            "Spiderman",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: "Montserrat",
                color: Colors.white),
          ),
        ],
      ),
    ),
  );
  }
}
