import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/home_page.dart';
import '../pages/picture_datail_page.dart';
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
          colorSchemeSeed: Colors.deepPurpleAccent,
          useMaterial3: false,
          // cardColor: Colors.deepPurple.shade100
          // brightness: Brightness.dark,
        ),
        title: 'AstronomyPictureApp',
        initialRoute: RoutesApp.home,
        routes: {
          RoutesApp.home: (context) => const HomePage(),
          RoutesApp.pictureDetailsPage: (context) => const PictureDetailPage(),
        },
      ),
    );
  }
}
