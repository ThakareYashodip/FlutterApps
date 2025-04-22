import 'package:firebase/Recipes/Services/ApiServices.dart';
import 'package:flutter/material.dart';

class Recipedetails extends StatefulWidget {
  final index;
  const Recipedetails({super.key, required this.index});

  @override
  State<Recipedetails> createState() => _RecipedetailsState();
}

class _RecipedetailsState extends State<Recipedetails> {
  List mydata = [];

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    await fetchRecipes().then(
      (value) {
        setState(() {
          mydata = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: mydata.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image Section
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(mydata[widget.index].image),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Back Button
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 57, 57, 57),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          // Favorite Button
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 57, 57, 57),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_outline,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Recipe Details Section
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Recipe Name
                        Text(
                          mydata[widget.index].name,
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Rating and Reviews
                        Row(
                          spacing: 10,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Text(
                              mydata[widget.index].rating.toString(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "(${mydata[widget.index].reviewCount.toString()} Reviews)",
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 67, 67, 67),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        // Instruction
                        Text(
                          "Cooking Time : ${mydata[widget.index].cookTimeMinutes.toString()} min.",
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Ingredients :-",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${mydata[widget.index].ingredients.toString().replaceAll("[", '').replaceAll(']', '')}.",
                          style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 58, 58, 58),
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Recipe Description
                        Text(
                          'Meal Type :  ${mydata[widget.index].cuisine}',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 27, 27, 27),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
