import 'package:flutter/material.dart';
import '../Resourcess/linksModule.dart';

Scaffold HomeScreen(){
  return Scaffold(
        appBar: AppBar(
          title: Image.network(
            "https://images.ctfassets.net/y2ske730sjqp/1aONibCke6niZhgPxuiilC/2c401b05a07288746ddf3bd3943fbc76/BrandAssets_Logos_01-Wordmark.jpg?w=940",
            height: 120,width: 120,fit: BoxFit.cover,
          ),
          backgroundColor: Colors.black,
          titleTextStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.red,
              letterSpacing: 5),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 30,
                color: Colors.white,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.cast_connected,
                size: 30,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(color: Colors.black),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("TV Shows");
                      },
                      child: const SizedBox(
                        height: 30,
                        child: Text(
                          "TV Shows",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Movies");
                      },
                      child: const SizedBox(
                        height: 30,
                        child: Text(
                          "Movies",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Categories");
                      },
                      child: const SizedBox(
                        height: 30,
                        child: Text(
                          "Categories",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    height: 580,
                    width: 380,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: MoviePosters.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 550,
                              width: 350,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 0.3, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15),
                              ),
                              margin: const EdgeInsets.all(10),
                              clipBehavior: Clip.hardEdge,
                              child: Image.network(
                                MoviePosters[index]['imageUrl']!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Column(
                        children: [
                          Icon(
                            Icons.add,
                            size: 30,
                            color: Colors.white,
                          ),
                          Text(
                            "MyList",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 100,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                             SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.play_arrow,
                              size: 30,
                              color: Colors.black,
                            ),
                            Text(
                              "Play",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Column(
                        children: [
                          Icon(
                            Icons.info,
                            size: 30,
                            color: Colors.white,
                          ),
                          Text(
                            "Info",
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 60,
                ),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: MoviePosters.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "  ${MoviePosters[index]['name']}",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 180,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: MoviePosters[index]['Genre'].length,
                            itemBuilder:
                                (BuildContext context, int innerIndex) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 10),
                                    child: Image.network(
                                      MoviePosters[index]['Genre'][innerIndex],
                                      fit: BoxFit.fill,
                                      height: 160,
                                      width: 120,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(

                ),
              ],
            ),
          ),
        ));
}