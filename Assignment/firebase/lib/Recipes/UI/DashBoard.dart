import 'package:firebase/Recipes/Services/ApiServices.dart';
import 'package:firebase/Recipes/Services/Recipes_model.dart';
import 'package:firebase/Recipes/UI/RecipeDetails.dart';
import 'package:flutter/material.dart';

class RecipeDashBoard extends StatefulWidget {
  const RecipeDashBoard({super.key});

  @override
  State<RecipeDashBoard> createState() => _RecipeDashBoardState();
}

class _RecipeDashBoardState extends State<RecipeDashBoard> {
  List<Recipe> recipesModel = [];

  myrecipes() async {
    await fetchRecipes().then((value) {
      setState(() {
        recipesModel = value;
      });
    });
  }

  @override
  void initState() {
    myrecipes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: recipesModel.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final recipes = recipesModel[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Recipedetails(
                            index: index,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 250,
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: NetworkImage(recipes.image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                            color: Colors.black54),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                recipes.name,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                            ),
                            Text(
                              recipes.rating.toString(),
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              recipes.cookTimeMinutes.toString(),
                              style: const TextStyle(
                                  fontSize: 18, color: Colors.white),
                            ),
                            const Text(
                              "min",
                              style:
                                  TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
