import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/image_data_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _currentSliderValue = 5;
  @override
  Widget build(BuildContext context) {
    final providerImage = Provider.of<ImageDataProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Quantidade de imagens que deseja exibir:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(
              width: 15.0,
              height: 20.0,
            ),
            Slider(
              // thumbColor: Colors.white,
              activeColor: Colors.purple,
              inactiveColor: const Color.fromARGB(255, 81, 81, 81),
              value: _currentSliderValue,
              min: 1,
              max: 20,
              divisions: 20,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                debugPrint(value.toInt().toString());
                providerImage.quantityImages = value.toInt()+1;
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
