import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
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
          'Image details',
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
              fit: BoxFit.cover,
            ),
            Card(
              margin: EdgeInsets.zero,
              elevation: 10.0,
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
            pictuteDetails.videoUrl != ''
                ? Container(
                    margin: const EdgeInsetsDirectional.symmetric(
                        horizontal: 50.0, vertical: 30.0),
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        var url = Uri.parse(pictuteDetails.videoUrl);
                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                        }
                      },
                      icon: const Icon(Icons.play_circle),
                      label: const Text("Play Video "),
                    ),
                  )
                : const Text(''),
          ],
        ),
      ),
    );
  }
}
