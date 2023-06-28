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
        await http.get(url).timeout(const Duration(seconds: 7), onTimeout: () {
      fetchImages();
      return http.Response('Error timeout', 408);
    });
    status = response.statusCode;
    if (response.statusCode == 200) {
      debugPrint('API VOLTOU COM A RESPOSTA >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
      final List<dynamic> body = jsonDecode(response.body);

      final List<Map<String, dynamic>> imageList = List.castFrom(body);

      for (Map<String, dynamic> elem in imageList) {
        _images.add(ImageData(
          title: elem['title'] ?? kDefaulPhrase,
          imageUrl: elem['media_type'] == 'video'
              ? "https://i.imgur.com/Vfvinpc.png"
              : elem['url'],
          date: formatDate(elem['date']) ?? kDefaulPhrase,
          explanation: elem['explanation'] ?? kDefaulPhrase,
          copyright: elem['copyright'] ?? kDefaulPhrase,
          mediaType: elem['media_type'] ?? kDefaulPhrase,
          videoUrl: elem['media_type'] == 'video' ? elem['url'] : '',
        ));
        notifyListeners();
      }
    } else {
      debugPrint('Error response format ${response.statusCode}');
    }
  }

  String? formatDate(String data) {
    String isoDate = data;
    DateTime parsedDate = DateTime.parse(isoDate);

    int year = parsedDate.year;
    int month = parsedDate.month;
    int day = parsedDate.day;

    String formattedDate =
        "${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year";
    return formattedDate;
  }
}
