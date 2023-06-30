import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../app/config/routes.dart';
import 'info_modal.dart';

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Theme.of(context).primaryColor,
      overlayColor: Colors.black,
      overlayOpacity: 0.7,
      spacing: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      spaceBetweenChildren: 10,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.group),
          label: 'Information',
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const InfoModal();
              },
            );
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.settings),
          label: 'Settings',
          onTap: () {
            Navigator.of(context).pushNamed(RoutesApp.settings.name);
          },
        ),
        SpeedDialChild(
          child: const Icon(Icons.bookmarks),
          label: 'Saves',
          onTap: () {
            Navigator.of(context).pushNamed(RoutesApp.saves.name);
          },
        ),
      ],
    );
  }
}
