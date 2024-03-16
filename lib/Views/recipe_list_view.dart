import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/ViewModel/RecipeViewModel.dart';
import 'package:recipe_app/Views/recipe_detail_view.dart';
import 'package:recipe_app/Model/Recipe.dart';
import 'package:recipe_app/ViewModel/settings_viewmodel.dart';

class RecipeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipeViewModel = Provider.of<RecipeViewModel>(context);
    final settingsViewModel = Provider.of<SettingsViewModel>(context);

    return Scaffold(
      backgroundColor: settingsViewModel.backgroundColor, // Set the background color from SettingsViewModel
      body: ListView.builder(
        itemCount: recipeViewModel.recipes.length,
        itemBuilder: (context, index) {
          Recipe recipe = recipeViewModel.recipes[index];
          return ListTile(
            title: Text(
              recipe.name,
              style: TextStyle(color: settingsViewModel.foregroundColor),
            ),
            trailing: IconButton(
              icon: recipe.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
              onPressed: () {
                recipeViewModel.toggleFavorite(recipe);
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => RecipeDetailView(recipe: recipe),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
