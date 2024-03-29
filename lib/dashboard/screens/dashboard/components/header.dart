// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_final/controllers/MenuAppController.dart';
import 'package:proyecto_final/generated/translations.g.dart';
import 'package:proyecto_final/models/UsuariosModel.dart';
import 'package:proyecto_final/responsive.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:provider/provider.dart';

// Header el cual tendra el buscador y una card identificativa del usuario que este usando el aplicativo

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: context.read<MenuAppController>().controlMenu,
          ),
        // Titulo
        Text(
          "StayAway",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        // Carta de perfil
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
        const ProfileCard()
      ],
    );
  }
}

// Card donde estara el avatar y el nombre del usuario que este haciendo la sesión

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Verificación del tema actual
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: isDark ? secondaryColor : const Color(0xFFFF2F0F2),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      // Verifica si el usuario esta logueado
      child: FirebaseAuth.instance.currentUser == null
          ? Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 38,
                    height: 38,
                    color: primaryColor,
                    child: const Icon(
                      Icons.login,
                      color: Colors.white,
                    ),
                  ),
                ),
                if (!Responsive.isMobile(context))
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: defaultPadding / 2),
                    child: Text(texts.categories.login),
                  ),
              ],
            )
          : FutureBuilder(
              future: getUsuario(), // llama a todos los usuarios
              builder: (context,
                  AsyncSnapshot<List<UsuariosModel>> usuarioEncabezado) {
                // Mientras se carga la información
                if (usuarioEncabezado.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // verifica si los datos son nuloss
                if (usuarioEncabezado.data != null) {
                  return Row(
                    children: [
                      // Trae los datos del usuario logueado
                      for (int index = 0;
                          index < usuarioEncabezado.data!.length;
                          index++)
                        if (FirebaseAuth.instance.currentUser!.email ==
                            usuarioEncabezado.data![index].correoElectronico)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: usuarioEncabezado.data![index].foto == ""
                                ? const Image(
                                    image: AssetImage("assets/images/foto.png"),
                                    height: 38,
                                    fit: BoxFit.fill,
                                  )
                                : Image.network(
                                    usuarioEncabezado.data![index].foto,
                                    height: 38,
                                    fit: BoxFit.fill,
                                  ),
                          ),
                      // Trae los datos del usuario logueado
                      for (int index = 0;
                          index < usuarioEncabezado.data!.length;
                          index++)
                        if (FirebaseAuth.instance.currentUser!.email ==
                            usuarioEncabezado.data![index].correoElectronico)
                          // Validación del ancho de pantalla si es movil
                          if (!Responsive.isMobile(context))
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding / 2),
                              child: Text(usuarioEncabezado
                                  .data![index].nombreCompleto),
                            ),
                    ],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              }),
    );
  }
}
