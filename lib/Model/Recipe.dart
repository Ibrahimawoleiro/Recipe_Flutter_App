import 'package:flutter/foundation.dart';
import 'Ingredient.dart';

class Recipe {
  final int id;
  final String name;
  List<Ingredient> ingredients;
  String instructions;

  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
  });

  void updateInstructions(String newInstructions) {
    instructions = newInstructions;
  }

  void updateIngredients(List<Ingredient> newIngredients) {
    ingredients = newIngredients;
  }
}
