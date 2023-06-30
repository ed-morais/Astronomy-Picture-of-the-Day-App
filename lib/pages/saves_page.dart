import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/image_data_provider.dart';
import '../widgets/image_card.dart';

class SavesPage extends StatelessWidget {
  const SavesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final savesImage = Provider.of<ImageDataProvider>(context, listen: true);
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
      body: savesImage.saves.isEmpty
          ? Image.network(
              'https://neilpatel.com/wp-content/uploads/2019/05/pagina-de-error-404.jpeg',
              fit: BoxFit.cover,
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: savesImage.saves.length,
              itemBuilder: (context, index) => ImageCard(
                imageData: savesImage.saves[index],
                index: index + 1,
                length: savesImage.saves.length,
              ),
            ),
    );
  }
}
