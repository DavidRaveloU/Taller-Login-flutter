import 'package:flutter/material.dart';

class MostrarAlerta extends StatefulWidget {
  final String titulo, texto, colorTexto;
  const MostrarAlerta(
      {super.key,
      required this.titulo,
      required this.texto,
      required this.colorTexto});

  @override
  State<MostrarAlerta> createState() => _MostrarAlertaState();
}

class _MostrarAlertaState extends State<MostrarAlerta> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.widget.titulo),
      content: Text(
        this.widget.texto,
        style: TextStyle(color: Colors.red),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Aceptar'),
          onPressed: () {
            Navigator.of(context).pop('Aceptar');
          },
        )
      ],
    );
  }
}
