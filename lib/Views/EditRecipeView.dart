import 'package:flutter/material.dart';
import 'package:recipe_app/Model/Recipe.dart';
import '../Model/Ingredient.dart';
import 'package:recipe_app/ViewModel/RecipeViewModel.dart';
import 'package:provider/provider.dart';
import '../ViewModel/settings_viewmodel.dart'; 

class EditRecipeView extends StatefulWidget {
  final Recipe recipe;

  EditRecipeView({required this.recipe});

  @override
  _EditRecipeViewState createState() => _EditRecipeViewState();
}

class _EditRecipeViewState extends State<EditRecipeView> {
  late TextEditingController _ingredientController;

  @override
  void initState() {
    super.initState();
    _ingredientController = TextEditingController(
        text: widget.recipe.ingredients.map((e) => '${e.name} - ${e.quantity}').join('\n'));
  }

  @override
  Widget build(BuildContext context) {
    // Access the settings view model
    final settingsViewModel = Provider.of<SettingsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Recipe'),
        backgroundColor: settingsViewModel.backgroundColor, // Use background color from settings view model
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ingredients:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: settingsViewModel.textColor), // Use text color from settings view model
            ),
            SizedBox(height: 8),
            TextField(
              controller: _ingredientController,
              minLines: 5,
              maxLines: null,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter ingredients (one per line)',
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Save changes and update the recipe
                List<Ingredient> updatedIngredients = _ingredientController.text
                    .split('\n')
                    .map((ingredient) {
                      List<String> parts = ingredient.split(' - ');
                      return Ingredient(name: parts[0], quantity: parts[1]);
                    })
                    .toList();
                Recipe updatedRecipe = Recipe(
                  id: widget.recipe.id,
                  name: widget.recipe.name,
                  ingredients: updatedIngredients,
                  instructions: widget.recipe.instructions,
                );
                Provider.of<RecipeViewModel>(context, listen: false)
                    .updateRecipe(updatedRecipe);
                Navigator.pop(context); // Go back to the previous screen
              },
              child: Text('Save'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(settingsViewModel.buttonColor), // Use button color from settings view model
              ),
            ),
          ],
        ),
      ),
    );
  }
}
