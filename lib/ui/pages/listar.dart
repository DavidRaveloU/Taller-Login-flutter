import 'package:flutter/material.dart';
import 'package:login/ui/pages/crearMateria.dart';

import '../../domain/entities/materias.dart';

class ListarMaterias extends StatefulWidget {
  const ListarMaterias({Key? key}) : super(key: key);

  @override
  State<ListarMaterias> createState() => _ListarMateriasState();
}

class _ListarMateriasState extends State<ListarMaterias> {
  final List<Materia> _materias = listadoMaterias;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Listado de Materas'),
      ),
      body: ListView.builder(
          itemCount: _materias.length,
          itemBuilder: (context, pos) {
            return ListTile(
              onLongPress: () {
                _eliminarmateria(context, _materias[pos]);
              },
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => AdicionarMaterias(
                        gestionmateria: _materias[pos]), //Llamar la Vista
                  ),
                ).then((resultado) //Espera por un Resultado
                    {
                  if (resultado != null) {
                    _materias[pos] = resultado[0];
                    //Adiciona a la lista lo que recupera de la vista TextoEjercicio
                    setState(() {});
                  }
                });
              },
              leading: CircleAvatar(
                child: Text(_materias[pos].nota),
              ),
              title: Text(_materias[pos].nombre),
              subtitle: Text(_materias[pos].profesor),
              trailing: CircleAvatar(
                radius: 10,
                child: Text(_materias[pos].creditos),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => AdicionarMaterias(
                  gestionmateria: Materia(
                      nombre: '',
                      profesor: '',
                      nota: '',
                      creditos: '')), //Llamar la Vista
            ),
          ).then((resultado) //Espera por un Resultado
              {
            if (resultado != null) {
              _materias.addAll(
                  resultado); //Adiciona a la lista lo que recupera de la vista TextoEjercicio
              setState(() {});
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _eliminarmateria(context, Materia elmateria) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Eliminar Materia'),
              content: Text('Realmente Dese Eliminar: ${elmateria.nombre}'),
              actions: [
                TextButton(
                    onPressed: () {
                      _materias.remove(elmateria);
                      setState(() {});
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Eliminar',
                      style: TextStyle(color: Colors.red),
                    )),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(color: Colors.blue),
                    ))
              ],
            ));
  }
}
