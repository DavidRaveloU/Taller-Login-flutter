class Materia {
  var nombre;
  var creditos;
  var profesor;
  var nota;

  Materia({this.nombre, this.creditos, this.nota, this.profesor});
}

List<Materia> listadoMaterias = [
  Materia(
      nombre: 'Programacion Movil',
      creditos: '3',
      nota: '4.3',
      profesor: 'Alex Vacca'),
  Materia(
      nombre: 'Inteligencia Artificial',
      creditos: '3',
      nota: '3.3',
      profesor: 'Tony Jimenez'),
  Materia(
      nombre: 'Base de Datos',
      creditos: '4',
      nota: '2.3',
      profesor: 'Amilkar Sierra'),
];
