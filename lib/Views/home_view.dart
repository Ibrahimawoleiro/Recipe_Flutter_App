// home_view.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/ViewModel/RecipeViewModel.dart';
import 'package:recipe_app/Views/recipe_detail_view.dart';
import 'package:recipe_app/Model/Recipe.dart';
class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    // Call fetchRecipes after the current build phase
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<RecipeViewModel>(context, listen: false).fetchRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    final recipeViewModel = Provider.of<RecipeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: recipeViewModel.recipes.length,
        itemBuilder: (context, index) {
          Recipe recipe = recipeViewModel.recipes[index];
          return ListTile(
            title: Text(recipe.name),
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
