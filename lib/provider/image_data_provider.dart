import 'dart:convert';

import 'package:astronomy_picture_app/app/const/const.dart';
import 'package:flutter/material.dart';

import '../models/picture_data.dart';
import 'package:http/http.dart' as http;

class ImageDataProvider with ChangeNotifier {
  final List<ImageData> _images = [];
  int _quantityImages = 5;
  late int status;

  List<ImageData> get images => _images;

  int get getQuantityImages => _quantityImages;

  set quantityImages(int quantityImages) {
    _quantityImages = quantityImages;
    notifyListeners();
  }

  void clearList() {
    _images.clear();
    notifyListeners();
  }

  Future<void> fetchImages() async {
    final Uri url = Uri.parse(
        'https://api.nasa.gov/planetary/apod?api_key=$kApiKey&count=$_quantityImages');

    final http.Response response =
        await http.get(url).timeout(const Duration(seconds: 15), onTimeout: () {
      return http.Response('Error timeout', 408);
    });
    status = response.statusCode;
    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);

      for (Map<String, dynamic> elem in body) {
        _images.add(ImageData(
          title: elem['title'] ?? "",
          imageUrl: elem['url'] ??
              "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png",
          date: elem['date'] ?? "",
          explanation: elem['explanation'] ?? "",
          copyright: elem['copyright'] ?? "Not available via API",
        ));
        notifyListeners();
      }
    } else {
      debugPrint('Request failed: ${response.statusCode}');
    }
  }
}
