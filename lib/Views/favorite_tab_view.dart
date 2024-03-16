import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/ViewModel/RecipeViewModel.dart';
import 'package:recipe_app/Views/recipe_detail_view.dart';
import 'package:recipe_app/Model/Recipe.dart';
import 'package:recipe_app/ViewModel/settings_viewmodel.dart';

class FavoriteTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipeViewModel = Provider.of<RecipeViewModel>(context);
    final settingsViewModel = Provider.of<SettingsViewModel>(context);
    final List<Recipe> favoriteRecipes = recipeViewModel.recipes.where((recipe) => recipe.isFavorite).toList();

    return Container(
      color: settingsViewModel.backgroundColor, // Set background color
      child: ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          Recipe recipe = favoriteRecipes[index];
          return ListTile(
            title: Text(recipe.name),
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


