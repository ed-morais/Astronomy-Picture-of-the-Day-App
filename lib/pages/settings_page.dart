import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/rate_modal.dart';

import '../providers/image_data_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late int sliderValue;

  @override
  void initState() {
    super.initState();
    final providerImage =
        Provider.of<ImageDataProvider>(context, listen: false);
    sliderValue = providerImage.getQuantityImages;
  }

  @override
  Widget build(BuildContext context) {
    final providerImage = Provider.of<ImageDataProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings'),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return const RateModal();
                },
              );
            },
            icon: const Icon(Icons.emoji_emotions_outlined),
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Number of images you want to show:',
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
                        value: sliderValue.toDouble(),
                        min: 1,
                        max: 20,
                        divisions: 19,
                        label: sliderValue.toString(),
                        onChanged: (double value) {
                          debugPrint(value.toInt().toString());
                          setState(() {
                            sliderValue = value.toInt();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple.shade800,
        onPressed: () {
          final providerImage =
              Provider.of<ImageDataProvider>(context, listen: false);
          providerImage.quantityImages = sliderValue;
          providerImage.clearList();
          providerImage.fetchImages();
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
