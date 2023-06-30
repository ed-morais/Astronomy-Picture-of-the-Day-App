import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/picture_data.dart';
import '../pages/saves_page.dart';
import '../pages/home_page.dart';
import '../pages/picture_datail_page.dart';
import '../pages/settings_page.dart';
import '../providers/image_data_provider.dart';
import '../providers/config_app_provider.dart';
import 'config/routes.dart';

class AstronomyPictureApp extends StatelessWidget {
  const AstronomyPictureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ImageDataProvider>(
          create: (_) => ImageDataProvider(),
        ),
        ChangeNotifierProvider<ConfigAppProvider>(
          create: (_) => ConfigAppProvider(),
        )
      ],
      child: Consumer<ConfigAppProvider>(
          builder: (context, ConfigAppProvider ConfigAppProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ConfigAppProvider.isDark
              ? ThemeData(
                  colorSchemeSeed: Colors.deepPurpleAccent,
                  useMaterial3: true,

                  // hintColor: Colors.white,

                  // cardColor: Colors.deepPurple.shade100
                  brightness: Brightness.dark,
                )
              : ThemeData(
                  colorSchemeSeed: Colors.deepPurpleAccent,
                  useMaterial3: true,
                  hintColor: Colors.black,
                  // cardColor: Colors.deepPurple.shade100
                  brightness: Brightness.light,
                ),
          title: 'AstronomyPictureApp',
          initialRoute: RoutesApp.home.name,
          routes: {
            RoutesApp.home.name: (context) => const HomePage(),
            RoutesApp.pictureDetailsPage.name: (context) {
              final pictuteDetails =
                  ModalRoute.of(context)?.settings.arguments as ImageData;
              return PictureDetailPage(pictuteDetails: pictuteDetails);
            },
            RoutesApp.settings.name: (context) => const SettingsPage(),
            RoutesApp.saves.name: (context) => const SavesPage(),
          },
        );
      }),
    );
  }
}
