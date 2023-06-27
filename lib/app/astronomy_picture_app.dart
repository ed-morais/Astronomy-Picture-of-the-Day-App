import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/picture_data.dart';
import '../pages/home_page.dart';
import '../pages/picture_datail_page.dart';
import '../pages/settings_page.dart';
import '../provider/image_data_provider.dart';
import 'config/routes.dart';

class AstronomyPictureApp extends StatelessWidget {
  const AstronomyPictureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ImageDataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: Colors.black,
          colorSchemeSeed: Colors.deepPurpleAccent,
          useMaterial3: true,
          // cardColor: Colors.deepPurple.shade100
          brightness: Brightness.dark,
        ),
        title: 'AstronomyPictureApp',
        initialRoute: RoutesApp.home,
        routes: {
          RoutesApp.home: (context) => const HomePage(),
          RoutesApp.pictureDetailsPage: (context) {
            final pictuteDetails =
                ModalRoute.of(context)?.settings.arguments as ImageData;
            return PictureDetailPage(pictuteDetails: pictuteDetails);
          },
          RoutesApp.settings: (context) => const SettingsPage(),
        },
      ),
    );
  }
}
