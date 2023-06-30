import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:astronomy_picture_app/app/const/const.dart';
import 'package:flutter/material.dart';
import '../models/picture_data.dart';

class ImageDataProvider with ChangeNotifier {
  final List<ImageData> _images = [];
  final List<ImageData> _saves = [];
  int _quantityImages = 5;
  late int status;

  List<ImageData> get images => _images;
  List<ImageData> get saves => _saves;
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
    final Uri url = Uri.parse('$kBaseUrl$_quantityImages');

    final http.Response response =
        await http.get(url).timeout(const Duration(seconds: 12), onTimeout: () {
      return http.Response('Error timeout', 408);
    });

    status = response.statusCode;

    if (response.statusCode == 200) {
      final List<dynamic> body = jsonDecode(response.body);

      final List<Map<String, dynamic>> imagesList = List.castFrom(body);
      populateImages(imagesList);
    } else {
      http.Response('Error', status);
      debugPrint('Error response format ${response.statusCode}');
    }
  }

  void populateImages(List<Map<String, dynamic>> imagesList) {
    for (Map<String, dynamic> elem in imagesList) {
      _images.add(ImageData(
        title: elem['title'] ?? kDefaulPhrase,
        imageUrl: elem['media_type'] == 'video' ? kDefaultImage : elem['url'],
        date: formatDate(elem['date']) ?? kDefaulPhrase,
        explanation: elem['explanation'] ?? kDefaulPhrase,
        copyright: elem['copyright'] ?? kDefaulPhrase,
        mediaType: elem['media_type'] ?? kDefaulPhrase,
        videoUrl: elem['media_type'] == 'video' ? elem['url'] : '',
      ));
      notifyListeners();
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

  void addSavesImages(ImageData image) {
    saves.add(image);
    notifyListeners();
  }

  void removeSavedImages(int index) {
    saves.removeAt(index);
    notifyListeners();
  }
}
