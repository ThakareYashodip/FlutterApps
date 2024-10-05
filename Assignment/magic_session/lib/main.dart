import 'package:flutter/material.dart';

void main() {
  runApp(const MagicSession());
}

class MagicSession extends StatelessWidget {
  const MagicSession({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Shoes(),
    );
  }
}

class Shoes extends StatefulWidget {
  const Shoes({super.key});

  @override
  State createState() => _Shoes();
}

class _Shoes extends State {

  int x =  0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          " Shoes",
          style: TextStyle(
              fontSize: 30.0,
              color: Color.fromARGB(255, 169, 128, 245),
              fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.shopping_cart, color: Color.fromARGB(255, 169, 128, 245),),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 411,
            height: 400,
            child: Image.network(
                "https://app.vectary.com/website_assets/636cc9840038712edca597df/636cc9840038713d9aa59ac2_UV_hero.jpg",
                fit: BoxFit.fitHeight),
          ),
          const SizedBox(height: 10,),
          const SizedBox(
            height: 40,
            child: Text(
              "   Nike Air Force 1 '07 ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.black),
            ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.lightBlue,
                    ),
                  ),
                  child: const SizedBox(
                    height: 25,
                    child: Text(
                      "SHOES",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.lightBlue,
                    ),
                  ),
                  child: const SizedBox(
                    height: 25,
                    child: Text(
                      "FOOTWEAR",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
            child: Text(
              "With iconic style and legendary comfort, the AF-1 was made to be worn on repeat. This iteration puts a fresh spin on the hoopsclassic with crisp leather, era- echoing '80s construction and reflective-design Swoosh logos.",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w300),
            ),
          ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "    Quantity  ",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              const SizedBox(
                  width: 10,
                ),
              IconButton(
                onPressed: (){
                  x--;
                  setState(() {});
                },
                icon: const Icon(Icons.remove,size: 30, )
              ),
              const SizedBox(
                  width: 10,
                ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: Text("$x",style:const TextStyle(
                    fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.black
                  ),),
                ),
              ),
              const SizedBox(
                  width: 10,
                ),
              IconButton(
                onPressed: (){
                  x++;
                  setState(() {});
                },
                icon: const Icon(Icons.add , size: 30)
              ),
            ],
          ),
           Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: (){},
                    style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.lightBlue,
                      ),
                    ),
                    child:  const Center(
                      child: Text(
                        "PURCHASE",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  ),
              ),
        ],
      ),
    );
  }
}
