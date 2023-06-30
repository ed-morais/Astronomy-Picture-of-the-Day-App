import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import '../providers/config_app_provider.dart';

class ColorPickerDialog extends StatefulWidget {
  const ColorPickerDialog({super.key});

  @override
  State<ColorPickerDialog> createState() => _ColorPickerDialogState();
}

class _ColorPickerDialogState extends State<ColorPickerDialog> {
  late Color pickerColor;

  @override
  void initState() {
    super.initState();
    final configApp = Provider.of<ConfigAppProvider>(context, listen: false);
    pickerColor = configApp.primaryColor;
  }

  @override
  Widget build(BuildContext context) {
    final configApp = Provider.of<ConfigAppProvider>(context, listen: false);

    return AlertDialog(
      title: const Text('Pick a color!'),
      content: SingleChildScrollView(
        child: BlockPicker(
          pickerColor: pickerColor,
          onColorChanged: (Color color) {
            setState(() {
              pickerColor = color;
            });
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 15.0,
            ),
          ),
        ),
        TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStatePropertyAll(Theme.of(context).primaryColor),
          ),
          onPressed: () {
            configApp.changeColor(pickerColor);
            Navigator.pop(context, 'OK');
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
