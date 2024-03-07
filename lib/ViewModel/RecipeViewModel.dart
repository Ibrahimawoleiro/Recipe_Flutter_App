// recipe_viewmodel.dart
import 'package:flutter/foundation.dart';
import 'package:recipe_app/Model/Recipe.dart';
import '../Model/Ingredient.dart';
class RecipeViewModel extends ChangeNotifier {
  List<Recipe> _recipes = []; // Initial empty list of recipes

  List<Recipe> get recipes => _recipes;

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }

  void updateRecipe(Recipe updatedRecipe) {
    for (int i = 0; i < _recipes.length; i++) {
      if (_recipes[i].id == updatedRecipe.id) {
        _recipes[i] = updatedRecipe;
        notifyListeners();
        break;
      }
    }
  }

  void deleteRecipe(Recipe recipe) {
    _recipes.removeWhere((r) => r.id == recipe.id);
    notifyListeners();
  }

  // Method to fetch recipes (for demo purpose, you can replace it with actual fetching from a database or API)
  void fetchRecipes() {
    // Simulating fetching data from a data source
    _recipes = [
      Recipe(id: 1, name: 'Recipe 1', ingredients: [Ingredient(name: 'Ingredient 1', quantity: 'Quantity 1')], instructions: 'Instructions for Recipe 1'),
      Recipe(id: 2, name: 'Recipe 2', ingredients: [Ingredient(name: 'Ingredient 2', quantity: 'Quantity 2')], instructions: 'Instructions for Recipe 2'),
      Recipe(id: 3, name: 'Recipe 3', ingredients: [Ingredient(name: 'Ingredient 3', quantity: 'Quantity 3')], instructions: 'Instructions for Recipe 3'),
    ];
    notifyListeners();
  }
}
