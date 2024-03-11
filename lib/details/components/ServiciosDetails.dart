// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:proyecto_final/generated/translations.g.dart';
import 'package:proyecto_final/models/ServicioModel.dart';
import 'package:proyecto_final/models/SitioModel.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:translator/translator.dart';

class ServiciosDetails extends StatefulWidget {
  // parametros para almacenar el sitio
  final SitioModel sitio;

  const ServiciosDetails({
    super.key,
    required this.sitio,
  });

  @override
  State<ServiciosDetails> createState() => _ServiciosDetailsState();
}

class _ServiciosDetailsState extends State<ServiciosDetails> {
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
    // Verificar si el tema actual es oscuro
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Listas para almacenar servicios según la ubicación
    List<ServicioModel> listaServicio = [];

    List<ServicioModel> listaServicio2 = [];

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FutureBuilder(
                      future:
                          getServicio(), // llama todos los servicios almacenados
                      builder: (context,
                          AsyncSnapshot<List<ServicioModel>> servicio) {
                        // Mientras carga la información
                        if (servicio.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        // guarda en una lista todos los servicios correspondientes al sitio en cuestión
                        for (var s = 0; s < servicio.data!.length; s++) {
                          if (widget.sitio.id == servicio.data![s].sitio) {
                            listaServicio.add(servicio.data![s]);
                          }
                        }

                        // ListView de presentación de los servicios
                        return ListView.builder(
                            itemCount: 6,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Row(
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            listaServicio[index].icono),
                                        width: 50,
                                        height: 50,
                                      ),
                                      const SizedBox(
                                        width: defaultPadding,
                                      ),
                                      FutureBuilder<String>(
                                        future: traduccionVariables(context,
                                            listaServicio[index].nombre),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const CircularProgressIndicator();
                                          } else if (snapshot.hasError) {
                                            return Text(
                                                'Error: ${snapshot.error}');
                                          } else {
                                            return Text(
                                              snapshot.data!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            );
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                ],
                              );
                            });
                      }),
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                FutureBuilder(
                    future:
                        getServicio(), // llama a todos los servicios guardados en el servidor
                    builder:
                        (context, AsyncSnapshot<List<ServicioModel>> servicio) {
                      // Mientras se carga la información
                      if (servicio.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      // almacena todos los servicios relacionados al sitio en cuestión
                      for (var s = 0; s < servicio.data!.length; s++) {
                        if (widget.sitio.id == servicio.data![s].sitio) {
                          listaServicio2.add(servicio.data![s]);
                        }
                      }
                      return ElevatedButton(
                        onPressed: () {
                          // modal para ver todos los servicios relacionados al sitio
                          _modalServicio(context, listaServicio2);
                        },
                        style: ButtonStyle(
                          backgroundColor: isDark
                              ? const MaterialStatePropertyAll(secondaryColor)
                              : const MaterialStatePropertyAll(Colors.white),
                          foregroundColor:
                              const MaterialStatePropertyAll(primaryColor),
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(20.0)),
                        ),
                        child: Text(texts.serviciosDetails
                            .summery(name: listaServicio2.length)),
                      );
                    })
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Modal para ver todos los servicios referente a un sitio
  void _modalServicio(BuildContext context, List<ServicioModel> servicio) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SizedBox(
              height: 600,
              width: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  // Titulo
                  Text(
                    texts.serviciosDetails.ofrece,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  // Lista de los servicios referentes a un sitio
                  Expanded(
                    child: SizedBox(
                      height: 495,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: servicio.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                ListTile(
                                  leading: Image(
                                    image: AssetImage(servicio[index].icono),
                                    width: 50,
                                    height: 50,
                                  ),
                                  title: FutureBuilder<String>(
                                    future: traduccionVariables(
                                        context, servicio[index].nombre),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return const CircularProgressIndicator();
                                      } else if (snapshot.hasError) {
                                        return Text('Error: ${snapshot.error}');
                                      } else {
                                        return Text(
                                          snapshot.data!,
                                          style: const TextStyle(
                                              color: primaryColor),
                                        );
                                      }
                                    },
                                  ),
                                  subtitle:
                                      servicio[index].descripcion.isNotEmpty ==
                                              true
                                          ? FutureBuilder<String>(
                                              future: traduccionVariables(
                                                  context,
                                                  servicio[index].descripcion),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return const CircularProgressIndicator();
                                                } else if (snapshot.hasError) {
                                                  return Text(
                                                      'Error: ${snapshot.error}');
                                                } else {
                                                  return Text(
                                                    snapshot.data!,
                                                    style: const TextStyle(
                                                        color: Colors.grey),
                                                  );
                                                }
                                              },
                                            )
                                          : Container(),
                                ),
                                const Divider(
                                  height: 1,
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                              ],
                            );
                          }),
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

// Sección de servicio en la pagina de detalles
class ServiciosSection extends StatelessWidget {
  // parametros para almacenar el sitio
  final SitioModel sitio;

  const ServiciosSection({
    super.key,
    required this.sitio,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(left: 60.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Titulo
              Text(
                texts.serviciosDetails.ofrece,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              // Sección donde se encuentra toda la funcionalidad para ver los servicios
              ServiciosDetails(
                sitio: sitio,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
            ]),
      ),
    );
  }
}
