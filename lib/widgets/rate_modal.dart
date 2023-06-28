import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../providers/rating_app_provider.dart';

class RateModal extends StatelessWidget {
  const RateModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final rateProvider = Provider.of<RatingAppProvider>(context, listen: true);
    double ratingValue = rateProvider.rate;
    return AlertDialog(
      title: const Text(
        'Rate the app!',
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 80,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                width: 800.0,
                height: 10.0,
              ),
              RatingBar.builder(
                initialRating: rateProvider.rate,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.purple.shade800,
                ),
                onRatingUpdate: (rating) {
                  ratingValue = rating;

                  // print(rating);
                },
              ),
              const Text(
                'Thanks for the support',
                style: TextStyle(fontSize: 18.0),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.purple.shade800, fontSize: 15.0),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Colors.purple.shade800)),
          onPressed: () {
            rateProvider.changeRate(ratingValue);
            Navigator.of(context).pop();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
