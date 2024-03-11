// Clase para representar opciones de tipo de documento
// ignore_for_file: file_names

import 'package:proyecto_final/generated/translations.g.dart';

class ContinenteBuscador {
  final String? titulo, valor;

  // Constructor que inicializa el título y el valor de la opción
  ContinenteBuscador(this.titulo, this.valor);
}

// Lista de opciones para el tipo de documento
final List continente = [
  ContinenteBuscador(texts.pantallaDos.america_del_sur, "AMÉRICA DEL SUR"),
  ContinenteBuscador(texts.pantallaDos.america_del_norte, "AMÉRICA DEL NORTE"),
  ContinenteBuscador(texts.pantallaDos.centro_america, "CENTRO AMÉRICA"),
  ContinenteBuscador(texts.pantallaDos.europa, "EUROPA"),
  ContinenteBuscador(texts.pantallaDos.asia, "ASIA"),
  ContinenteBuscador(texts.pantallaDos.africa, "ÁFRICA"),
  ContinenteBuscador(texts.pantallaDos.oceania, "OCEANÍA"),
];
