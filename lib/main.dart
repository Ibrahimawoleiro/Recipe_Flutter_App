import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/ViewModel/RecipeViewModel.dart';
import 'package:recipe_app/ViewModel/settings_viewmodel.dart';
import 'package:recipe_app/Views/home_view.dart';
import '../ViewModel/settings_viewmodel.dart'; 
import 'package:recipe_app/Views/settings_view.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RecipeViewModel()),
        ChangeNotifierProvider(create: (_) => SettingsViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeView(),
    SettingsView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final settingsViewModel = Provider.of<SettingsViewModel>(context);

    return Scaffold(
      backgroundColor: settingsViewModel.backgroundColor, // Set the background color of the Scaffold
      appBar: AppBar(
        title: Text(
          'Recipe App',
          textAlign: TextAlign.center,
          style: TextStyle(color: settingsViewModel.foregroundColor), // Set the text color of the title
        ),
        centerTitle: true, // Center the title horizontally
        backgroundColor: settingsViewModel.backgroundColor, // Set the background color of the app bar
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: settingsViewModel.backgroundColor, // Set the background color of the bottom navigation bar
        selectedItemColor: settingsViewModel.foregroundColor, // Set the selected item color
        unselectedItemColor: settingsViewModel.foregroundColor.withOpacity(0.5), // Set the unselected item color
      ),
    );
  }
}
