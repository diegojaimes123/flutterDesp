// ignore_for_file: file_names, use_full_hex_values_for_flutter_colors, non_constant_identifier_names, deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_final/generated/translations.g.dart';
import 'package:proyecto_final/models/PagoModel.dart';
import 'package:proyecto_final/models/UsuariosModel.dart';
import 'package:proyecto_final/pdf/pdf_screen.dart';
import 'package:proyecto_final/responsive.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:translator/translator.dart';

// Tabla de todos los pagos pendientes o realizados a nombre del anfitrión

class Pagos extends StatefulWidget {
  const Pagos({
    Key? key,
  }) : super(key: key);

  @override
  State<Pagos> createState() => _PagosState();
}

class _PagosState extends State<Pagos> {
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
    // Verifica el tema actual
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    // lista para almacenar los pagos de las reservas
    List<PagoModel> misPagos = [];

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
            texts.reservas_todo.misPagos.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          FutureBuilder(
              future: getUsuario(), // llama a todos los usuarios
              builder: (context, AsyncSnapshot<List<UsuariosModel>> usuario) {
                // Mientras carga la información
                if (usuario.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // Si la información es nula
                if (usuario.data != null) {
                  return FutureBuilder(
                      future: getPagos(), // llamar todos los pagos
                      builder: (context, AsyncSnapshot<List<PagoModel>> pago) {
                        // Mientras carga la información
                        if (pago.connectionState == ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        for (var u = 0; u < usuario.data!.length; u++) {
                          // Verifica el usuario logueado
                          if (FirebaseAuth.instance.currentUser!.email ==
                              usuario.data![u].correoElectronico) {
                            for (var p = 0; p < pago.data!.length; p++) {
                              // Verifica si el usuario ha hecho pagos
                              if (pago.data![p].reserva.usuario ==
                                  usuario.data![u].id) {
                                misPagos.add(pago.data![p]);
                              }
                            }
                          }
                        }

                        // Tabla
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
                                  label: Text(texts.reserva.site),
                                ),
                                DataColumn(
                                  label: Text(texts.reserva.user),
                                ),
                                DataColumn(
                                  label: Text(texts.reserva.payDay),
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
                                misPagos.length,
                                (index) =>
                                    MisPagosDataRow(misPagos[index], context),
                              ),
                            ),
                          ),
                        );
                      });
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ],
      ),
    );
  }

  DataRow MisPagosDataRow(PagoModel misPagosInfo, BuildContext context) {
    // Verifica el tema actual
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/pagos.svg",
                height: 30,
                width: 30,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Text(misPagosInfo.reserva.sitio.titulo),
              ),
            ],
          ),
        ),
        DataCell(FutureBuilder(
            future: getUsuario(), // llama a todos los usuarios
            builder: (context, AsyncSnapshot<List<UsuariosModel>> usuario1) {
              // Mientras carga la información
              if (usuario1.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              // Variable para almacenar el nombre del usuario
              String nombreUsuario = "";

              // trae la información del usuario si el id este coincide con el que esta registrado en la reserva
              for (var v = 0; v < usuario1.data!.length; v++) {
                if (misPagosInfo.reserva.usuario == usuario1.data![v].id) {
                  nombreUsuario = usuario1.data![v].nombreCompleto;
                }
              }

              return Text(nombreUsuario);
            })),
        DataCell(Text(misPagosInfo.fechaPago)),
        DataCell(ElevatedButton(
          onPressed: () {
            // Modal para ver el detalle del pago
            _modalPagos(context, misPagosInfo);
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(primaryColor)),
          child: Text(texts.reserva.see),
        )),
        DataCell(FutureBuilder<String>(
            future: traduccionVariables(context, misPagosInfo.medioPago),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return FutureBuilder(
                  future: getUsuario(), // llama a todos los usuarios
                  builder:
                      (context, AsyncSnapshot<List<UsuariosModel>> usuario1) {
                    // Mientras carga la información
                    if (usuario1.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    // Variables para almacenar la información del usuario
                    String nombreCompleto = "";
                    String telefono = "";
                    String tipodocumento = "";
                    String numeroDocumento = "";
                    String estado = "";
                    String lugar = "";

                    // Traer la información del usuario, cuando el id que esta registrado en la reserva coincide con el id de alguno de los usuarios registrados
                    for (var v = 0; v < usuario1.data!.length; v++) {
                      if (misPagosInfo.reserva.usuario ==
                          usuario1.data![v].id) {
                        nombreCompleto = usuario1.data![v].nombreCompleto;
                        telefono = usuario1.data![v].telefono;
                        tipodocumento = usuario1.data![v].tipoDocumento;
                        numeroDocumento = usuario1.data![v].numeroDocumento;
                        estado = misPagosInfo.estado;
                        lugar = misPagosInfo.reserva.sitio.titulo;
                      }
                    }
                    return IconButton(
                        onPressed: () {
                          // Mensaje para el qr del pdf
                          String pedido = "";
                          pedido = "$pedido "
                              "$pedido ${texts.reservas_todo.usuarioTotalPago.summery.text1}"
                              " \n ${texts.reservas_todo.usuarioTotalPago.summery.nameSite(name: misPagosInfo.reserva.sitio.titulo)}\n "
                              "${texts.reservas_todo.usuarioTotalPago.summery.location(name: misPagosInfo.reserva.sitio.lugar)} \n "
                              "${texts.reservas_todo.usuarioTotalPago.summery.checkInDate(name: misPagosInfo.reserva.fechaEntrada)} \n "
                              "${texts.reservas_todo.usuarioTotalPago.summery.checkOut(name: misPagosInfo.reserva.fechaSalida)} \n "
                              "${texts.reservas_todo.usuarioTotalPago.summery.paymentMethod(name: snapshot.data!)}\n "
                              "${texts.reservas_todo.usuarioTotalPago.summery.paymentDate(name: misPagosInfo.fechaPago)}\n "
                              "${texts.reservas_todo.usuarioTotalPago.summery.total(name: misPagosInfo.reserva.numHuespedes)} "
                              "${texts.reservas_todo.usuarioTotalPago.summery.totalPrice(name: misPagosInfo.reserva.precioFinal)}";
                          // Navegación que dirige al archivo pdf
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PdfPageScreen(
                                    reserva: pedido,
                                    nombreCompleto: nombreCompleto,
                                    telefono: telefono,
                                    tipodocumento: tipodocumento,
                                    numeroDocumento: numeroDocumento,
                                    estado: estado,
                                    lugar: lugar,
                                  )));
                        },
                        icon: SvgPicture.asset(
                          "assets/icons/pdf.svg",
                          color: isDark ? Colors.white : primaryColor,
                          width: 20,
                          height: 20,
                        ));
                  });
            })),
      ],
    );
  }

// Modal par ver el detalle del pago
  void _modalPagos(BuildContext context, PagoModel pago) {
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
                  // detalles del pago
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 30, left: 30),
                      child: SizedBox(
                        height: 495,
                        width: MediaQuery.of(context).size.width,
                        child: GridView.count(
                          // Dependiendo el ancho de la pantalla se definen el número de columnas
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
                                    texts.reserva.site,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    pago.reserva.sitio.titulo,
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
                                    texts.reserva.fullname,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  FutureBuilder(
                                      future:
                                          getUsuario(), // llama a todos los usuario
                                      builder: (context,
                                          AsyncSnapshot<List<UsuariosModel>>
                                              usuario) {
                                        // Mientras carga la información
                                        if (usuario.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }

                                        // Variable para almacenar el nombre del usuario
                                        String nombreUsuario = "";

                                        // trae la información del usuario si el id este coincide con el que esta registrado en la reserva
                                        for (var v = 0;
                                            v < usuario.data!.length;
                                            v++) {
                                          if (pago.reserva.usuario ==
                                              usuario.data![v].id) {
                                            nombreUsuario =
                                                usuario.data![v].nombreCompleto;
                                          }
                                        }
                                        return Text(
                                          nombreUsuario,
                                          style: const TextStyle(
                                              color: Colors.grey),
                                          textAlign: TextAlign.center,
                                        );
                                      }),
                                ],
                              ),
                            ),
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    texts.reserva.paymentDate,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    pago.fechaPago,
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
                                    texts.reserva.paymentMethod,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  FutureBuilder<String>(
                                    future: traduccionVariables(
                                        context, pago.medioPago),
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
                                    texts.reserva.paymentStatus,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  FutureBuilder<String>(
                                    future: traduccionVariables(
                                        context, pago.estado),
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
                                    texts.reserva.entryDate,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    pago.reserva.fechaEntrada,
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
                                    texts.reserva.departureeDate,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    pago.reserva.fechaSalida,
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
                                    texts.reserva.NumberOfGuests,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    pago.reserva.numHuespedes.toString(),
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
                                    texts.reserva.NumberOfBabys,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    pago.reserva.numBebes.toString(),
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
                                    texts.reserva.NumberOfPets,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    pago.reserva.numMascotas.toString(),
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
                                    texts.reserva.ReserveValue,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    "\$ ${valorFormatted(pago.reserva.precioFinal)} COP",
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

// Funciones para formatear valores monetarios en formato de moneda colombiana (COP)
String valorFormatted(int valor) {
  return NumberFormat.currency(
    symbol:
        '', // Símbolo de la moneda (en este caso, vacío para tener solo el número)
    locale:
        'es_CO', // Establecer el idioma y el país para el formato de moneda colombiana
    decimalDigits:
        0, // Establecer la cantidad de dígitos decimales (0 para redondear al número entero más cercano)
  ).format(valor); // Aplicar el formato a la variable valor
}
