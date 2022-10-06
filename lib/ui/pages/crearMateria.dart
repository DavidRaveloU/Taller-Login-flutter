import 'package:flutter/material.dart';
import 'package:login/ui/pages/widget.dart';

import '../../domain/entities/materias.dart';

class AdicionarMaterias extends StatefulWidget {
  final Materia gestionmateria;
  const AdicionarMaterias({Key? key, required this.gestionmateria})
      : super(key: key);

  @override
  State<AdicionarMaterias> createState() => _AdicionarMateriasState();
}

class _AdicionarMateriasState extends State<AdicionarMaterias> {
  final List<Materia> _addmateria = [];
  TextEditingController controlnombre = TextEditingController();
  TextEditingController controlprofesor = TextEditingController();
  TextEditingController controlnota = TextEditingController();
  TextEditingController controlcreditos = TextEditingController();
  @override
  void initState() {
    controlnombre.text = widget.gestionmateria.nombre;
    controlprofesor.text = widget.gestionmateria.profesor;
    controlcreditos.text = widget.gestionmateria.creditos;
    controlnota.text = widget.gestionmateria.nota;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Materias'),
      ),
      body: Column(
        children: [
          Textos(
            controlartextos: controlnombre,
            etiqueta: 'Nombre',
          ),
          Textos(
            controlartextos: controlprofesor,
            etiqueta: 'Profesor',
          ),
          Textos(
            controlartextos: controlnota,
            etiqueta: 'Nota',
          ),
          Textos(
            controlartextos: controlcreditos,
            etiqueta: 'Creditos',
          ),
          ElevatedButton(
              onPressed: () {
                _addmateria.add(Materia(
                    nombre: controlnombre.text,
                    profesor: controlprofesor.text,
                    nota: controlnota.text,
                    creditos: controlcreditos.text));

                Navigator.pop(context, _addmateria);
              },
              child: const Text('Adicionar Materia'))
        ],
      ),
    );
  }
}
