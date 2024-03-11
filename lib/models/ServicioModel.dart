// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:proyecto_final/Env.dart';

// Modelo para representar un servicio
class ServicioModel {
  final int id; // id del servicio
  final String icono; // icono del servicio
  final String nombre; // nombre del servicio
  final String descripcion; // descripción del servicio
  final int sitio; // id del sitio relacionado al servicio

  ServicioModel(
      {required this.id,
      required this.icono,
      required this.nombre,
      required this.descripcion,
      required this.sitio});
}

// Lista que contendrá los objetos ServicioModel
List<ServicioModel> servicio = [];

// Función asincrónica para obtener la lista de servicios desde la API
Future<List<ServicioModel>> getServicio() async {
  String url = "";

  url = "$djangoApi/api/Servicios/";

  // Realizar la solicitud HTTP para obtener la lista de servicios
  final response = await http.get(Uri.parse(url));

  // Verificar si la solicitud fue exitosa (código de respuesta 200)
  if (response.statusCode == 200) {
    // Limpiar la lista de servicios antes de agregar nuevos elementos
    servicio.clear();

    // Decodificar la respuesta JSON a UTF-8
    String responseBodyUtf8 = utf8.decode(response.bodyBytes);
    List<dynamic> decodedData = jsonDecode(responseBodyUtf8);

    // Iterar a través de todos los usuarios en decodedData
    for (var servicioData in decodedData) {
      // Construir el modelo de servicio para cada servicio en la lista
      servicio.add(ServicioModel(
          id: servicioData['id'] ?? 0,
          icono: servicioData['icono'] ?? 0,
          nombre: servicioData['nombre'] ?? 0,
          descripcion: servicioData['descripcion'] ?? 0,
          sitio: servicioData['sitio'] ?? 0));
    }

    // Devolver la lista de servicios construida
    return servicio;
  } else {
    // Manejar el fallo de la solicitud HTTP
    throw Exception(
        'Fallo la solicitud HTTP con código ${response.statusCode}');
  }
}
