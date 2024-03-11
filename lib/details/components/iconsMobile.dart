// ignore_for_file: file_names, avoid_print, no_leading_underscores_for_local_identifiers

import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/Env.dart';
import 'package:proyecto_final/LoginUsuario/Login/LoginAndRegister.dart';
import 'package:proyecto_final/generated/translations.g.dart';
import 'package:proyecto_final/models/FavoritoModel.dart';
import 'package:proyecto_final/models/SitioModel.dart';
import 'package:proyecto_final/models/UsuariosModel.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:proyecto_final/theme/theme_manager.dart';
import 'package:share_plus/share_plus.dart';
import 'package:universal_platform/universal_platform.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class IconsMobile extends StatefulWidget {
  // parametros para almacenar el sitio y la lista de usuarios
  final SitioModel sitio;

  final List<UsuariosModel> usuario;

  final ThemeManager themeManager;

  const IconsMobile({
    super.key,
    required this.sitio,
    required this.usuario,
    required this.themeManager,
  });

  @override
  State<IconsMobile> createState() => _IconsMobileState();
}

class _IconsMobileState extends State<IconsMobile> {
  // Variable para controlar si el sitio es favorito
  late bool isFavorite = false;

  // controlador de texto para el télefono
  TextEditingController telefono = TextEditingController();

  // Función para registrar un sitio como favorito
  registerFavorito(int sitio, int usuario) async {
    String url = "";

    url = "$djangoApi/api/Favoritos/";

    // Encabezados y cuerpo de la solicitud HTTP
    final Map<String, String> dataHeader = {
      'Content-Type': 'application/json; charset-UTF=8',
    };

    final Map<String, dynamic> dataBody = {
      "usuario": usuario,
      "sitio": sitio,
    };

    try {
      // Realiza una solicitud HTTP POST a la URL especificada con encabezados y cuerpo
      await http.post(
        Uri.parse(url),
        headers: dataHeader,
        body: json.encode(dataBody),
      );
    } catch (e) {
      // imprimir en caso que haya una excepción
      print(e);
    }
  }

  // Función para eliminar un sitio de la lista de favoritos
  deleteFavorito(int id) async {
    String url = "";

    url = "$djangoApi/api/Favoritos/";

    // Realiza una solicitud HTTP DELETE a la URL especificada
    await http.delete(Uri.parse("$url$id/"));
  }

  @override
  Widget build(BuildContext context) {
    late FavoritoModel favoritos; // Variable para almacenar los favoritos

    return FutureBuilder(
        future:
            getFavorito(), // Llamada a una función 'getFavorito()' que debería definirse
        builder: (context, AsyncSnapshot<List<FavoritoModel>> favorito) {
          // Mientras se carga la información, mostrar un indicador de carga
          if (favorito.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Bucle para verificar si el sitio es un favorito del usuario actual
          for (var uf = 0; uf < widget.usuario.length; uf++) {
            for (var f = 0; f < favorito.data!.length; f++) {
              if (FirebaseAuth.instance.currentUser!.email ==
                  widget.usuario[uf].correoElectronico) {
                if ((favorito.data![f].sitio == widget.sitio.id) &&
                    (favorito.data![f].usuario == widget.usuario[uf].id)) {
                  favoritos = favorito.data![f];
                  isFavorite = true; // Establecer como favorito si coincide
                }
              }
            }
          }

          return Container(
            padding: const EdgeInsets.only(left: 60, right: 60),
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      // Modal para compartir el sitio
                      if (UniversalPlatform.isAndroid ||
                          UniversalPlatform.isIOS) {
                        Share.share(
                            "${texts.complementos.summery.one(name: widget.sitio.titulo)}\n"
                            "${texts.complementos.summery.two(name: widget.sitio.lugar)} \n"
                            "${texts.complementos.summery.three(name: widget.sitio.numHuespedes)} "
                            "${texts.complementos.summery.four(name: widget.sitio.valorNocheFormatted)}");
                      } else {
                        _modalCompartir(context, widget.sitio, telefono);
                      }
                    },
                    icon: const Icon(
                      Icons.share_outlined,
                      color: primaryColor,
                    ),
                  ),
                  Text(texts.complementos.share),
                  const SizedBox(
                    width: defaultPadding,
                  ),
                  IconButton(
                    onPressed: () async {
                      // Verificación si el usuario se ha logueado
                      if (FirebaseAuth.instance.currentUser != null) {
                        // Verifica si el sitio ya esta seleccionado como favorito
                        // Si esta seleccionado al dar click se elimina
                        // Si no esta seleccionado dar click para agregar sitio favorito
                        if (isFavorite == true) {
                          deleteFavorito(favoritos.id);
                          setState(() {
                            isFavorite = false;
                          });
                        } else if (isFavorite == false) {
                          for (var us = 0; us < widget.usuario.length; us++) {
                            if (FirebaseAuth.instance.currentUser!.email ==
                                widget.usuario[us].correoElectronico) {
                              registerFavorito(
                                  widget.sitio.id, widget.usuario[us].id);
                              setState(() {
                                isFavorite = true;
                              });
                            }
                          }
                        }
                      } else {
                        _modalIniciarSesion(context, widget.themeManager);
                      }
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? primaryColor : primaryColor,
                    ),
                  ),
                  Text(texts.complementos.favorites),
                ],
              ),
            ),
          );
        });
  }

  // Modal para iniciar sesión
  void _modalIniciarSesion(BuildContext context, ThemeManager themeManager) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              texts.complementos.question.one,
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
                        texts.complementos.question.summery,
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
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  // acciones del modal
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(texts
                          .reservas_todo.actualizacionDevoluciones.cancel)),
                  // Botón para iniciar sesión
                  ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                LoginPage(themeManager: themeManager),
                          ),
                        );
                      },
                      child: Text(texts.categories.login)),
                ],
              ),
            ],
          );
        });
  }
}

// Modal para compartir la información del sitio a WhatsApp
void _modalCompartir(
    BuildContext context, SitioModel sitio, TextEditingController telefono) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            texts.complementos.question2.one,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: SizedBox(
            height: 200,
            width: 350,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Center(
                    child: Text(
                      texts.complementos.question2.summery,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  // Campo número de WhatsApp
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          controller: telefono,
                          obscureText: false,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            hintText: texts.complementos.telefono,
                            hintStyle: const TextStyle(color: Colors.black),
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                          keyboardType: TextInputType.text,
                          // Validación del campo
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return texts.complementos.required;
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                        texts.reservas_todo.actualizacionDevoluciones.cancel)),
                ElevatedButton(
                    onPressed: () async {
                      // Creación de variables para el mensaje de WhatsApp
                      String pedido = "";

                      pedido = "$pedido "
                          "${texts.complementos.summery.one(name: sitio.titulo)}"
                          " ${texts.complementos.summery.two(name: sitio.lugar)} \n"
                          "${texts.complementos.summery.three(name: sitio.numHuespedes)}"
                          " ${texts.complementos.summery.four(name: sitio.valorNocheFormatted)}";

                      // vincular whatsapp
                      String celular_2 = telefono.text;
                      String mensaje = pedido;
                      String url = "https://wa.me/$celular_2?text=$mensaje";
                      final Uri _url = Uri.parse(url);

                      await launchUrl(_url);
                      log(pedido);
                    },
                    child: Text(texts.complementos.send)),
              ],
            ),
          ],
        );
      });
}
