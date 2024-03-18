import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/ViewModel/settings_viewmodel.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsViewModel = Provider.of<SettingsViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      backgroundColor: settingsViewModel.backgroundColor, // Set the background color from SettingsViewModel
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Foreground Color'),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Pick a color'),
                      content: SingleChildScrollView(
                        child: BlockPicker(
                          pickerColor: settingsViewModel.foregroundColor,
                          onColorChanged: (Color color) {
                            settingsViewModel.changeForegroundColor(color);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text('Choose Color'),
              style: ElevatedButton.styleFrom(
                primary: settingsViewModel.backgroundColor, // Set the button color
              ),
            ),
            SizedBox(height: 16),
            Text('Background Color'),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Pick a color'),
                      content: SingleChildScrollView(
                        child: BlockPicker(
                          pickerColor: settingsViewModel.backgroundColor,
                          onColorChanged: (Color color) {
                            settingsViewModel.changeBackgroundColor(color);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text('Choose Color'),
              style: ElevatedButton.styleFrom(
                backgroundColor: settingsViewModel.backgroundColor, // Set the button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}
