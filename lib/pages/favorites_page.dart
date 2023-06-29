import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/image_data_provider.dart';
import '../widgets/image_card.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = Provider.of<ImageDataProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorites'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: favorites.favorites.length,
        itemBuilder: (context, index) => ImageCard(
          imageData: favorites.favorites[index],
          index: index + 1,
          length: favorites.favorites.length,
        ),
      ),
    );
  }
}
