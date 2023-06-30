import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/image_data_provider.dart';
import '../widgets/image_card.dart';

class SavesPage extends StatelessWidget {
  const SavesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final saves = Provider.of<ImageDataProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Saves'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: saves.saves.length,
        itemBuilder: (context, index) => ImageCard(
          imageData: saves.saves[index],
          index: index + 1,
          length: saves.saves.length,
        ),
      ),
    );
  }
}
