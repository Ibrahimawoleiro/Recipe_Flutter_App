// lib/ViewModel/RecipeViewModel.dart

import 'package:flutter/foundation.dart';
import '../Model/Recipe.dart';
import '../Model/Ingredient.dart';

class RecipeViewModel extends ChangeNotifier {
  List<Recipe> _recipes = [];

  List<Recipe> get recipes => _recipes;

  void addRecipe(Recipe recipe) {
    _recipes.add(recipe);
    notifyListeners();
  }

  void updateRecipe(Recipe updatedRecipe) {
    for (int i = 0; i < _recipes.length; i++) {
      if (_recipes[i].id == updatedRecipe.id) {
        _recipes[i] = updatedRecipe;
        notifyListeners();
        break;
      }
    }
  }

  void deleteRecipe(Recipe recipe) {
    _recipes.removeWhere((r) => r.id == recipe.id);
    notifyListeners();
  }

  void fetchRecipes() {
  _recipes = [
    Recipe(
      id: 1,
      name: 'Meat Pie',
      imageUrl: 'assets/images/meatPie.jpg',
      ingredients: [
        Ingredient(name: 'medium potato, peeled and cubed', quantity: 'Quantity 1'),
        Ingredient(name: 'pound ground beef', quantity: 'Quantity 1/2'),
        Ingredient(name: 'pound ground pork', quantity: 'Quantity 1/2'),
        Ingredient(name: 'cup chopped onion', quantity: 'Quantity 1/2'),
        Ingredient(name: 'clove garlic, chopped', quantity: 'Quantity 1/3'),
        Ingredient(name: 'teaspoon mustard powder', quantity: 'Quantity 1/2'),
        Ingredient(name: 'teaspoon dried thyme', quantity: 'Quantity 1/2'),
        Ingredient(name: 'teaspoon dried sage', quantity: 'Quantity 1/4'),
        Ingredient(name: 'teaspoon salt', quantity: 'Quantity 1'),
        Ingredient(name: 'teaspoon ground black pepper', quantity: 'Quantity 1/4'),
        Ingredient(name: ' cup water', quantity: 'Quantity 1/4'),
        Ingredient(name: '1 (15 ounce) package refrigerated pie crusts', quantity: 'Quantity 1'),
      ],
      instructions:
          'Directions\n\n'
          'Preheat the oven to 425 degrees F (220 degrees C).\n\n'
          'Place potato in a saucepan with enough water to cover. Bring to a boil, and cook until tender, about 5 minutes. Drain, mash, and set aside.\n\n'
          'Meanwhile, crumble ground beef and pork into a large saucepan. Add onion, garlic, mustard powder, thyme, sage, cloves, salt, and black pepper. Stir in water. Cook over medium heat, stirring, until meat is evenly browned.\n\n'
          'Remove from the heat and mix in mashed potato.\n\n'
          'Ease one pie crust into a 9-inch pie plate. Fill with meat mixture, then top with the remaining pie crust. Trim any excess dough, then crimp the edges with the tines of a fork to seal. Prick top crust a few times with a knife to vent steam. Cover the edges of the crust with aluminum foil.\n\n'
          'Bake in the preheated oven until crust is browned, about 25 minutes.',
    ),
    Recipe(
  id: 2,
  name: 'Jollof Rice',
  imageUrl: 'assets/images/jollof.jpg',
  ingredients: [
    Ingredient(name: '1 large, ripe tomato, cored and quartered', quantity: ''),
    Ingredient(name: '1 large red bell pepper, seeded and roughly chopped', quantity: ''),
    Ingredient(name: '1 whole habanero pepper, stem removed', quantity: ''),
    Ingredient(name: '1 whole Fresno chili, or jalapeño, stem removed', quantity: ''),
    Ingredient(name: '4 cloves garlic, peeled', quantity: ''),
    Ingredient(name: '1 tablespoon minced ginger', quantity: ''),
    Ingredient(name: '2 cups water', quantity: ''),
    Ingredient(name: '1/3 cup olive oil', quantity: ''),
    Ingredient(name: '1 red onion, diced', quantity: ''),
    Ingredient(name: '1 teaspoon salt, plus more to taste', quantity: ''),
    Ingredient(name: '1/4 cup tomato paste', quantity: ''),
    Ingredient(name: '2 tablespoons smoked paprika', quantity: ''),
    Ingredient(name: '1 teaspoon curry powder', quantity: ''),
    Ingredient(name: '1 teaspoon cumin', quantity: ''),
    Ingredient(name: '1 teaspoon dried thyme', quantity: ''),
    Ingredient(name: '1/2 teaspoon freshly ground black pepper', quantity: ''),
    Ingredient(name: '1/4 teaspoon turmeric', quantity: ''),
    Ingredient(name: '2 1/4 cups basmati rice', quantity: ''),
    Ingredient(name: '1 bay leaf', quantity: ''),
    Ingredient(name: '1 tablespoon chicken bouillon paste', quantity: ''),
    Ingredient(name: '1/4 cup chopped green onion for garnish (optional)', quantity: ''),
    Ingredient(name: '1/4 cup chopped cilantro, for garnish (optional)', quantity: ''),
  ],
  instructions: '''
Combine tomato, red bell pepper, habanero pepper, fresno chili, garlic, ginger, and water in a blender for the sauce. Blend on high until smooth and set aside.

Heat olive oil in a saucepan over medium heat. Add onion and salt and sauté until onion starts to soften, 4 to 5 minutes. Clear space in the middle of the pan, add tomato paste, and sauté for 2 to 3 minutes. Season with paprika, curry powder, cumin, thyme, pepper, and turmeric; continue cooking for 1 to 2 minutes until everything is well combined.

Turn off the heat, and stir in the rice, making sure every grain of rice is coated with the oil-tomato mixture. Add bay leaf and chicken bouillon paste.

Turn heat to high, stir in tomato sauce, and bring to a vigorous simmer. Cover with a tight fitting lid, reduce heat to medium-low, and simmer for 20 minutes. Do not remove the lid or stir rice.

Turn off heat after 20 minutes, and set the timer for 12 minutes. Allow rice to sit and do not remove the lid.

After the 12 minutes are up, remove lid, and fluff rice with a fork, separating all the grains. Serve garnished with green onions and chopped cilantro.
'''
),
    Recipe(
  id: 3,
  name: 'Grilled Burgers',
  imageUrl: 'assets/images/grilled_burgers.jpg', // Adjust image URL accordingly
  ingredients: [
    Ingredient(name: '1 egg', quantity: '1'),
    Ingredient(name: '1 teaspoon mustard (regular or Dijon)', quantity: '1'),
    Ingredient(name: '1 teaspoon Worcestershire sauce', quantity: '1'),
    Ingredient(name: '1 small onion, finely grated', quantity: '1'),
    Ingredient(name: '1 clove garlic, minced', quantity: '1'),
    Ingredient(name: '1/2 teaspoon salt', quantity: '1/2'),
    Ingredient(name: '1/2 teaspoon pepper', quantity: '1/2'),
    Ingredient(name: '1 lb medium ground beef', quantity: '1'),
  ],
  instructions: '''
DIRECTIONS
1. Lightly oil grill and heat BBQ to medium.
2. Whisk egg in a bowl and add next 6 ingredients.
3. Add any of the “stir-ins” that appeal to you.
4. Crumble in beef and using your hands or a fork, gently mix together. Handle the meat as little as possible – the more you work it, the tougher it gets.
5. Gently shape (don’t firmly press) mixture into burgers about ¾ inch thick.
6. Using your thumb, make a shallow depression in the centre of each burger to prevent puffing up during cooking.
7. Place burgers on the grill, close lid and BBQ until NO LONGER PINK INSIDE, turning once, about 6 – 8 minutes per side. An instant read thermometer should read 160F. Don't abuse your burgers by pressing with a spatula, pricking with a fork or turning frequently as precious juices will be lost!
8. Tuck into a warm crusty bun and add your favourite toppings.
'''
),
  ];
  notifyListeners();
}

  void toggleFavorite(Recipe recipe) {
    recipe.isFavorite = !recipe.isFavorite;
    notifyListeners();
  }

  void updateIngredients(Recipe recipe, List<Ingredient> newIngredients) {
    for (int i = 0; i < _recipes.length; i++) {
      if (_recipes[i].id == recipe.id) {
        _recipes[i].ingredients = newIngredients;
        notifyListeners();
        break;
      }
    }
  }

  void updateInstructions(Recipe recipe, String newInstructions) {
    for (int i = 0; i < _recipes.length; i++) {
      if (_recipes[i].id == recipe.id) {
        _recipes[i].instructions = newInstructions;
        notifyListeners();
        break;
      }
    }
  }
}
