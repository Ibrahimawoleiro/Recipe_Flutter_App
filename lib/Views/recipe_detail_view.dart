import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/Model/Recipe.dart';
import 'package:recipe_app/ViewModel/RecipeViewModel.dart';
import 'package:recipe_app/ViewModel/settings_viewmodel.dart';
import '../Model/Ingredient.dart';

class RecipeDetailView extends StatefulWidget {
  final Recipe recipe;

  RecipeDetailView({required this.recipe});

  @override
  _RecipeDetailViewState createState() => _RecipeDetailViewState();
}

class _RecipeDetailViewState extends State<RecipeDetailView> {
  TextEditingController _ingredientsController = TextEditingController();
  TextEditingController _instructionsController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _ingredientsController.text = widget.recipe.ingredients.map((i) => '${i.name} - ${i.quantity}').join('\n');
    _instructionsController.text = widget.recipe.instructions;
  }

  @override
  Widget build(BuildContext context) {
    final recipeViewModel = Provider.of<RecipeViewModel>(context);
    final settingsViewModel = Provider.of<SettingsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.name),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Convert List<String> to List<Ingredient>
              final List<Ingredient> newIngredients = _ingredientsController.text.split('\n').map((ingredient) {
                var parts = ingredient.split(' - ');
                return Ingredient(name: parts[0], quantity: parts[1]);
              }).toList();

              recipeViewModel.updateIngredients(widget.recipe, newIngredients);
              recipeViewModel.updateInstructions(widget.recipe, _instructionsController.text);
              Navigator.pop(context); // Go back to the previous screen
            },
          ),
        ],
      ),
      backgroundColor: settingsViewModel.backgroundColor, // Set the background color from SettingsViewModel
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
            TextField(
              controller: _ingredientsController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Enter ingredients...',
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Instructions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextField(
              controller: _instructionsController,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: InputDecoration(
                hintText: 'Enter instructions...',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
