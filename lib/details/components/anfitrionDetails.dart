// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:proyecto_final/generated/translations.g.dart';
import 'package:proyecto_final/models/HabitacionModel.dart';
import 'package:proyecto_final/models/SitioModel.dart';
import 'package:proyecto_final/models/UsuariosModel.dart';
import 'package:proyecto_final/responsive.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:translator/translator.dart';

class AnfitrionDetails extends StatefulWidget {
  // Parametro para recibir el sitio
  final SitioModel sitio;

  const AnfitrionDetails({
    super.key,
    required this.sitio,
  });

  @override
  State<AnfitrionDetails> createState() => _AnfitrionDetailsState();
}

class _AnfitrionDetailsState extends State<AnfitrionDetails> {
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
    // Verifica el tema actual en el aplicativo
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    // lista para almacenar la cantidad de habitaciones correspondientes al sitio
    List<int> listaHabitacion = [];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titulo del sitio y lugar
          Text(
            "${widget.sitio.titulo}, ${widget.sitio.lugar}",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          FutureBuilder(
              future: getHabitacion(), // traer las habitaciones del servidor
              builder:
                  (context, AsyncSnapshot<List<HabitacionModel>> habitacion) {
                // Mientras carga la información
                if (habitacion.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // Verifica las habitaciones correspondientes al sitio y almacena en la lista la cantidad de habitaciones
                for (var h = 0; h < habitacion.data!.length; h++) {
                  if (widget.sitio.id == habitacion.data![h].sitio) {
                    listaHabitacion.add(habitacion.data![h].id);
                  }
                }

                // Cantidad de huespedes, habitaciones, camas y baños que tiene el sitio
                return Row(
                  children: [
                    Text(texts.cosas_faltantes.details
                        .guests(name: widget.sitio.numHuespedes)),
                    const Text(" - "),
                    Text(texts.cosas_faltantes.details
                        .rooms(name: listaHabitacion.length)),
                    const Text(" - "),
                    Text(texts.cosas_faltantes.details
                        .beds(name: widget.sitio.numCamas)),
                    const Text(" - "),
                    Text(texts.cosas_faltantes.details
                        .Bathrooms(name: widget.sitio.numBanos)),
                  ],
                );
              }),
          const SizedBox(
            height: defaultPadding,
          ),
          FutureBuilder(
              future: getUsuario(), // traer a los usuarios desde el servidor
              builder: (context, AsyncSnapshot<List<UsuariosModel>> usuario) {
                // Mientras se carga la información
                if (usuario.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // Verifica si la información es nula
                if (usuario.data != null) {
                  // trae la información del anfitrión del sitio
                  for (var k = 0; k < usuario.data!.length; k++) {
                    if (widget.sitio.usuario == usuario.data![k].id) {
                      return Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: usuario.data![k].foto == ""
                                ? const Image(
                                    image: AssetImage("assets/images/foto.png"),
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.fill,
                                  )
                                : Image.network(
                                    usuario.data![k].foto,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                          const SizedBox(
                            width: defaultPadding,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                usuario.data![k].nombreCompleto,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                texts.cosas_faltantes.details.text(
                                    fecha: usuario.data![k].fechaRegistro),
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      );
                    }
                  }
                } else {
                  return Container();
                }

                return Container();
              }),
          const SizedBox(
            height: defaultPadding,
          ),
          FutureBuilder(
              future: getUsuario(), // trae todos los usuarios desde el servidor
              builder: (context, AsyncSnapshot<List<UsuariosModel>> usuario) {
                // mientras se carga la información
                if (usuario.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // Verifica si la información es nula
                if (usuario.data != null) {
                  // trae la información del anfitrión del sitio
                  for (var k = 0; k < usuario.data!.length; k++) {
                    if (widget.sitio.usuario == usuario.data![k].id) {
                      // Botón para ver la modal con la información completa del anfitrión
                      return ElevatedButton(
                        onPressed: () {
                          _modalAnfitrion(context, usuario.data![k]);
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
                        child: Text(texts.cosas_faltantes.details.info),
                      );
                    }
                  }
                }

                return Container();
              }),
          const SizedBox(
            height: defaultPadding,
          ),
        ],
      ),
    );
  }

  // Modal para ver la información del anfitrión
  void _modalAnfitrion(BuildContext context, UsuariosModel usuario) {
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
                  // Titulo del modal
                  Text(
                    texts.cosas_faltantes.details.info2,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  // Información del anfitrión
                  Expanded(
                    child: SizedBox(
                      height: 495,
                      width: MediaQuery.of(context).size.width,
                      child: SingleChildScrollView(
                          child: Column(
                        // Dependiendo el ancho de la pantalla se modifica la imagen y los datos del anfitrión
                        // En movil estan en tipo columna y en los demas dispositivos hay rows los cuales haran espaciado para aprovechar la medida del modal
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    Responsive.isMobile(context)
                                        ? 50.0
                                        : 100.0),
                                child: usuario.foto == ""
                                    ? Image(
                                        image: const AssetImage(
                                            "assets/images/foto.png"),
                                        width: Responsive.isMobile(context)
                                            ? 100
                                            : 200,
                                        height: Responsive.isMobile(context)
                                            ? 100
                                            : 200,
                                        fit: BoxFit.fill,
                                      )
                                    : Image.network(
                                        usuario.foto,
                                        width: Responsive.isMobile(context)
                                            ? 100
                                            : 200,
                                        height: Responsive.isMobile(context)
                                            ? 100
                                            : 200,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                              const SizedBox(
                                width: defaultPadding,
                              ),
                              // Verificación tipo tablet o escritorio
                              if (Responsive.isDesktop(context) ||
                                  Responsive.isTablet(context))
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 350,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              texts.cosas_faltantes.details
                                                  .anfi(
                                                      name: usuario
                                                          .nombreCompleto),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(fontSize: 30),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      texts.cosas_faltantes.details
                                          .text(fecha: usuario.fechaRegistro),
                                      style: const TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                          const SizedBox(
                            height: defaultPadding,
                          ),
                          // Verificación tipo movil
                          if (Responsive.isMobile(context))
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  texts.cosas_faltantes.details
                                      .anfi(name: usuario.nombreCompleto),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  texts.cosas_faltantes.details
                                      .text(fecha: usuario.fechaRegistro),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          const SizedBox(
                            height: defaultPadding,
                          ),
                          FutureBuilder<String>(
                            future: traduccionVariables(
                                context, usuario.descripcion),
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
                          const SizedBox(
                            height: defaultPadding,
                          ),
                          const Divider(
                            height: 1,
                          ),
                          const SizedBox(
                            height: defaultPadding,
                          ),
                          Text(texts.cosas_faltantes.details.contact,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 30)),
                          const SizedBox(
                            height: defaultPadding,
                          ),
                          // Verificación tipo tablet o escritorio
                          if (Responsive.isDesktop(context) ||
                              Responsive.isTablet(context))
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  texts.cosas_faltantes.details.tel,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  usuario.telefono.toString(),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          // Verificación tipo movil
                          if (Responsive.isMobile(context))
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  texts.cosas_faltantes.details.tel,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  usuario.telefono.toString(),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          const SizedBox(
                            height: defaultPadding,
                          ),
                          // Verificación tipo tablet o escritorio
                          if (Responsive.isDesktop(context) ||
                              Responsive.isTablet(context))
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  texts.pruebaEdit.telefono_celular,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  usuario.telefonoCelular.toString(),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          // Verificación tipo movil
                          if (Responsive.isMobile(context))
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  texts.pruebaEdit.telefono_celular,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  usuario.telefonoCelular.toString(),
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          const SizedBox(
                            height: defaultPadding,
                          ),
                          // Verificación tipo tablet o escritorio
                          if (Responsive.isDesktop(context) ||
                              Responsive.isTablet(context))
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  texts.cosas_faltantes.mail,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  usuario.correoElectronico,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          // Verificación tipo movil
                          if (Responsive.isMobile(context))
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  texts.cosas_faltantes.mail,
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                Text(
                                  usuario.correoElectronico,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                        ],
                      )),
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
