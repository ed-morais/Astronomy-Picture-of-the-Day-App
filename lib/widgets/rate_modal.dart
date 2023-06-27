import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RateModal extends StatelessWidget {
  const RateModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.purple.shade800,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
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
          onPressed: () => Navigator.pop(context, 'Cancel'),
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.purple.shade800, fontSize: 15.0),
          ),  
        ),
        TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Colors.purple.shade800)),
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),  
        ),
      ],
    );
  }
}
