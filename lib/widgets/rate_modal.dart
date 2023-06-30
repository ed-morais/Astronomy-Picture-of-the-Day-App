import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../providers/config_app_provider.dart';

class RateModal extends StatelessWidget {
  const RateModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final configAppRate = Provider.of<ConfigAppProvider>(context, listen: true);
    double ratingValue = configAppRate.rate;
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
                height: 7.0,
              ),
              RatingBar.builder(
                initialRating: configAppRate.rate,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Theme.of(context).primaryColor,
                ),
                onRatingUpdate: (rating) {
                  ratingValue = rating;

                  // print(rating);
                },
              ),
              const SizedBox(
                height: 10.0,
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
            style: TextStyle(
                color: Theme.of(context).primaryColor, fontSize: 15.0),
          ),
        ),
        TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Theme.of(context).primaryColor)),
          onPressed: () {
            configAppRate.changeRate(ratingValue);
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
