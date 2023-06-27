import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../widgets/rate_modal.dart';

import '../provider/image_data_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isOn = true;
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
                  return const InfoModal();
                },
              );
            },
            icon: const Icon(Icons.heart_broken),
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
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Select app theme:',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(
                      width: 800.0,
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Dark appearence  ",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Switch(value: isOn, activeColor: Colors.purple.shade800, onChanged: (_isOn){
                          setState(() {
                            isOn = _isOn;
                          });
                        }),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Rate the app:',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(
                      width: 800.0,
                      height: 20.0,
                    ),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.purple.shade800,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
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
          providerImage.clearList();
          providerImage.fetchImages();
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}