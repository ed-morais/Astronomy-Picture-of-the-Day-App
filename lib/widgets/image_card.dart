import 'package:flutter/material.dart';

import '../app/config/routes.dart';
import '../models/picture_data.dart';

class ImageCard extends StatelessWidget {
  final ImageData imageData;
  final int index;
  final int length;
  const ImageCard({
    super.key,
    required this.imageData,
    required this.index,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      color: Theme.of(context).cardColor,
      margin: length > index
          ? const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0)
          : const EdgeInsets.only(
              top: 10.0, left: 15.0, right: 15.0, bottom: 80.0),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            RoutesApp.pictureDetailsPage.name,
            arguments: imageData,
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(imageData.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    '$index. ${imageData.title}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.date_range,
                          size: 25.0, color: Theme.of(context).primaryColor),
                      const SizedBox(width: 5.0),
                      Text(
                        imageData.date,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
