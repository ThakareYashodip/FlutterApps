
import 'dart:convert';

RecipesModel RecipesFromJson(String str) => RecipesModel.fromJson(json.decode(str));

String RecipesToJson(RecipesModel data) => json.encode(data.toJson());

class RecipesModel {
    final List<Recipe> recipes;
    final int total;
    final int skip;
    final int limit;

    RecipesModel({
        required this.recipes,
        required this.total,
        required this.skip,
        required this.limit,
    });

    factory RecipesModel.fromJson(Map<String, dynamic> json) => RecipesModel(
        recipes: List<Recipe>.from(json["recipes"].map((x) => Recipe.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "recipes": List<dynamic>.from(recipes.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Recipe {
    final int id;
    final String name;
    final List<String> ingredients;
    final List<String> instructions;
    final int prepTimeMinutes;
    final int cookTimeMinutes;
    final int servings;
    final Difficulty difficulty;
    final String cuisine;
    final int caloriesPerServing;
    final List<String> tags;
    final int userId;
    final String image;
    final double rating;
    final int reviewCount;
    final List<String> mealType;

    Recipe({
        required this.id,
        required this.name,
        required this.ingredients,
        required this.instructions,
        required this.prepTimeMinutes,
        required this.cookTimeMinutes,
        required this.servings,
        required this.difficulty,
        required this.cuisine,
        required this.caloriesPerServing,
        required this.tags,
        required this.userId,
        required this.image,
        required this.rating,
        required this.reviewCount,
        required this.mealType,
    });

    factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        id: json["id"],
        name: json["name"],
        ingredients: List<String>.from(json["ingredients"].map((x) => x)),
        instructions: List<String>.from(json["instructions"].map((x) => x)),
        prepTimeMinutes: json["prepTimeMinutes"],
        cookTimeMinutes: json["cookTimeMinutes"],
        servings: json["servings"],
        difficulty: difficultyValues.map[json["difficulty"]]!,
        cuisine: json["cuisine"],
        caloriesPerServing: json["caloriesPerServing"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        userId: json["userId"],
        image: json["image"],
        rating: json["rating"]?.toDouble(),
        reviewCount: json["reviewCount"],
        mealType: List<String>.from(json["mealType"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ingredients": List<dynamic>.from(ingredients.map((x) => x)),
        "instructions": List<dynamic>.from(instructions.map((x) => x)),
        "prepTimeMinutes": prepTimeMinutes,
        "cookTimeMinutes": cookTimeMinutes,
        "servings": servings,
        "difficulty": difficultyValues.reverse[difficulty],
        "cuisine": cuisine,
        "caloriesPerServing": caloriesPerServing,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "userId": userId,
        "image": image,
        "rating": rating,
        "reviewCount": reviewCount,
        "mealType": List<dynamic>.from(mealType.map((x) => x)),
    };
}

enum Difficulty {
    EASY,
    MEDIUM
}

final difficultyValues = EnumValues({
    "Easy": Difficulty.EASY,
    "Medium": Difficulty.MEDIUM
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
