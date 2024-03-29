// ignore_for_file: file_names, use_build_context_synchronously, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:proyecto_final/Env.dart';
import 'package:proyecto_final/HomePage/home_screens.dart';
import 'package:proyecto_final/generated/translations.g.dart';
import 'package:proyecto_final/models/DevolucionModel.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:proyecto_final/theme/theme_manager.dart';
import 'package:http/http.dart' as http;

class ActualizarDevoluciones extends StatefulWidget {
  // parametro que recibe la devolución
  final DevolucionModel devolucionModel;

  final ThemeManager themeManager;

  const ActualizarDevoluciones(
      {super.key, required this.devolucionModel, required this.themeManager});

  @override
  State<ActualizarDevoluciones> createState() => _RolUsuarioState();
}

class _RolUsuarioState extends State<ActualizarDevoluciones> {
  // Lista de opciones para el estado de la devolución
  List devo = [
    ActualizarDevo(texts.pendienteE, "Pendiente"),
    ActualizarDevo(texts.finalizadoE, "Finalizado"),
  ];

  // Controladores de texto para el estado y la fecha de la devolución
  late TextEditingController estadoDevolu =
      TextEditingController(text: widget.devolucionModel.estado);

  late TextEditingController fechaDevolu =
      TextEditingController(text: widget.devolucionModel.fechaPago);

  // Variable para almacenar el estado seleccionado de la devolución
  String? estadoDevo;

  // Método para actualizar las devoluciones
  Future updateDevoluciones() async {
    // Actualizar la fecha de la devolución si el estado es "Finalizado
    if (estadoDevolu.text == "Finalizado") {
      fechaDevolu.text =
          "${DateTime.now().year}-${DateTime.now().month.toString().padLeft(2, '0')}-${DateTime.now().day.toString().padLeft(2, '0')}";
    }

    try {
      // Llamar a la función para agregar o actualizar las devoluciones
      final respuesta = await addActulizarDevoluciones(
          widget.devolucionModel.fechaRadicado,
          fechaDevolu.text.trim(),
          widget.devolucionModel.valor.toString(),
          widget.devolucionModel.reserva.id.toString(),
          estadoDevolu.text.trim());

      // Verificar si la operación fue exitosa
      if (respuesta == 200) {
        // Navegar a la pantalla principal después de actualizar las devoluciones
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HomeScreenPage(
                  themeManager: widget.themeManager,
                )));
      }
    } catch (e) {
      // Manejar cualquier error
      print(e);
    }
  }

  // Función para agregar o actualizar devoluciones mediante una solicitud HTTP PUT
  Future<int> addActulizarDevoluciones(
    String fechaRadicado,
    String fechaPago,
    String valor,
    String reserva,
    String estadoController,
  ) async {
    // Construir la URL de la API según la plataforma
    String url = "";

    url = "$djangoApi/api/Devolucion/";

    // Encabezados y cuerpo de la solicitud HTTP
    final Map<String, String> dataHeader = {
      'Content-Type': 'application/json; charset-UTF=8',
    };

    final Map<String, dynamic> dataBody = {
      "fechaRadicado": fechaRadicado,
      "fechaPago": estadoDevolu.text == "Finalizado" ? fechaPago : null,
      "valor": valor,
      "estado": estadoController,
      "reserva": reserva,
    };

    // Variable para almacenar el resultado de la operación
    int resultado = 0;

    try {
      // Realizar la solicitud HTTP PUT para agregar o actualizar devoluciones
      final response = await http.put(
        Uri.parse("$url${widget.devolucionModel.id}/"),
        headers: dataHeader,
        body: json.encode(dataBody),
      );

      // Actualizar el resultado con el código de estado de la respuesta
      setState(() {
        resultado = response.statusCode;
      });
    } catch (e) {
      // Manejar cualquier error
      print(e);
    }

    // Devolver el resultado de la operación
    return resultado;
  }

  // Liberar recursos cuando se destruye el widget
  @override
  void dispose() {
    estadoDevolu.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        texts.reservas_todo.actualizacionDevoluciones.title,
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
              Image.asset(
                "assets/images/logo.png",
                width: 150,
                height: 150,
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              // DropdownButton para ver los estados
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    // Configuración del menú desplegable
                    isExpanded: true,
                    hint: Row(
                      children: [
                        Expanded(
                          child: Text(
                            texts
                                .reservas_todo.actualizacionDevoluciones.status,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    items: devo
                        .map((item) => DropdownMenuItem<String>(
                              value: item.valor,
                              child: Text(
                                item.titulo,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ))
                        .toList(),
                    value: estadoDevolu.text, // Valor seleccionado actualmente
                    onChanged: (String? value) {
                      // Manejador de eventos cuando se selecciona un nuevo valor
                      setState(() {
                        estadoDevo = value;
                        estadoDevolu.text = estadoDevo!;
                      });
                      if (estadoDevo == null || estadoDevo!.isEmpty) {
                        return;
                      }
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 50,
                      padding: const EdgeInsets.only(left: 14, right: 14),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.black26,
                        ),
                        color: Colors.white,
                      ),
                      elevation: 2,
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(
                        Icons.arrow_forward_ios_outlined,
                      ),
                      iconSize: 14,
                      iconEnabledColor: Colors.black,
                      iconDisabledColor: Colors.grey,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      maxHeight: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      offset: const Offset(-20, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all<double>(6),
                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        // Botones de la barra inferior
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child:
                    Text(texts.reservas_todo.actualizacionDevoluciones.cancel)),
            ElevatedButton(
                onPressed: () {
                  // Función para actualizar el estado
                  updateDevoluciones();
                },
                child:
                    Text(texts.reservas_todo.actualizacionDevoluciones.save)),
          ],
        ),
      ],
    );
  }
}

// Clase para representar un estado con un título y un valor booleano
class ActualizarDevo {
  final String? titulo;
  final String valor;

  ActualizarDevo(this.titulo, this.valor);
}
