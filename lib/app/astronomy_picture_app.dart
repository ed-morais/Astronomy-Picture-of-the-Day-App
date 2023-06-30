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
          builder: (context, ConfigAppProvider configAppProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: configAppProvider.isDark
              ? ThemeData(
                  primaryColor: configAppProvider.primaryColor,
                  useMaterial3: true,
                  brightness: Brightness.dark,
                  progressIndicatorTheme: ProgressIndicatorThemeData(
                      color: configAppProvider.primaryColor))
              : ThemeData(
                  colorSchemeSeed: configAppProvider.primaryColor,
                  useMaterial3: true,
                  hintColor: Colors.black,
                  brightness: Brightness.light,
                  progressIndicatorTheme: ProgressIndicatorThemeData(
                      color: configAppProvider.primaryColor)),
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
