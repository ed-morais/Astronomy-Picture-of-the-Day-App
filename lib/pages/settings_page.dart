import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/image_data_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
      body: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Quantidade de imagens que deseja exibir:',
                  style: TextStyle(fontSize: 18.0),
                ),
                const SizedBox(
                  width: 15.0,
                  height: 20.0,
                ),
                SliderTheme(
                  data: const SliderThemeData(
                    valueIndicatorColor: Colors.white,
                    valueIndicatorTextStyle:
                        TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  child: Slider(
                    activeColor: Colors.purple.shade800,
                    inactiveColor: const Color.fromARGB(255, 81, 81, 81),
                    value: providerImage.getQuantityImages.toDouble(),
                    min: 1,
                    max: 20,
                    divisions: 19,
                    label: providerImage.getQuantityImages.toString(),
                    onChanged: (double value) {
                      debugPrint(value.toInt().toString());
                      providerImage.quantityImages = value.toInt();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple.shade800,
        onPressed: () {
          final providerImage =
              Provider.of<ImageDataProvider>(context, listen: false);
          providerImage.clearList();
          providerImage.fetchImages();
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
