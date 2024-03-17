import 'package:flutter/foundation.dart';
import 'Ingredient.dart';

class Recipe {
  int id;
  String name;
  List<Ingredient> ingredients;
  String instructions;
  bool isFavorite;
  String imageUrl;

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
}
