// lib/Views/recipe_list_view.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/RecipeViewModel.dart';
import '../Model/Recipe.dart';
import 'recipe_detail_view.dart';

class RecipeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipeViewModel = Provider.of<RecipeViewModel>(context);

    return ListView.builder(
      itemCount: recipeViewModel.recipes.length,
      itemBuilder: (context, index) {
        Recipe recipe = recipeViewModel.recipes[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(recipe.imageUrl), // Adjust this according to your image URL
          ),
          title: Text(recipe.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: recipe.isFavorite ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                onPressed: () {
                  recipeViewModel.toggleFavorite(recipe);
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
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
    );
  }
}

