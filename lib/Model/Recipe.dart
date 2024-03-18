import 'package:flutter/foundation.dart';
import 'Ingredient.dart';

class Recipe {
  int id;
  String name;
  List<Ingredient> ingredients;
  String instructions;
  bool isFavorite;
  String imageUrl;
  String rating = 'No ratings yet';
  double rating_val = 0;
  int numOfRatings = 0;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    this.isFavorite = false,
    required this.imageUrl,
  });

  // Setter method for ingredients
  set setIngredients(List<Ingredient> newIngredients) {
    ingredients = newIngredients;
  }

  // Setter method for instructions
  set setInstructions(String newInstructions) {
    instructions = newInstructions;
  }

  set setRating(int _rating) {
    numOfRatings++;
    if(numOfRatings == 1){
      rating_val = _rating / 1;
    } else {
      rating_val = (rating_val + _rating) / numOfRatings;
    }
    rating = '$rating_val / 5';
  }
}
