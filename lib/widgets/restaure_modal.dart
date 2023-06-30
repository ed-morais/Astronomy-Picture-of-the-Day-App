import 'package:flutter/material.dart';

class RestaureModal extends StatelessWidget {
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
            style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 15.0),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Theme.of(context).primaryColor)),
          onPressed: () {
            
            Navigator.pop(context, 'Confirm');
          }, 
          // onPressed: () {
          //   configApp.changeTheme(switchValue);

          //   final providerImage =
          //       Provider.of<ImageDataProvider>(context, listen: false);
          //   providerImage.quantityImages = sliderValue;
          //   providerImage.clearList();
          //   providerImage.fetchImages();
          //   Navigator.of(context).pop();
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
