import 'package:flutter/material.dart';

import '../app/config/routes.dart';
import '../models/picture_data.dart';

class ImageCard extends StatelessWidget {
  final ImageData imageData;
  final int index;
  const ImageCard({
    super.key,
    required this.imageData,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      color: Theme.of(context).cardColor,
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            RoutesApp.pictureDetailsPage,
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
                  // ListTile(
                  //   leading: Icon(Icons.fullscreen_exit_sharp),
                  //   title: Text(
                  //     'Lembre-se de que o design é uma preferência pessoal',
                  //     style: TextStyle(
                  //       fontSize: 18.0,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
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
                      const Icon(
                        Icons.date_range,
                        size: 18.0,
                        color: Colors.grey,
                      ),
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
