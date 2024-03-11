import 'package:proyecto_final/generated/translations.g.dart';

// Clase para representar opciones de tipo de documento
class TipoDocumento {
  final String? titulo, valor;

  // Constructor que inicializa el título y el valor de la opción
  TipoDocumento(this.titulo, this.valor);
}

// Lista de opciones para el tipo de documento
final List options = [
  TipoDocumento(texts.lista.cc, "CC"),
  TipoDocumento(texts.lista.ce, "CE"),
  TipoDocumento(texts.lista.pass, "PAS"),
  TipoDocumento(texts.lista.nit, "NIT"),
];

// Clase para representar opciones de tipo de banco
class TipoBanco {
  final String? titulo, valor;

  // Constructor que inicializa el título y el valor de la opción
  TipoBanco(this.titulo, this.valor);
}

// Lista de opciones para el tipo de banco
final List items = [
  TipoBanco(texts.lista.banks.one, "BANCOLOMBIA"),
  TipoBanco(texts.lista.banks.two, "Banco de Bogotá"),
  TipoBanco(texts.lista.banks.three, "Banco caja social"),
  TipoBanco(texts.lista.banks.four, "Av Villas"),
  TipoBanco(texts.lista.banks.five, "Banco de occidente"),
  TipoBanco(texts.lista.banks.six, "Banco Popular"),
  TipoBanco(texts.lista.banks.seven, "Banco Agrario"),
  TipoBanco(texts.lista.banks.eight, "Davivienda"),
  TipoBanco(texts.lista.banks.nine, "Colpatria"),
];
