// ignore_for_file: use_full_hex_values_for_flutter_colors, non_constant_identifier_names, use_build_context_synchronously, deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:proyecto_final/Env.dart';
import 'package:proyecto_final/HomePage/home_screens.dart';
import 'package:proyecto_final/generated/translations.g.dart';
import 'package:proyecto_final/models/ReservaModel.dart';
import 'package:proyecto_final/models/UsuariosModel.dart';
import 'package:proyecto_final/pdf/pdf_screen.dart';
import 'package:proyecto_final/responsive.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:http/http.dart' as http;
import 'package:proyecto_final/theme/theme_manager.dart';

// Tabla de las reservas pendientes

class ReservaPendienteT extends StatefulWidget {
  // parametro que recibe una lista de reservas
  final ThemeManager themeManager;
  final List<ReservaModel> reservas;

  const ReservaPendienteT({
    Key? key,
    required this.themeManager,
    required this.reservas,
  }) : super(key: key);

  @override
  State<ReservaPendienteT> createState() => _ReservaPendienteTState();
}

class _ReservaPendienteTState extends State<ReservaPendienteT> {
  @override
  void initState() {
    super.initState();
    for (var x = 0; x < widget.reservas.length; x++) {
      // Verifica si el estado de la reserva es "Pendiente"
      if (widget.reservas[x].estado == "Pendiente") {
        // Comprueba si han pasado al menos 2 días desde la fecha de la reserva
        if (DateTime.now()
                .difference(DateTime.parse(widget.reservas[x].fecha))
                .inDays >=
            2) {
          // Llama a la función para eliminar la reserva
          eliminarReserva(widget.reservas[x]);
        }
      }
    }
  }

  // Función para eliminar una reserva
  eliminarReserva(ReservaModel reserva) async {
    String url = "";

    url = "$djangoApi/api/Reservas/";

    // Realiza una solicitud HTTP DELETE para eliminar la reserva
    await http.delete(Uri.parse("$url${reserva.id}/"));
  }

  @override
  Widget build(BuildContext context) {
    // Verifica tema actual
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    // Lista para almacenar las reservas pendientes
    List<ReservaModel> reservaPendiente = [];

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
            texts.reservas_todo.reservas_pendientes.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          FutureBuilder(
              future: getReservas(), // llama todas las reservas
              builder: (context, AsyncSnapshot<List<ReservaModel>> reserva) {
                // Mientras carga la información
                if (reserva.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // Si la información es nula
                if (reserva.data != null) {
                  // Verifica las reservas pendientes
                  for (var r = 0; r < reserva.data!.length; r++) {
                    if (reserva.data![r].estado == "Pendiente") {
                      reservaPendiente.add(reserva.data![r]);
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
                            label: Text(texts.reserva.reserva_activa.date),
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
                          const DataColumn(
                            label: Text(""),
                          ),
                        ],
                        // Contenido de la tabla
                        rows: List.generate(
                          reservaPendiente.length,
                          (index) => ReservaAuDataRow(reservaPendiente[index],
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
}

DataRow ReservaAuDataRow(ReservaModel reservaPInfo, BuildContext context,
    ThemeManager themeManager) {
  // Verifica el tema actual
  bool isDark = Theme.of(context).brightness == Brightness.dark;

  // Método para activar una reserva
  activarReserva(ReservaModel reserva, ThemeManager themeManager) async {
    // URLs para las diferentes peticiones HTTP
    String url = "";

    String url2 = "";

    String url3 = "";

    url = "$djangoApi/api/Pagos/";

    url2 = "$djangoApi/api/PagoAnfitrion/";

    url3 = "$djangoApi/api/Reservas/";

    // Encabezados comunes para las solicitudes HTTP
    final Map<String, String> dataHeader = {
      'Content-Type': 'application/json; charset-UTF=8',
    };

    // Datos del cuerpo para la primera solicitud de pago
    final Map<String, dynamic> dataBody = {
      "fechaPago":
          "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}",
      "medioPago": "Transferencia",
      "estado": "Cancelado",
      "reserva": reserva.id,
    };

    // Encabezados comunes para las solicitudes HTTP
    final Map<String, String> dataHeader2 = {
      'Content-Type': 'application/json; charset-UTF=8',
    };

    // Datos del cuerpo para la segunda solicitud de pago al anfitrión
    final Map<String, dynamic> dataBody2 = {
      "fechaRadicado":
          "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}",
      "fechaPago": null,
      "medioPago": "Transferencia",
      "estado": "Pendiente",
      "reserva": reserva.id,
    };

    // Encabezados comunes para las solicitudes HTTP
    final Map<String, String> dataHeader3 = {
      'Content-Type': 'application/json; charset-UTF=8',
    };

    // Datos del cuerpo para actualizar la reserva
    final Map<String, dynamic> dataBody3 = {
      "usuario": reserva.usuario,
      "fecha": reserva.fecha,
      "fechaEntrada": reserva.fechaEntrada,
      "fechaSalida": reserva.fechaSalida,
      "numHuespedes": reserva.numHuespedes,
      "numAdultos": reserva.numAdultos,
      "numNinos": reserva.numNinos,
      "numBebes": reserva.numBebes,
      "numMascotas": reserva.numMascotas,
      "precioFinal": reserva.precioFinal,
      "estado": "Activo",
      "comision": reserva.comision,
      "gananciaAnfitrion": reserva.gananciaAnfitrion,
      "sitio": reserva.sitio.id,
    };

    // Realizar la primera solicitud de pago
    var respuesta = await http.post(
      Uri.parse(url),
      headers: dataHeader,
      body: json.encode(dataBody),
    );

    // Realizar la segunda solicitud de pago al anfitrión
    var respuesta2 = await http.post(
      Uri.parse(url2),
      headers: dataHeader2,
      body: json.encode(dataBody2),
    );

    // Actualizar la reserva
    var respuesta3 = await http.put(
      Uri.parse("$url3${reserva.id}/"),
      headers: dataHeader3,
      body: json.encode(dataBody3),
    );

    // Verificar si todas las solicitudes fueron exitosas
    if (respuesta.statusCode == 201 &&
        respuesta2.statusCode == 201 &&
        respuesta3.statusCode == 200) {
      // Navegar a la pantalla principal después de activar la reserva
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => HomeScreenPage(
            themeManager: themeManager,
          ),
        ),
      );
    }
  }

  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            SvgPicture.asset(
              "assets/icons/pendiente.svg",
              height: 30,
              width: 30,
              color: Colors.blue,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(reservaPInfo.sitio.titulo),
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
              if (reservaPInfo.usuario == usuario1.data![v].id) {
                nombreUsuario = usuario1.data![v].nombreCompleto;
              }
            }

            return Text(nombreUsuario);
          })),
      DataCell(Text(reservaPInfo.fecha)),
      DataCell(ElevatedButton(
        onPressed: () {
          // Ver detalles de la reserva
          _modalReserva(context, reservaPInfo);
        },
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(primaryColor)),
        child: Text(texts.reserva.see),
      )),
      DataCell(ElevatedButton(
        onPressed: () {
          // Función para activar la reserva
          activarReserva(reservaPInfo, themeManager);
        },
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(primaryColor)),
        child: Text(texts.reservas_todo.reservas_pendientes.activate),
      )),
      DataCell(ElevatedButton(
        onPressed: () {
          // modal para borrar manualmente la reserva
          _modalBorrarReserva(context, reservaPInfo, themeManager);
        },
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(primaryColor)),
        child: Text(texts.reservas_todo.reservas_pendientes.delete),
      )),
      DataCell(FutureBuilder(
          future: getUsuario(), // llama a todos los usuarios
          builder: (context, AsyncSnapshot<List<UsuariosModel>> usuario1) {
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
              if (reservaPInfo.usuario == usuario1.data![v].id) {
                nombreCompleto = usuario1.data![v].nombreCompleto;
                telefono = usuario1.data![v].telefono;
                tipodocumento = usuario1.data![v].tipoDocumento;
                numeroDocumento = usuario1.data![v].numeroDocumento;
                estado = reservaPInfo.estado;
                lugar = reservaPInfo.sitio.titulo;
              }
            }
            return IconButton(
                onPressed: () {
                  // Mensaje para el qr del pdf
                  String pedido = "";
                  pedido = "$pedido "
                      "${texts.reservas_todo.reservas_pendientes.summery.text1}"
                      " ${texts.reservas_todo.reservas_pendientes.summery.nameSite(name: reservaPInfo.sitio.titulo)}\n"
                      " ${texts.reservas_todo.reservas_pendientes.summery.location(name: reservaPInfo.sitio.lugar)} \n"
                      " ${texts.reservas_todo.reservas_pendientes.summery.checkInDate(name: reservaPInfo.fechaEntrada)} \n"
                      " ${texts.reservas_todo.reservas_pendientes.summery.checkOut(name: reservaPInfo.fechaSalida)} \n"
                      " ${texts.reservas_todo.reservas_pendientes.summery.total(name: reservaPInfo.numHuespedes)} \n"
                      " ${texts.reservas_todo.reservas_pendientes.summery.totalPrice(name: reservaPInfo.precioFinalFormatted)}";

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
          })),
    ],
  );
}

// modal para ver los detalles de la reserva
void _modalReserva(BuildContext context, ReservaModel reserva) {
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
                // detalles de la reserva
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
                                  style: Theme.of(context).textTheme.titleLarge,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                Text(
                                  reserva.sitio.titulo,
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
                                  style: Theme.of(context).textTheme.titleLarge,
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
                                        if (reserva.usuario ==
                                            usuario.data![v].id) {
                                          nombreUsuario =
                                              usuario.data![v].nombreCompleto;
                                        }
                                      }
                                      return Text(
                                        nombreUsuario,
                                        style:
                                            const TextStyle(color: Colors.grey),
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
                                  texts.reserva.reserva_activa.fechaReserva,
                                  style: Theme.of(context).textTheme.titleLarge,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                Text(
                                  reserva.fecha,
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
                                  texts.reserva.entryDate,
                                  style: Theme.of(context).textTheme.titleLarge,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                Text(
                                  reserva.fechaEntrada,
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
                                  style: Theme.of(context).textTheme.titleLarge,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                Text(
                                  reserva.fechaSalida,
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
                                  style: Theme.of(context).textTheme.titleLarge,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                Text(
                                  reserva.numHuespedes.toString(),
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
                                  texts.reserva.reserva_activa.numeroAdultos,
                                  style: Theme.of(context).textTheme.titleLarge,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                Text(
                                  reserva.numAdultos.toString(),
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
                                  texts.reserva.reserva_activa.numeroNinhos,
                                  style: Theme.of(context).textTheme.titleLarge,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                Text(
                                  reserva.numNinos.toString(),
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
                                  style: Theme.of(context).textTheme.titleLarge,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                Text(
                                  reserva.numBebes.toString(),
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
                                  style: Theme.of(context).textTheme.titleLarge,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                Text(
                                  reserva.numMascotas.toString(),
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
                                  style: Theme.of(context).textTheme.titleLarge,
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: defaultPadding,
                                ),
                                Text(
                                  "\$ ${reserva.precioFinalFormatted} COP",
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

// Modal para borrar la reserva
void _modalBorrarReserva(
    BuildContext context, ReservaModel reserva, ThemeManager themeManager) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            texts.reservas_todo.questions.one,
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
                      texts.reservas_todo.questions.comment,
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
                    child: Text(
                        texts.reservas_todo.actualizacionDevoluciones.cancel)),
                ElevatedButton(
                    onPressed: () async {
                      String url = "";

                      url = "$djangoApi/api/Reservas/";

                      // Realiza una solicitud HTTP DELETE para eliminar la reserva
                      final response =
                          await http.delete(Uri.parse("$url${reserva.id}/"));

                      // Verifica si la eliminación fue exitosa (código de estado 204)
                      if (response.statusCode == 204) {
                        // Navega a la pantalla de inicio después de eliminar la reserva
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => HomeScreenPage(
                              themeManager: themeManager,
                            ),
                          ),
                        );
                      }
                    },
                    child:
                        Text(texts.reservas_todo.reservas_pendientes.delete)),
              ],
            ),
          ],
        );
      });
}
