import 'package:flutter/foundation.dart';
import 'Ingredient.dart';

class Recipe {
  final int id;
  final String name;
  List<Ingredient> ingredients; // Remove final keyword
  String instructions;
  bool isFavorite;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    this.isFavorite = false,
  });

  void updateInstructions(String newInstructions) {
    instructions = newInstructions;
  }

  void updateIngredients(List<Ingredient> newIngredients) {
    ingredients.clear(); // Clear the current list of ingredients
    ingredients.addAll(newIngredients); // Add all new ingredients to the list
  }
}
