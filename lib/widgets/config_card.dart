import 'package:flutter/material.dart';

class ConfigCard extends StatelessWidget {
  final String title;
  final Widget body;
  const ConfigCard({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                width: 15.0,
                height: 20.0,
              ),
              body
            ],
          ),
        ),
      ),
    );
  }
}
