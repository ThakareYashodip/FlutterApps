import "package:flutter/material.dart";

void main() {
  runApp(const ColumnScroll());
}

class ColumnScroll extends StatelessWidget {
  const ColumnScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScrollCol(),
    );
  }
}

class ScrollCol extends StatefulWidget {
  const ScrollCol({super.key});

  @override
  State createState() => _ScrollCol();
}

class _ScrollCol extends State<ScrollCol> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' Top Tennis Players',
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
              width: 400,
              child: Center(
                child: Text("Rank 1 : jannik sinner",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,)),
              ),
            ),
            Image.network(
              "https://e0.365dm.com/17/10/2048x1152/skysports-alexander-zverev-tennis-china-open_4118672.jpg?20171003182058",
              fit: BoxFit.cover,
              height: 300,
              width: 411,
            ),
            const SizedBox(
              height: 50,
              width: 400,
              child: Center(
                child: Text("Rank 2 : Alexander Zverev",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,)),
              ),
            ),
              Image.network(
              "https://www.atptour.com/-/media/images/news/2024/08/24/19/37/alcaraz-us-open-2024-practice-bh.jpg",
              fit: BoxFit.cover,
              height: 300,
              width: 411,
            ),
            const SizedBox(
              height: 50,
              width: 400,
              child: Center(
                child: Text("Rank 3 : Carlos Alcaraz",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,)),
              ),
            ),
             Image.network(
              "https://www.atptour.com/-/media/images/news/2024/09/03/19/09/djokovic-us-open-2024-volley.jpg",
              fit: BoxFit.cover,
              height: 300,
              width: 411,
            ),
            const SizedBox(
              height: 50,
              width: 400,
              child: Center(
                child: Text("Rank 4 : Novak Djokovic",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,)),
              ),
            ),
             Image.network(
              "https://cloudfront-us-east-2.images.arcpublishing.com/reuters/A4VK6IQF3RMFFFXOOUO4R3D52Q.jpg",
              fit: BoxFit.cover,
              height: 300,
              width: 411,
            ),
            const SizedBox(
              height: 50,
              width: 400,
              child: Center(
                child: Text("Rank 5 : Daniil Medvedev",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
