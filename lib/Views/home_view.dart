import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/ViewModel/RecipeViewModel.dart';
import 'package:recipe_app/Views/recipe_list_view.dart'; // Import RecipeListView
import 'package:recipe_app/Views/favorite_tab_view.dart'; // Import FavoriteTabView
import 'package:recipe_app/ViewModel/settings_viewmodel.dart';

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
    final settingsViewModel = Provider.of<SettingsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        color: settingsViewModel.backgroundColor, // Set background color
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.list), text: 'All Recipes'),
                  Tab(icon: Icon(Icons.favorite), text: 'Favorites'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    RecipeListView(), // Display all recipes
                    FavoriteTabView(), // Display favorite recipes
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
