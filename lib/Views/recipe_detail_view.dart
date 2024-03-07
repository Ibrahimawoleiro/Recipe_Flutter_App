import 'package:flutter/material.dart';
import 'package:recipe_app/Model/Recipe.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/ViewModel/RecipeViewModel.dart';
class RecipeDetailView extends StatelessWidget {
  final Recipe recipe;

  RecipeDetailView({required this.recipe});

  @override
  Widget build(BuildContext context) {
    final recipeViewModel = Provider.of<RecipeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              // Navigate to the edit recipe view
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              recipeViewModel.deleteRecipe(recipe);
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredients:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            for (var ingredient in recipe.ingredients)
              Text('${ingredient.name} - ${ingredient.quantity}'),
            SizedBox(height: 16),
            Text(
              'Instructions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(recipe.instructions),
          ],
        ),
      ),
    );
  }
}