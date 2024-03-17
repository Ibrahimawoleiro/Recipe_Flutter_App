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

    return ListView.builder(
      itemCount: favoriteRecipes.length,
      itemBuilder: (context, index) {
        Recipe recipe = favoriteRecipes[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(recipe.imageUrl),
            radius: 25, // Adjust the size as needed
          ),
          title: Text(
            recipe.name,
            style: TextStyle(color: settingsViewModel.foregroundColor),
          ),
          trailing: IconButton(
            icon: recipe.isFavorite ? Icon(Icons.favorite, color: settingsViewModel.foregroundColor) : Icon(Icons.favorite_border, color: settingsViewModel.foregroundColor),
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
    );
  }
}
