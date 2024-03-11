// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyecto_final/Env.dart';

// Modelo para representar la seguridad de un sitio
class SeguridadModel {
  final int id; // id seguridad
  final String descripcion; // descripción de la seguridad del sitio
  final int sitio; // id sitio relacionado a seguridad

  SeguridadModel(
      {required this.id, required this.descripcion, required this.sitio});
}

// Lista que contendrá los objetos SeguridadModel
List<SeguridadModel> seguridad = [];

// Función asincrónica para obtener la lista de seguridad desde la API
Future<List<SeguridadModel>> getSeguridad() async {
  String url = "";

  url = "$djangoApi/api/Seguridad/";

  // Realizar la solicitud HTTP para obtener la lista de seguridad
  final response = await http.get(Uri.parse(url));

  // Verificar si la solicitud fue exitosa (código de respuesta 200)
  if (response.statusCode == 200) {
    // Limpiar la lista de seguridad antes de agregar nuevos elementos
    seguridad.clear();

    // Decodificar la respuesta JSON a UTF-8
    String responseBodyUtf8 = utf8.decode(response.bodyBytes);
    List<dynamic> decodedData = jsonDecode(responseBodyUtf8);

    // Iterar a través de todos los usuarios en decodedData
    for (var seguridadData in decodedData) {
      // Construir el modelo de seguridad para cada elemento en la lista
      seguridad.add(SeguridadModel(
        id: seguridadData['id'] ?? 0,
        descripcion: seguridadData['descripcion'] ?? "",
        sitio: seguridadData['sitio'] ?? "",
      ));
    }

    // Devolver la lista de seguridad construida
    return seguridad;
  } else {
    // Manejar el fallo de la solicitud HTTP
    throw Exception(
        'Fallo la solicitud HTTP con código ${response.statusCode}');
  }
}
