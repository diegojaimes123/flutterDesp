// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, avoid_print, use_build_context_synchronously

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:proyecto_final/Env.dart';
import 'package:proyecto_final/HomePage/home_screens.dart';
import 'package:proyecto_final/generated/translations.g.dart';
import 'package:proyecto_final/models/ComentarioModel.dart';
import 'package:proyecto_final/models/UsuariosModel.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:proyecto_final/theme/theme_manager.dart';
import 'package:translator/translator.dart';
import 'package:http/http.dart' as http;

// diseño de la Card animada donde va a estar la información de cada comentario

class ComentarioCardTodo extends StatefulWidget {
  // Parametro para recibir el comentario
  final ComentarioModel comentario;

  final ThemeManager themeManager;

  const ComentarioCardTodo(
      {super.key, required this.comentario, required this.themeManager});

  @override
  State<ComentarioCardTodo> createState() => _ComentarioCardTodoState();
}

class _ComentarioCardTodoState extends State<ComentarioCardTodo> {
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

  // Variables para la animación de la carta
  bool isBack = true;
  double angle = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Función para lograr el angulo para la animación de la carta
    void _flip() {
      setState(() {
        angle = (angle + pi) % (2 * pi);
      });
    }

    final texts = Translations.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        // Llamado a la función del angulo
        onTap: _flip,
        child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: angle),
            duration: const Duration(seconds: 1),
            builder: (BuildContext context, double val, __) {
              //Aquí cambiaremos el valor de isBack para poder modificar el contenido de la tarjeta.
              if (val >= (pi / 2)) {
                isBack = false;
              } else {
                isBack = true;
              }
              return (Transform(
                //Vamos a hacer que la tarjeta gire por su centro.
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(val),
                child: SizedBox(
                    width: 309,
                    height: 474,
                    child: isBack
                        ? Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/back.png"),
                              ),
                            ),
                          ) //Si está en la parte posterior, mostraremos aquí.
                        : Transform(
                            alignment: Alignment.center,
                            transform: Matrix4.identity()
                              ..rotateY(
                                  pi), // Volteará horizontalmente el contenedor.
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: const DecorationImage(
                                  image: AssetImage("assets/images/face.png"),
                                ),
                              ),
                              child: Center(
                                child: SizedBox(
                                  width: 190,
                                  height: 350,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      // Contenido de la carta
                                      children: [
                                        const SizedBox(height: defaultPadding),
                                        Center(
                                          child: FutureBuilder(
                                              future:
                                                  getUsuario(), // Llama a todos los usuarios
                                              builder: (context,
                                                  AsyncSnapshot<
                                                          List<UsuariosModel>>
                                                      usuario) {
                                                // Mientras se carga la información
                                                if (usuario.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return const Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  );
                                                }

                                                // Verifica el comentario correspondiente al usuario
                                                for (var u = 0;
                                                    u < usuario.data!.length;
                                                    u++) {
                                                  if (widget
                                                          .comentario.usuario ==
                                                      usuario.data![u].id) {
                                                    // Información del usuario
                                                    return Column(
                                                      children: [
                                                        ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            50)),
                                                            child:
                                                                Image.network(
                                                              usuario.data![u]
                                                                          .foto ==
                                                                      ""
                                                                  ? "assets/images/foto.png"
                                                                  : usuario
                                                                      .data![u]
                                                                      .foto,
                                                              width: 50,
                                                              height: 50,
                                                            )),
                                                        const SizedBox(
                                                          height:
                                                              defaultPadding,
                                                        ),
                                                        Text(
                                                          usuario.data![u]
                                                              .nombreCompleto,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .titleSmall!
                                                                  .copyWith(
                                                                    color:
                                                                        primaryColor,
                                                                  ),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ],
                                                    );
                                                  }
                                                }

                                                return Container();
                                              }),
                                        ),
                                        const SizedBox(height: defaultPadding),
                                        // Titulo del sitio
                                        Text(
                                          "${texts.comments.site}: ${widget.comentario.sitio.titulo}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(color: primaryColor),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: defaultPadding),
                                        Text(
                                          texts.comments.cleaning,
                                          style: const TextStyle(
                                              color: primaryColor),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: defaultPadding,
                                        ),
                                        // Inabilitar el selector de estrellas
                                        AbsorbPointer(
                                          absorbing: true,
                                          child: RatingBar.builder(
                                            itemSize: 20,
                                            initialRating:
                                                widget.comentario.calLimpieza,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: primaryColor,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: defaultPadding),
                                        FutureBuilder<String>(
                                          future: traduccionVariables(context,
                                              widget.comentario.desLimpieza),
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
                                                textAlign: TextAlign.center,
                                              );
                                            }
                                          },
                                        ),
                                        const SizedBox(height: defaultPadding),
                                        Text(
                                          texts.comments.communication,
                                          style: const TextStyle(
                                              color: primaryColor),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: defaultPadding,
                                        ),
                                        // Inabilitar el selector de estrellas
                                        AbsorbPointer(
                                          absorbing: true,
                                          child: RatingBar.builder(
                                            itemSize: 20,
                                            initialRating: widget
                                                .comentario.calComunicacion,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: primaryColor,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: defaultPadding),
                                        FutureBuilder<String>(
                                          future: traduccionVariables(
                                              context,
                                              widget
                                                  .comentario.desComunicacion),
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
                                                textAlign: TextAlign.center,
                                              );
                                            }
                                          },
                                        ),
                                        const SizedBox(height: defaultPadding),
                                        Text(
                                          texts.comments.arrival,
                                          style: const TextStyle(
                                              color: primaryColor),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: defaultPadding,
                                        ),
                                        // Inabilitar el selector de estrellas
                                        AbsorbPointer(
                                          absorbing: true,
                                          child: RatingBar.builder(
                                            itemSize: 20,
                                            initialRating:
                                                widget.comentario.calLlegada,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: primaryColor,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: defaultPadding),
                                        FutureBuilder<String>(
                                          future: traduccionVariables(context,
                                              widget.comentario.desLlegada),
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
                                                textAlign: TextAlign.center,
                                              );
                                            }
                                          },
                                        ),
                                        const SizedBox(height: defaultPadding),
                                        Text(
                                          texts.comments.reliability,
                                          style: const TextStyle(
                                              color: primaryColor),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: defaultPadding,
                                        ),
                                        // Inabilitar el selector de estrellas
                                        AbsorbPointer(
                                          absorbing: true,
                                          child: RatingBar.builder(
                                            itemSize: 20,
                                            initialRating:
                                                widget.comentario.calFiabilidad,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: primaryColor,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: defaultPadding),
                                        FutureBuilder<String>(
                                          future: traduccionVariables(context,
                                              widget.comentario.desFiabilidad),
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
                                                textAlign: TextAlign.center,
                                              );
                                            }
                                          },
                                        ),
                                        const SizedBox(height: defaultPadding),
                                        Text(
                                          texts.comments.location,
                                          style: const TextStyle(
                                              color: primaryColor),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: defaultPadding,
                                        ),
                                        // Inabilitar el selector de estrellas
                                        AbsorbPointer(
                                          absorbing: true,
                                          child: RatingBar.builder(
                                            itemSize: 20,
                                            initialRating:
                                                widget.comentario.calUbicacion,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: primaryColor,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: defaultPadding),
                                        FutureBuilder<String>(
                                          future: traduccionVariables(context,
                                              widget.comentario.desUbicacion),
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
                                                textAlign: TextAlign.center,
                                              );
                                            }
                                          },
                                        ),
                                        const SizedBox(height: defaultPadding),
                                        Text(
                                          texts.comments.price,
                                          style: const TextStyle(
                                              color: primaryColor),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: defaultPadding,
                                        ),
                                        // Inabilitar el selector de estrellas
                                        AbsorbPointer(
                                          absorbing: true,
                                          child: RatingBar.builder(
                                            itemSize: 20,
                                            initialRating:
                                                widget.comentario.calPrecio,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 4.0),
                                            itemBuilder: (context, _) =>
                                                const Icon(
                                              Icons.star,
                                              color: primaryColor,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                        ),
                                        const SizedBox(height: defaultPadding),
                                        FutureBuilder<String>(
                                          future: traduccionVariables(context,
                                              widget.comentario.desPrecio),
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
                                                textAlign: TextAlign.center,
                                              );
                                            }
                                          },
                                        ),
                                        const SizedBox(height: defaultPadding),
                                        Text(
                                          texts.comments.comment,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(color: primaryColor),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: defaultPadding),
                                        FutureBuilder<String>(
                                          future: traduccionVariables(context,
                                              widget.comentario.descripcion),
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
                                                textAlign: TextAlign.center,
                                              );
                                            }
                                          },
                                        ),
                                        const SizedBox(
                                          height: defaultPadding,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: primaryColor,
                                                    offset: Offset(
                                                      2.0,
                                                      2.0,
                                                    ),
                                                    blurRadius: 3.0,
                                                    spreadRadius: 1.0,
                                                  ), //BoxShadow
                                                  BoxShadow(
                                                    color: primaryColor,
                                                    offset: Offset(0.0, 0.0),
                                                    blurRadius: 0.0,
                                                    spreadRadius: 0.0,
                                                  ), //BoxShadow
                                                ],
                                                color: Colors.white,
                                              ),
                                              // Botón para eliminar el comentario
                                              child: IconButton(
                                                  onPressed: () {
                                                    // Función para mostrar la modal de eliminar el comentario
                                                    _modalEliminarComentario(
                                                        context,
                                                        widget.themeManager,
                                                        widget.comentario);
                                                  },
                                                  icon: const Icon(Icons.delete,
                                                      size: 25,
                                                      color: Colors.black)),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: defaultPadding,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ) // De lo contrario, lo mostraremos aquí.
                    ),
              ));
            }),
      ),
    );
  }

  // Modal para eliminar el comentario
  void _modalEliminarComentario(BuildContext context, ThemeManager themeManager,
      ComentarioModel comentario) {
    final texts = Translations.of(context);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              texts.comments.question.question1,
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
                        texts.comments.question.question2,
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
              // acciones del modal
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
                        // Construir la URL de la API según la plataforma
                        String url = "";

                        url = "$djangoApi/api/Comentarios/";

                        // Enviar una solicitud HTTP DELETE para eliminar el comentario
                        final response = await http
                            .delete(Uri.parse("$url${comentario.id}/"));

                        // Verificar si la eliminación fue exitosa (estado 204)
                        if (response.statusCode == 204) {
                          // Navegar a la pantalla principal después de eliminar el comentario
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
}
