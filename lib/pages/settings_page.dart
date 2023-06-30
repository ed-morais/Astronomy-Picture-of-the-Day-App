import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/config_app_provider.dart';
import '../widgets/color_picker_modal.dart';
import '../widgets/config_card.dart';
import '../widgets/rate_modal.dart';

import '../providers/image_data_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late int sliderValue;
  late bool switchValue;
  final MaterialStateProperty<Icon?> thumbIcon =
      MaterialStateProperty.resolveWith<Icon?>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.dark_mode);
      }
      return const Icon(
        Icons.light_mode,
        color: Colors.white,
      );
    },
  );

  @override
  void initState() {
    super.initState();
    final providerImage =
        Provider.of<ImageDataProvider>(context, listen: false);
    sliderValue = providerImage.getQuantityImages;

    final configApp = Provider.of<ConfigAppProvider>(context, listen: false);
    switchValue = configApp.isDark;
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<ImageDataProvider>(context, listen: true);
    final configApp = Provider.of<ConfigAppProvider>(context, listen: true);
    Color mycolor = configApp.primaryColor;
    // debugPrint(mycolor.toString());
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ConfigCard(
              title: 'Number of images you want to show',
              body: SliderTheme(
                data: const SliderThemeData(
                  valueIndicatorTextStyle:
                      TextStyle(color: Colors.white, fontSize: 14),
                ),
                child: Slider(
                  activeColor: Theme.of(context).primaryColor,
                  inactiveColor: const Color.fromARGB(255, 81, 81, 81),
                  value: sliderValue.toDouble(),
                  min: 1,
                  max: 20,
                  divisions: 19,
                  label: sliderValue.toString(),
                  onChanged: (double value) {
                    setState(() {
                      sliderValue = value.toInt();
                    });
                  },
                ),
              ),
            ),
            ConfigCard(
              title: 'Appearance',
              body: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Select theme:',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Switch(
                    thumbIcon: thumbIcon,
                    value: switchValue,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (bool value) {
                      setState(() {
                        switchValue = value;
                        configApp.changeTheme(switchValue);
                      });
                    },
                  ),
                ],
              ),
            ),
            ConfigCard(
              title: 'Palette Details',
              body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const ColorPickerDialog();
                        });
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Theme.of(context).primaryColor),
                  ),
                  child: const Text(
                    "Select color",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          configApp.changeTheme(switchValue);

          final providerImage =
              Provider.of<ImageDataProvider>(context, listen: false);
          providerImage.quantityImages = sliderValue;
          providerImage.clearList();
          providerImage.fetchImages();
          Navigator.of(context).pop();
        },
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
    );
  }
}
