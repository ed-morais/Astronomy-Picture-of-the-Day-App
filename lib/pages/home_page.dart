import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/image_data_provider.dart';
import '../widgets/animated_button.dart';
import '../widgets/image_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget indicator = const CircularProgressIndicator();
  @override
  void initState() {
    _loadRequest();
    super.initState();
  }

  _loadRequest() async {
    final provider = Provider.of<ImageDataProvider>(context, listen: false);
    await provider.fetchImages();
    if (provider.status != 200) {
      alertError();
    }
  }

  Future<void> _reloadRequest() async {
    setState(() {
      indicator = const CircularProgressIndicator();
    });
    final provider = Provider.of<ImageDataProvider>(context, listen: false);
    provider.clearList();
    await provider.fetchImages();
    if (provider.status != 200) {
      alertError();
    }
  }

  void alertError() {
    setState(() {
      indicator = const Icon(
        Icons.error_rounded,
        size: 80.0,
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: ListTile(
        leading: const Icon(
          Icons.error,
          color: Colors.red,
        ),
        title: Text(
          'Sorry, we had trouble loading the app.',
          style: TextStyle(color: Colors.red.shade300, fontSize: 20.0),
        ),
      ),
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        textColor: Colors.white,
        backgroundColor: Theme.of(context).primaryColor,
        label: 'try again',
        onPressed: () {},
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final providerImage = Provider.of<ImageDataProvider>(context, listen: true);
    final images = providerImage.images;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Cosmic Explorer',
          style: GoogleFonts.getFont('Play'),
        ),
        actions: [
          IconButton(
            onPressed: () => _reloadRequest(),
            icon: const Icon(Icons.refresh_rounded),
          )
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: images.isEmpty
          ? Center(child: indicator)
          : RefreshIndicator(
              color: Theme.of(context).primaryColor,
              onRefresh: _reloadRequest,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: images.length,
                itemBuilder: (context, index) => ImageCard(
                  imageData: images[index],
                  index: index + 1,
                  length: images.length,
                ),
              ),
            ),
      floatingActionButton: const AnimatedButton(),
    );
  }
}
