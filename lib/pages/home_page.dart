import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/image_data_provider.dart';
import '../widgets/image_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final providerImage =
        Provider.of<ImageDataProvider>(context, listen: false);
    providerImage.fetchImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final providerImage = Provider.of<ImageDataProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'APOD',
        ),
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('clicou');
            },
            icon: const Icon(Icons.settings),
          )
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: providerImage.fetchImages,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: providerImage.images.length,
          itemBuilder: (context, index) =>
              ImageCard(imageData: providerImage.images[index]),
          // ItemTile(transaction: transactions[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => providerImage.fetchImages(),
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
