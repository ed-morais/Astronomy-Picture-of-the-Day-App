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
      body: Center(
        child: Column(
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
              activeColor: Colors.purple,
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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          final providerImage = Provider.of<ImageDataProvider>(context, listen: true);
          providerImage.images.clear();
          providerImage.fetchImages();
          Navigator.of(context).pop();
        }, child: Icon(Icons.save),
      ),
    );
  }
}
