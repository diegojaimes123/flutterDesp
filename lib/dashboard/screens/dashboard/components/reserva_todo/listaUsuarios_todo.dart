// ignore_for_file: file_names, use_full_hex_values_for_flutter_colors, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:proyecto_final/Env.dart';
import 'package:proyecto_final/HomePage/home_screens.dart';
import 'package:proyecto_final/dashboard/screens/dashboard/components/reserva_todo/RolUsuario.dart';
import 'package:proyecto_final/generated/translations.g.dart';
import 'package:proyecto_final/models/UsuariosModel.dart';
import 'package:proyecto_final/responsive.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:proyecto_final/theme/theme_manager.dart';
import 'package:translator/translator.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart' as firabase_storage;

// Tabla de todos los usuarios del aplicativo

class ListaUsuario extends StatefulWidget {
  final ThemeManager themeManager;

  const ListaUsuario({
    Key? key,
    required this.themeManager,
  }) : super(key: key);

  @override
  State<ListaUsuario> createState() => _ListaUsuarioState();
}

class _ListaUsuarioState extends State<ListaUsuario> {
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
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: isDark ? secondaryColor : const Color(0xFFFF2F0F2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            texts.cosas_faltantes.all,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          FutureBuilder(
              future: getUsuario(), // Llamar a todos los usuarios
              builder: (context, AsyncSnapshot<List<UsuariosModel>> usuarios) {
                // Mientras se carga la información
                if (usuarios.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // Si la información es nula
                if (usuarios.data != null) {
                  return SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: InteractiveViewer(
                      scaleEnabled: false,
                      constrained: false,
                      child: DataTable(
                        columnSpacing: defaultPadding,
                        // minWidth: 600,
                        columns: [
                          DataColumn(
                            label: Text(texts.cosas_faltantes.name),
                          ),
                          DataColumn(
                            label: Text(texts.cosas_faltantes.mail),
                          ),
                          DataColumn(
                            label: Text(texts.cosas_faltantes.rol),
                          ),
                          const DataColumn(
                            label: Text(""),
                          ),
                          const DataColumn(
                            label: Text(""),
                          ),
                          const DataColumn(
                            label: Text(""),
                          ),
                        ],
                        // Contenido de la tabla
                        rows: List.generate(
                          usuarios.data!.length,
                          (index) => UsuariosDataRow(usuarios.data![index],
                              context, widget.themeManager),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ],
      ),
    );
  }

  DataRow UsuariosDataRow(UsuariosModel usuariosInfo, BuildContext context,
      ThemeManager themeManager) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: usuariosInfo.foto == ""
                    ? const Image(
                        image: AssetImage("assets/images/foto.png"),
                        height: 30,
                        width: 30,
                        fit: BoxFit.fill,
                      )
                    : Image.network(
                        usuariosInfo.foto,
                        height: 30,
                        width: 30,
                        fit: BoxFit.fill,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(usuariosInfo.nombreCompleto),
              ),
            ],
          ),
        ),
        DataCell(Text(usuariosInfo.correoElectronico)),
        usuariosInfo.rolAdmin
            ? DataCell(
                FutureBuilder<String>(
                  future: traduccionVariables(context, "Administrador"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text(
                        snapshot.data!,
                      );
                    }
                  },
                ),
              )
            : DataCell(
                FutureBuilder<String>(
                  future: traduccionVariables(context, "Usuario"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Text(
                        snapshot.data!,
                      );
                    }
                  },
                ),
              ),
        DataCell(ElevatedButton(
          onPressed: () {
            // Modal para ver la información del usuario
            _modalUsuario(context, usuariosInfo);
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(primaryColor)),
          child: Text(texts.reserva.see),
        )),
        DataCell(ElevatedButton(
          onPressed: () {
            // Modal para cambiar el rol del usuario
            _modalRolUsuario(context, usuariosInfo, themeManager);
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(primaryColor)),
          child: Text(texts.cosas_faltantes.update),
        )),
        DataCell(ElevatedButton(
          onPressed: () {
            // Modal para borrar el usuario
            _modalBorrarUsuario(context, usuariosInfo, themeManager);
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(primaryColor)),
          child: Text(texts.categories.delete),
        )),
      ],
    );
  }

// Modal para ver la información del usuario
  void _modalUsuario(BuildContext context, UsuariosModel usuario) {
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
                  const Image(
                    image: AssetImage(
                      "assets/images/logo.png",
                    ),
                    width: 100,
                    height: 100,
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  // Información del usuario
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      child: SizedBox(
                        height: 495,
                        width: MediaQuery.of(context).size.width,
                        child: GridView.count(
                          crossAxisCount: Responsive.isMobile(context) ? 1 : 3,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    texts.reserva.fullname,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    usuario.nombreCompleto,
                                    style: const TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    texts.pruebaEdit.tipo_de_documento,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    usuario.tipoDocumento,
                                    style: const TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    texts.pruebaEdit.numero_de_documento,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    usuario.numeroDocumento,
                                    style: const TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    texts.cosas_faltantes.mail,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    usuario.correoElectronico,
                                    style: const TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    texts.register.tel,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    usuario.telefono,
                                    style: const TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    texts.pruebaEdit.telefono_celular,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    usuario.telefonoCelular,
                                    style: const TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    texts.pruebaEdit.idioma,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  FutureBuilder<String>(
                                    future: traduccionVariables(
                                        context, usuario.idioma),
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
                                              color: Colors.grey),
                                          textAlign: TextAlign.center,
                                        );
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rol",
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  if (usuario.rolAdmin == true)
                                    FutureBuilder<String>(
                                      future: traduccionVariables(
                                          context, "Administrador"),
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
                                    )
                                  else
                                    FutureBuilder<String>(
                                      future: traduccionVariables(
                                          context, "Usuario"),
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
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    texts.pruebaEdit.bank,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    usuario.banco,
                                    style: const TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    texts.cosas_faltantes.number,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    usuario.numeroCuenta,
                                    style: const TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    texts.pruebaEdit.numero_de_daviplata,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    usuario.daviplata,
                                    style: const TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    texts.cosas_faltantes.date,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    usuario.fechaRegistro,
                                    style: const TextStyle(color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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

// Modal para borrar el usuario
void _modalBorrarUsuario(
    BuildContext context, UsuariosModel usuario, ThemeManager themeManager) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            texts.cosas_faltantes.questions.one,
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
                      texts.cosas_faltantes.questions.summery,
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
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(texts.categories.cancel)),
                ElevatedButton(
                    onPressed: () async {
                      // Convierte la URL en una referencia de almacenamiento
                      firabase_storage.Reference storageReference =
                          firabase_storage.FirebaseStorage.instance
                              .refFromURL(usuario.foto);

                      // Borra el archivo
                      await storageReference.delete();

                      // Eliminar un usuario mediante una solicitud HTTP DELETE
                      String url = "";

                      url = "$djangoApi/api/Usuarios/";

                      // Realizar la solicitud HTTP DELETE para eliminar el usuario
                      final response =
                          await http.delete(Uri.parse("$url${usuario.id}/"));

                      // Verificar si la eliminación fue exitosa (código de respuesta 204)
                      if (response.statusCode == 204) {
                        // Navegar a la pantalla principal después de eliminar el usuario
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

// Modal para cambiar el rol del usuario
void _modalRolUsuario(
    BuildContext context, UsuariosModel usuario, ThemeManager themeManager) {
  showDialog(
      context: context,
      builder: (context) {
        return RolUsuario(
          usuario: usuario,
          themeManager: themeManager,
        );
      });
}
