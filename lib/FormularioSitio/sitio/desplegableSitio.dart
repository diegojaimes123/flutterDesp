// Clase para representar opciones de tipo de documento
// ignore_for_file: file_names

import 'package:proyecto_final/generated/translations.g.dart';

class Continente {
  final String? titulo, valor;

  // Constructor que inicializa el título y el valor de la opción
  Continente(this.titulo, this.valor);
}

// Lista de opciones para el tipo de documento
final List continente = [
  Continente(texts.pantallaDos.america_del_sur, "AMÉRICA DEL SUR"),
  Continente(texts.pantallaDos.america_del_norte, "AMÉRICA DEL NORTE"),
  Continente(texts.pantallaDos.centro_america, "CENTRO AMÉRICA"),
  Continente(texts.pantallaDos.europa, "EUROPA"),
  Continente(texts.pantallaDos.asia, "ASIA"),
  Continente(texts.pantallaDos.africa, "ÁFRICA"),
  Continente(texts.pantallaDos.oceania, "OCEANÍA"),
];
