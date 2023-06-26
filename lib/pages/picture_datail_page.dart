import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../models/picture_data.dart';

class PictureDetailPage extends StatelessWidget {
  final ImageData pictuteDetails;
  const PictureDetailPage({super.key, required this.pictuteDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detalhes da imagem',
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              pictuteDetails.imageUrl,
              height: 299.9,
              fit: BoxFit.cover,
            ),
            // String title;
            // String imageUrl;
            // String date;
            // String explanation;
            // String copyright;
            Card(
              // margin: EdgeInsets.symmetric(horizontal: 20.0),
              margin: EdgeInsets.zero,
              elevation: 10.0,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.only(
              //       topRight: Radius.circular(50.0),
              //       bottomLeft: Radius.circular(50.0)),
              // ),
              child: ClipPath(
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      right: BorderSide(
                        color: Colors.purple,
                        width: 5,
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(pictuteDetails.title),
                        leading: const Icon(Icons.title_outlined),
                      ),
                      ListTile(
                        title: Text(pictuteDetails.date),
                        leading: const Icon(Icons.date_range),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ReadMoreText(
                          pictuteDetails.explanation,
                          textAlign: TextAlign.justify,
                          trimLines: 3,
                          preDataTextStyle:
                              const TextStyle(fontWeight: FontWeight.w500),
                          style: const TextStyle(color: Colors.white),
                          colorClickableText: Colors.purple,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: 'Show more',
                          trimExpandedText: ' show less',
                        ),
                      ),
                      ListTile(
                        title: Text(pictuteDetails.copyright),
                        leading: const Icon(Icons.copyright),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
