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
      content: Container(
        height: 230,
        child: const Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children: [
            Text('Name: Edilson Morais Brito'),
            Text('Email: edilsonmoraisbrito@aluno.uespi'),
            Text('Registration: 1078234'),
            Divider(color: Colors.purple),
            Text('Francisco Mendes Magalhães'),
            Text('Email: fmmagalhaesfilho@aluno.uespi'),
            Text('Registration: 1078256'),
            Divider(color: Colors.purple),
            Text('Name: Tiago da Silva Carvalho'),
            Text('Email: tdasilvacarvalho@aluno.uespi'),
            Text('Registration: 1078249')
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'OK'),
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.purple),
          ),
        ),
      ],
    );
  }
}