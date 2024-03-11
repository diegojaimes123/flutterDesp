// ignore_for_file: file_names

import "package:flutter/material.dart";
import "package:proyecto_final/generated/translations.g.dart";
import "package:proyecto_final/models/HabitacionModel.dart";
import "package:proyecto_final/theme/theme_constants.dart";
import "package:translator/translator.dart";

class HabitacionCard extends StatefulWidget {
  // parametro para almacenar la habitación
  final HabitacionModel habitacion;

  const HabitacionCard({super.key, required this.habitacion});

  @override
  State<HabitacionCard> createState() => _HabitacionCardState();
}

class _HabitacionCardState extends State<HabitacionCard> {
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
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(50.0),
                          child: Container(
                            color: primaryColor,
                            child: const Icon(
                              Icons.bed_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                          )),
                      const SizedBox(
                        width: defaultPadding,
                      ),
                      // Titulo de la habitación
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FutureBuilder<String>(
                            future: traduccionVariables(
                                context, widget.habitacion.titulo),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return Text(
                                  snapshot.data!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                );
                              }
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                // descripción de la habitación
                FutureBuilder<String>(
                  future: traduccionVariables(
                      context, widget.habitacion.descripcion),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
