// ignore_for_file: file_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:proyecto_final/Env.dart';
import 'package:proyecto_final/HomePage/home_screens.dart';
import 'package:proyecto_final/categoryForm/formulario_categoriaedit.dart';
import 'package:proyecto_final/models/CategoriaModel.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:proyecto_final/theme/theme_manager.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';
import 'package:firebase_storage/firebase_storage.dart' as firabase_storage;

import '../../generated/translations.g.dart';

// diseño de la Card la cual contendra la información de cada una de las categorías y los botones para actualizar y eliminar
class CategoryCard extends StatefulWidget {
  final ThemeManager themeManager;
  final CategoriaModel categoria;

  const CategoryCard(
      {super.key, required this.categoria, required this.themeManager});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  GoogleTranslator translator = GoogleTranslator();

  Future<String> traduccionVariables(BuildContext context, String text) async {
    if (TranslationProvider.of(context).locale.languageCode == 'en') {
      var output = await translator.translate(text, to: "en");
      return output.text;
    } else {
      var output = await translator.translate(text, to: "es");
      return output.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.6),
            offset: const Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: NetworkImage(widget.categoria.imagen),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Información de la categoría
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: FutureBuilder<String>(
                future: traduccionVariables(context, widget.categoria.nombre),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Text(
                      snapshot.data!,
                      style: const TextStyle(fontSize: 19, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    );
                  }
                },
              ),
            ),
          ),
          // Botones de editar y eliminar
          Align(
            alignment: Alignment.bottomLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Botón de editar
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CategoriaFormEdit(
                                      categorias: widget.categoria,
                                      themeManager: widget.themeManager,
                                    )),
                          );
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                // Botón de eliminar
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          _modalBorrarCategoria(
                              context, widget.categoria, widget.themeManager);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Función para mostrar un diálogo de confirmación antes de eliminar una categoría
void _modalBorrarCategoria(
    BuildContext context, CategoriaModel categoria, ThemeManager themeManager) {
  final texts = Translations.of(context);
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            texts.categories.questionCategorie,
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            height: 250,
            width: 400,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Center(
                    child: Text(
                      texts.categories.questionCategorie2,
                      style: const TextStyle(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Image.asset(
                    "assets/images/logo.png",
                    width: 150,
                    height: 150,
                  )
                ],
              ),
            ),
          ),
          actions: [
            // Botones de confirmar o cancelar la eliminación
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(texts.categories.cancel)),
                ElevatedButton(
                    onPressed: () async {
                      // Obtener referencias de almacenamiento para los archivos de la categoría
                      firabase_storage.Reference storageReferenceIcono =
                          firabase_storage.FirebaseStorage.instance
                              .refFromURL(categoria.icono);

                      firabase_storage.Reference storageReferenceImagen =
                          firabase_storage.FirebaseStorage.instance
                              .refFromURL(categoria.imagen);

                      // Eliminar los archivos de almacenamiento
                      await storageReferenceIcono.delete();
                      await storageReferenceImagen.delete();

                      // URL base para la API de categorías
                      String url = "";

                      url = "$djangoApi/api/Categorias/";

                      // Enviar solicitud de eliminación a la API
                      final response =
                          await http.delete(Uri.parse("$url${categoria.id}/"));

                      // Si la eliminación es exitosa, navegar a la pantalla de inicio
                      if (response.statusCode == 204) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => HomeScreenPage(
                              themeManager: themeManager,
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(texts.categories.delete)),
              ],
            ),
          ],
        );
      });
}
