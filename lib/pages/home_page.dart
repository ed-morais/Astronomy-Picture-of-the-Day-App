import 'package:astronomy_picture_app/app/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import '../providers/image_data_provider.dart';
import '../widgets/image_card.dart';
import '../widgets/info_modal.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    loadRequest();
    super.initState();
  }

  loadRequest() async {
    final provider = Provider.of<ImageDataProvider>(context, listen: false);
    await provider.fetchImages();
    if (provider.status != 200 && provider.status != 408) {
      debugPrint('Error >>>> : ${provider.status}');
      alertError();
    }
  }

  Future<void> reloadRequest() async {
    final provider = Provider.of<ImageDataProvider>(context, listen: false);
    provider.clearList();
    await provider.fetchImages();
    if (provider.status != 200 && provider.status != 408) {
      debugPrint('Error >>>>> : ${provider.status}');
      alertError();
    }
  }

  void alertError() {
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
        label: 'try again',
        onPressed: () {
          reloadRequest();
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final providerImage = Provider.of<ImageDataProvider>(context, listen: true);
    final images = providerImage.images;

    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        title: Text(
          'Cosmic Explorer',
          style: GoogleFonts.getFont('Play'),
        ),
        actions: [
          IconButton(
            onPressed: () => reloadRequest(),
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
          ? Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            )
          : RefreshIndicator(
              color: Theme.of(context).primaryColor,
              onRefresh: reloadRequest,
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
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Theme.of(context).primaryColor,
        overlayColor: Colors.black,
        overlayOpacity: 0.7,
        spacing: 10,
        spaceBetweenChildren: 10,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.group),
            label: 'Information',
            // backgroundColor: Colors.purple.shade700,
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
            // backgroundColor: Colors.purple.shade700,
            onTap: () {
              Navigator.of(context).pushNamed(RoutesApp.settings.name);
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.bookmarks),
            label: 'Saves',
            // backgroundColor: Colors.purple.shade700,
            onTap: () {
              Navigator.of(context).pushNamed(RoutesApp.saves.name);
            },
          ),
        ],
      ),
    );
  }
}
