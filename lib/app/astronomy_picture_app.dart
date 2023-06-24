import 'package:flutter/material.dart';

import '../pages/home_page.dart';
import 'config/routes.dart';

class AstronomyPictureApp extends StatelessWidget {
  const AstronomyPictureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AstronomyPictureApp',
      initialRoute: RoutesApp.home,
      routes: {
        RoutesApp.home: (context) => const HomePage(),
      },
      // routes: ,
    );
  }
}
