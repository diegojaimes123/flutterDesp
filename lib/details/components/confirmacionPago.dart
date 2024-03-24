// ignore_for_file: file_names, no_logic_in_create_state, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:proyecto_final/HomePage/home_screens.dart';
import 'package:proyecto_final/generated/translations.g.dart';
import 'package:proyecto_final/models/SitioModel.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:proyecto_final/theme/theme_manager.dart';
import 'package:qr_flutter/qr_flutter.dart';

// ignore: must_be_immutable
class ConfirmacionPago extends StatefulWidget {
  // Parametros para recibir los datos de la reserva
  SitioModel sitioModel;
  String fechaEntrada;
  String fechaSalida;
  String totalHuespedes;
  int valorDias;
  int valorTotal;
  int totalNoches;
  final ThemeManager themeManager;
  ConfirmacionPago(
      {super.key,
      required this.sitioModel,
      required this.fechaEntrada,
      required this.fechaSalida,
      required this.totalHuespedes,
      required this.totalNoches,
      required this.valorDias,
      required this.valorTotal,
      required this.themeManager});

  @override
  State<ConfirmacionPago> createState() => _ConfirmacionPagoState(
      sitioModel: sitioModel,
      fechaEntrada: fechaEntrada,
      fechaSalida: fechaSalida,
      totalHuespedes: totalHuespedes,
      totalNoches: totalNoches,
      valorDias: valorDias,
      valorTotal: valorTotal);
}

class _ConfirmacionPagoState extends State<ConfirmacionPago> {
  // Parametros para recibir los datos de la reserva
  SitioModel sitioModel;
  String fechaEntrada;
  String fechaSalida;
  String totalHuespedes;
  int valorDias;
  int valorTotal;
  int totalNoches;
  _ConfirmacionPagoState(
      {required this.sitioModel,
      required this.fechaEntrada,
      required this.fechaSalida,
      required this.totalHuespedes,
      required this.totalNoches,
      required this.valorDias,
      required this.valorTotal});

  @override
  Widget build(BuildContext context) {
    // Verificar el tema actual
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: isDark ? bgColor : Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          texts.reservas_todo.confirmacionPago2.title,
          style: TextStyle(color: isDark ? primaryColor : Colors.black),
        ),
      ),
      body: LayoutBuilder(builder: (context, responsive) {
        // Valida si el ancho de la pantalla es menor o igual a 900
        if (responsive.maxWidth <= 900) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              // Información de la reserva
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      texts.reservas_todo.confirmacionPago2.summery1,
                      style: TextStyle(
                          fontSize: 25,
                          color: isDark ? primaryColor : Colors.black),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                texts.reservas_todo.confirmacionPago2.siteName,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        isDark ? primaryColor : Colors.black),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                widget.sitioModel.titulo,
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                texts.reservas_todo.confirmacionPago2.location,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        isDark ? primaryColor : Colors.black),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                widget.sitioModel.lugar,
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                texts.reserva.reserva_activa.fechallegada,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        isDark ? primaryColor : Colors.black),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                fechaEntrada,
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                texts.reserva.departureeDate,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color:
                                        isDark ? primaryColor : Colors.black),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                fechaSalida,
                                style: const TextStyle(
                                    fontSize: 17, color: Colors.grey),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    texts.reserva.NumberOfGuests,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDark ? primaryColor : Colors.black),
                  ),
                  Text(
                    texts.reservas_todo.confirmacionPago2
                        .guest(name: totalHuespedes),
                    style: const TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                  const SizedBox(height: 30),
                  const Divider(
                    color: Color(0xFFAD974F),
                  ),
                  Text(
                    texts.reservas_todo.confirmacionPago2.totalCost,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDark ? primaryColor : Colors.black),
                  ),
                  Text(
                    'COP ${valorFormatted(valorTotal)}',
                    style: const TextStyle(color: Colors.grey, fontSize: 17),
                  ),
                  const SizedBox(height: 50),
                  // Codigo qr el cual se puede prestar para integrar un qr completo Bancolombia o Davivienda
                  Center(
                    child: QrImageView(
                      data: 'https://www.davivienda.com/',
                      version: QrVersions.auto,
                      size: 350.0,
                      foregroundColor: isDark ? primaryColor : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      texts.reservas_todo.confirmacionPago2.summery2,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 30)
                ],
              ),
            ),
          );
          // Vista por defecto
        } else {
          return Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SingleChildScrollView(
                    // Información de la reserva
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Text(
                            texts.reservas_todo.confirmacionPago2.summery1,
                            style: TextStyle(
                                fontSize: 25,
                                color: isDark ? primaryColor : Colors.black),
                          ),
                        ),
                        const SizedBox(height: 50),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      texts.reservas_todo.confirmacionPago2
                                          .siteName,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: isDark
                                              ? primaryColor
                                              : Colors.black),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      widget.sitioModel.titulo,
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      texts.reservas_todo.confirmacionPago2
                                          .location,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: isDark
                                              ? primaryColor
                                              : Colors.black),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      widget.sitioModel.lugar,
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      texts.reserva.reserva_activa.fechallegada,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: isDark
                                              ? primaryColor
                                              : Colors.black),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      fechaEntrada,
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      texts.reserva.departureeDate,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: isDark
                                              ? primaryColor
                                              : Colors.black),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      fechaSalida,
                                      style: const TextStyle(
                                          fontSize: 17, color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Text(
                          texts.reserva.NumberOfGuests,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isDark ? primaryColor : Colors.black),
                        ),
                        Text(
                          texts.reservas_todo.confirmacionPago2
                              .guest(name: totalHuespedes),
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                        const SizedBox(height: 30),
                        const Divider(
                          color: Color(0xFFAD974F),
                        ),
                        Text(
                          texts.reservas_todo.confirmacionPago2.totalCost,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: isDark ? primaryColor : Colors.black),
                        ),
                        Text(
                          'COP ${valorFormatted(valorTotal)}',
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 17),
                        ),
                        const SizedBox(height: 30)
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Codigo qr el cual se puede prestar para integrar un qr completo Bancolombia o Davivienda
                    Center(
                      child: QrImageView(
                        data: 'https://www.davivienda.com/',
                        version: QrVersions.auto,
                        size: 350.0,
                        foregroundColor: isDark ? primaryColor : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        texts.reservas_todo.confirmacionPago2.summery2,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30)
                  ],
                ),
              )
            ],
          );
        }
      }),
      // Botón para navegar a la pantalla principal
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => HomeScreenPage(themeManager: widget.themeManager),
            ),
          );
        },
        child: const Icon(
          Icons.check,
          color: Color(0xFFAD974F),
        ), // Icono del botón flotante
      ),
    );
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
