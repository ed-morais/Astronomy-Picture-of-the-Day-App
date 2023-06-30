import 'package:flutter/material.dart';

import '../providers/config_app_provider.dart';
import '../providers/image_data_provider.dart';

class RestaureModal extends StatelessWidget {
  final ImageDataProvider imageProvider;
  final ConfigAppProvider configApp;
  const RestaureModal({
    super.key,
    required this.imageProvider,
    required this.configApp,
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
            imageProvider.quantityImages = 5;
            imageProvider.clearList();
            imageProvider.fetchImages();
            configApp.changeTheme(true);
            configApp.changeColor(Colors.purple.shade800);

            Navigator.pop(context, 'Confirm');
            Navigator.of(context).pop();
          },
          child: const Text(
            'Confirm',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
