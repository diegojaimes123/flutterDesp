// ignore_for_file: file_names, use_full_hex_values_for_flutter_colors, non_constant_identifier_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_final/dashboard/screens/dashboard/components/reserva_todo/actualiarPagosAnfi.dart';
import 'package:proyecto_final/generated/translations.g.dart';
import 'package:proyecto_final/models/PagoAnfitrionModel.dart';
import 'package:proyecto_final/models/UsuariosModel.dart';
import 'package:proyecto_final/pdf/pdf_screen.dart';
import 'package:proyecto_final/responsive.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:proyecto_final/theme/theme_manager.dart';
import 'package:translator/translator.dart';

// Tabla de los pagos pendientes o realizados a los anfitriones

class PagosTotalAnf extends StatefulWidget {
  final ThemeManager themeManager;
  const PagosTotalAnf({
    Key? key,
    required this.themeManager,
  }) : super(key: key);

  @override
  State<PagosTotalAnf> createState() => _PagosTotalAnfState();
}

class _PagosTotalAnfState extends State<PagosTotalAnf> {
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
            texts.reservas_todo.pagosTotalAnf.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          FutureBuilder(
              future:
                  getPagosAnfitrion(), // llamar todos los pagos del anfitrión
              builder:
                  (context, AsyncSnapshot<List<PagoAnfitrionModel>> pagoAnfi) {
                // Mientras carga la información
                if (pagoAnfi.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // Si la información es nula
                if (pagoAnfi.data != null) {
                  // Tabla
                  return SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: InteractiveViewer(
                      constrained: false,
                      scaleEnabled: false,
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
                          DataColumn(
                            label: Text(texts.reserva.State),
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
                          pagoAnfi.data!.length,
                          (index) => PagosDataRow(pagoAnfi.data![index],
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

  DataRow PagosDataRow(PagoAnfitrionModel PagosInfo, BuildContext context,
      ThemeManager themeManager) {
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
                child: Text(PagosInfo.reserva.sitio.titulo),
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
                if (PagosInfo.reserva.usuario == usuario1.data![v].id) {
                  nombreUsuario = usuario1.data![v].nombreCompleto;
                }
              }

              return Text(nombreUsuario);
            })),
        DataCell(Text(PagosInfo.fechaPago)),
        DataCell(
          FutureBuilder<String>(
            future: traduccionVariables(context, PagosInfo.estado),
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
            // Modal para ver el detalle del pago
            _modalPagosRecibidos(context, PagosInfo);
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(primaryColor)),
          child: Text(texts.reserva.see),
        )),
        DataCell(ElevatedButton(
          onPressed: () {
            // Modal para actualizar el estado del pago
            _modalActualizarPagosAnf(context, PagosInfo, themeManager);
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(primaryColor)),
          child: Text(texts.reservas_todo.totalDevoluciones.upload_status),
        )),
        DataCell(FutureBuilder<String>(
            future: traduccionVariables(context, PagosInfo.medioPago),
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

                    // Traer la información del usuario, cuando el id que esta registrado en el sitio coincide con el id de alguno de los usuarios registrados
                    for (var v = 0; v < usuario1.data!.length; v++) {
                      if (PagosInfo.reserva.sitio.usuario ==
                          usuario1.data![v].id) {
                        nombreCompleto = usuario1.data![v].nombreCompleto;
                        telefono = usuario1.data![v].telefono;
                        tipodocumento = usuario1.data![v].tipoDocumento;
                        numeroDocumento = usuario1.data![v].numeroDocumento;
                        estado = PagosInfo.estado;
                        lugar = PagosInfo.reserva.sitio.titulo;
                      }
                    }
                    return IconButton(
                        onPressed: () {
                          // Mensaje para el qr del pdf
                          String pedido = "";
                          pedido = "$pedido ${texts.reserva.summery.text1}"
                              " \n ${texts.reserva.summery.nameSite(name: PagosInfo.reserva.sitio.titulo)}\n "
                              "${texts.reserva.summery.location(name: PagosInfo.reserva.sitio.lugar)} \n "
                              "${texts.reserva.summery.checkInDate(name: PagosInfo.reserva.fechaEntrada)} \n "
                              "${texts.reserva.summery.checkOut(name: PagosInfo.reserva.fechaSalida)} \n "
                              "${texts.reserva.summery.paymentMethod(name: snapshot.data!)}\n "
                              "${texts.reserva.summery.paymentDate(name: PagosInfo.fechaPago)}\n "
                              "${texts.reserva.summery.total(name: PagosInfo.reserva.numHuespedes)} "
                              "${texts.reserva.summery.totalPrice(name: PagosInfo.reserva.precioFinal)}";
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
  void _modalPagosRecibidos(BuildContext context, PagoAnfitrionModel pago) {
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
                                    texts.reserva.payDay,
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
                                    texts.reserva.dateOfFiling,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    pago.fechaRadicado,
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
                            SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    texts.reserva.ValueGain,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    height: defaultPadding,
                                  ),
                                  Text(
                                    "\$ ${valorFormatted(pago.reserva.gananciaAnfitrion)} COP",
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

// Modal para actualizar el estado del pago
void _modalActualizarPagosAnf(
    BuildContext context, PagoAnfitrionModel pago, ThemeManager themeManager) {
  showDialog(
      context: context,
      builder: (context) {
        return ActualizarPagosAnfitrion(
            PagosInfo: pago, themeManager: themeManager);
      });
}
