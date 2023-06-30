import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/config_app_provider.dart';
import '../providers/image_data_provider.dart';

class RestaureModal extends StatelessWidget {
  // provider image
  const RestaureModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Configuration Presets',
        textAlign: TextAlign.center,
      ),
      content: const SizedBox(
        height: 60,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Are you sure you want to reset settings?',
                style: TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text(
            'Cancel',
            style: TextStyle(
                color: Theme.of(context).primaryColor, fontSize: 15.0),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Theme.of(context).primaryColor)),
          onPressed: () {
            final providerImage =
                Provider.of<ImageDataProvider>(context, listen: false);
            final configApp =
                Provider.of<ConfigAppProvider>(context, listen: false);

            providerImage.quantityImages = 5;
            providerImage.clearList();
            providerImage.fetchImages();
            configApp.changeTheme(true);
            configApp.changeColor(Colors.purple.shade800);

            Navigator.pop(context, 'Confirm');
            Navigator.of(context).pop();
          },
          // onPressed: () {
          //   configApp.changeTheme(switchValue);

          //   final providerImage =
          //       Provider.of<ImageDataProvider>(context, listen: false);
          //   providerImage.quantityImages = sliderValue;
          //   providerImage.clearList();
          //   providerImage.fetchImages();
          // },
          child: const Text(
            'Confirm',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
