import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/RecipeViewModel.dart';
import '../Model/Recipe.dart';
import '../Views/recipe_detail_view.dart';
import '../Model/Ingredient.dart';
import 'add_recipe_view.dart';
import 'package:recipe_app/ViewModel/settings_viewmodel.dart';

class RecipeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipeViewModel = Provider.of<RecipeViewModel>(context);
    final settingsViewModel = Provider.of<SettingsViewModel>(context); // Add this line

    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
      ),
      backgroundColor:settingsViewModel.backgroundColor,
      body: ListView.builder(
        itemCount: recipeViewModel.recipes.length,
        itemBuilder: (context, index) {
          Recipe recipe = recipeViewModel.recipes[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(recipe.imageUrl),
              radius: 25, // Adjust the size as needed
            ),
            title: Text(
              recipe.name,
              style: TextStyle(color: settingsViewModel.foregroundColor), // Set text color
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: recipe.isFavorite ? Icon(Icons.favorite, color: settingsViewModel.foregroundColor) : Icon(Icons.favorite_border, color: settingsViewModel.foregroundColor), // Set icon color
                  onPressed: () {
                    recipeViewModel.toggleFavorite(recipe);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: settingsViewModel.foregroundColor), // Set icon color
                  onPressed: () {
                    recipeViewModel.deleteRecipe(recipe);
                  },
                ),
              ],
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddRecipeView()),
          );
        },
        child: Icon(Icons.add),
        backgroundColor: settingsViewModel.backgroundColor, // Set background color
      ),
    );
  }
}
