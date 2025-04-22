import 'package:firebase/Recipes/Services/Recipes_model.dart';
import 'package:http/http.dart' as http;

fetchRecipes() async {
  final url = Uri.parse("https://dummyjson.com/recipes");
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = RecipesFromJson(response.body);
    return data.recipes;
  } else {
    // Handle the error
    print('Failed to load recipes');
  }
}
