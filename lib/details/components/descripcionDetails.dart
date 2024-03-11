// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:proyecto_final/generated/translations.g.dart';
import 'package:proyecto_final/models/SitioModel.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:translator/translator.dart';

class DescripcionDetails extends StatefulWidget {
  // parametros para almacenar el sitio
  final SitioModel sitio;

  const DescripcionDetails({
    super.key,
    required this.sitio,
  });

  @override
  State<DescripcionDetails> createState() => _DescripcionDetailsState();
}

class _DescripcionDetailsState extends State<DescripcionDetails> {
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Fragmento del la descripción del sitio
        FutureBuilder<String>(
          future: traduccionVariables(context, widget.sitio.descripcion),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text(
                snapshot.data!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.grey),
              );
            }
          },
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        // Botón para mostrar la descripción del sitio completa
        TextButton(
            onPressed: () {
              _modalDescripcion(context, widget.sitio);
            },
            child: Text(
              texts.cosas_faltantes.showMore,
              style: Theme.of(context).textTheme.titleMedium,
            ))
      ],
    );
  }

  // Modal de la descripción completa
  void _modalDescripcion(BuildContext context, SitioModel sitio) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 600,
              width: MediaQuery.of(context).size.height,
              child: ListView(
                children: [
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  // Titulo del modal
                  Text(
                    texts.cosas_faltantes.modalText,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  // Descripción del sitio
                  Expanded(
                    child: FutureBuilder<String>(
                      future: traduccionVariables(context, sitio.descripcion),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          return Text(
                            snapshot.data!,
                            style: const TextStyle(color: Colors.grey),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              // acciones del modal
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(texts.reserva.cerrar))
                ],
              )
            ],
          );
        });
  }
}
