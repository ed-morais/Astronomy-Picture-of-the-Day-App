import 'dart:convert';

import 'package:flutter/material.dart';

import '../models/picture_data.dart';
import 'package:http/http.dart' as http;

class ImageDataProvider with ChangeNotifier {
  // final url =
  //     'https://api.nasa.gov/planetary/apod?api_key=yujInVqEdeqTNc8nJngJPK8voxfofRguhfieZYnp';

  final List<ImageData> _images = [];

  List<ImageData> get images => _images;

  int quantityImages = 5;

  void loadImages() async {
    const String apiKey = 'yujInVqEdeqTNc8nJngJPK8voxfofRguhfieZYnp';
    final String url =
        'https://api.nasa.gov/planetary/apod?api_key=$apiKey&count=$quantityImages';

    final Uri urlRequest = Uri.parse(url);

    try {
      final http.Response response = await http.get(urlRequest);
      if (response.statusCode == 200) {
        final List<dynamic> body = jsonDecode(response.body);

        for (Map<String, dynamic> elem in body) {
          debugPrint(elem['date']);
          debugPrint(elem['url']);
          _images.add(ImageData(
            title: elem['title'] ?? "",
            imageUrl: elem['url'] ??
                "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png",
            date: elem['date'] ?? "",
            explanation: elem['explanation'] ?? "",
            copyright: elem['copyright'] ?? "",
          ));
          notifyListeners();
        }
      } else {
        debugPrint('Falha na requisição: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Erro na requisição: $error');
    }
  }
}
