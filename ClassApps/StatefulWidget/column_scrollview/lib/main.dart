import "package:flutter/material.dart";

void main() {
  runApp(columnScroll());
}

class columnScroll extends StatelessWidget {
  const columnScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: scrollCol(),
    );
  }
}

class scrollCol extends StatefulWidget {
  const scrollCol({super.key});

  @override
  State createState() => _scrollCol();
}

class _scrollCol extends State<scrollCol> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column Scroll',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              "https://media.cnn.com/api/v1/images/stellar/prod/gettyimages-2121056227.jpg?c=16x9&q=h_833,w_1480,c_fill",
              fit: BoxFit.cover,
              height: 300,
              width: 411,
            ),
            const SizedBox(
              height: 50,
              width: 200,
              child: Center(
                child: Text("jannik sinner",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,)),
              ),
            ),
            const SizedBox(height: 30,),
            Image.network(
              "https://e0.365dm.com/17/10/2048x1152/skysports-alexander-zverev-tennis-china-open_4118672.jpg?20171003182058",
              fit: BoxFit.cover,
              height: 300,
              width: 411,
            ),
            const SizedBox(
              height: 50,
              width: 200,
              child: Center(
                child: Text("Alexander Zverev",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,)),
              ),
            ),
            const SizedBox(height: 30,),
            Image.network(
              "https://www.atptour.com/-/media/images/news/2024/08/24/19/37/alcaraz-us-open-2024-practice-bh.jpg",
              fit: BoxFit.cover,
              height: 300,
              width: 411,
            ),
            const SizedBox(
              height: 50,
              width: 200,
              child: Center(
                child: Text("Carlos Alcaraz",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,)),
              ),
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
