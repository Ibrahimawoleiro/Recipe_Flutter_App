import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/RecipeViewModel.dart';
import '../ViewModel/settings_viewmodel.dart'; 
import '../Model/Recipe.dart';
import '../Model/Ingredient.dart';
import 'recipe_list_view.dart';

class AddRecipeView extends StatefulWidget {
  @override
  _AddRecipeViewState createState() => _AddRecipeViewState();
}

class _AddRecipeViewState extends State<AddRecipeView> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ingredientsController = TextEditingController();
  TextEditingController _instructionsController = TextEditingController();
  TextEditingController _imageUrlController = TextEditingController(); // Add this controller for image URL

  @override
  Widget build(BuildContext context) {
    final recipeViewModel = Provider.of<RecipeViewModel>(context);
    final settingsViewModel = Provider.of<SettingsViewModel>(context); // Access SettingsViewModel

    return Consumer<SettingsViewModel>(
      builder: (context, settings, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Add Recipe'),
            backgroundColor: settingsViewModel.backgroundColor, // Use background color from settings
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Recipe Name'),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _ingredientsController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(labelText: 'Ingredients'),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _instructionsController,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(labelText: 'Instructions'),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _imageUrlController, // Add this controller for image URL
                  decoration: InputDecoration(labelText: 'Image URL'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Split the ingredients entered in the text field and create Ingredient objects
                    List<Ingredient> ingredients = _ingredientsController.text
                        .split('\n')
                        .map((ingredient) {
                          var parts = ingredient.split(' - ');
                          return Ingredient(name: parts[0], quantity: parts[1]);
                        })
                        .toList();
                    // Create a new Recipe object
                    Recipe newRecipe = Recipe(
                      id: 0, // You need to provide the id parameter here
                      name: _nameController.text,
                      ingredients: ingredients,
                      instructions: _instructionsController.text,
                      imageUrl: _imageUrlController.text, // Assign the image URL
                    );
                    // Add the new recipe to the list
                    recipeViewModel.addRecipe(newRecipe);
                    // Navigate back to the recipe list view
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RecipeListView())); // Navigate to the recipe list view
                  },
                  child: Text('Add Recipe'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(settingsViewModel.backgroundColor), // Use foreground color from settings
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
