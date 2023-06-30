import 'package:flutter/material.dart';

class InfoModal extends StatelessWidget {
  const InfoModal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Information',
        textAlign: TextAlign.center,
      ),
      content: SizedBox(
        height: 220,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Name: Edilson Morais Brito'),
              const Text('Email: edilsonmoraisbrito@aluno.uespi'),
              const Text('Registration code: 1078234'),
              Divider(color: Theme.of(context).primaryColor),
              const Text('Francisco Mendes Magalhães'),
              const Text('Email: fmmagalhaesfilho@aluno.uespi'),
              const Text('Registration code: 1078256'),
              Divider(color: Theme.of(context).primaryColor),
              const Text('Name: Tiago da Silva Carvalho'),
              const Text('Email: tdasilvacarvalho@aluno.uespi'),
              const Text('Registration code: 1078249')
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(Theme.of(context).primaryColor)),
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
