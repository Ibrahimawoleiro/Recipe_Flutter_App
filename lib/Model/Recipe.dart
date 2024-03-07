// recipe.dart
import 'Ingredient.dart';
class Recipe {
  final int id; // Add id property
  final String name;
  final List<Ingredient> ingredients;
  final String instructions;

  Recipe({
    required this.id, // Update constructor to accept id
    required this.name,
    required this.ingredients,
    required this.instructions,
  });
}
