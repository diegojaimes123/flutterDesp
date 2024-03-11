// ignore_for_file: file_names, avoid_print, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:proyecto_final/Env.dart';
import 'package:proyecto_final/HomePage/home_screens.dart';
import 'package:proyecto_final/generated/translations.g.dart';
import 'package:proyecto_final/models/SitioModel.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:proyecto_final/theme/theme_manager.dart';
import 'package:http/http.dart' as http;

class FormActualizarSitio extends StatefulWidget {
  final ThemeManager themeManager;
  // propiedad la cual recibe un sitio para poder actualizar la información de este
  final SitioModel sitio;
  final GlobalKey<FormState> keyEditSitio;
  const FormActualizarSitio(
      {super.key,
      required this.sitio,
      required this.themeManager,
      required this.keyEditSitio});

  @override
  State<FormActualizarSitio> createState() => _FormActualizarSitioState();
}

class _FormActualizarSitioState extends State<FormActualizarSitio> {
  // variables y controladores los cuales reciben la información del sitio a editar

  late int count = widget.sitio.numHuespedes;

  late TextEditingController tituloController =
      TextEditingController(text: widget.sitio.titulo);
  late TextEditingController descripcionController =
      TextEditingController(text: widget.sitio.descripcion);
  late TextEditingController valorNocheController =
      TextEditingController(text: widget.sitio.valorNoche.toString());
  late TextEditingController descripcionLugarController =
      TextEditingController(text: widget.sitio.desLugar);
  late TextEditingController latitudController =
      TextEditingController(text: widget.sitio.latitud);
  late TextEditingController longitudController =
      TextEditingController(text: widget.sitio.longitud);
  late TextEditingController valorLimpiezaController =
      TextEditingController(text: widget.sitio.valorLimpieza.toString());

  Future editSitio() async {
    // Calcula la comisión como el 20% del valor de la noche (convertido a entero)
    int comision = (int.parse(valorNocheController.text) * 0.20).toInt();

    // Determina la URL según la plataforma (Android o cualquier otra)
    String url = "";

    url = "$djangoApi/api/Sitios/";

    // Define los encabezados para la solicitud HTTP
    final Map<String, String> dataHeader = {
      'Content-Type': 'application/json; charset-UTF=8',
    };

    // Construye el cuerpo de la solicitud HTTP con la información del sitio
    final Map<String, dynamic> dataBody = {
      "usuario": widget.sitio.usuario,
      "titulo": tituloController.text.trim(),
      "numHuespedes": count,
      "numCamas": widget.sitio.numCamas,
      "numBanos": widget.sitio.numBanos,
      "descripcion": descripcionController.text.trim(),
      "valorNoche": valorNocheController.text.trim(),
      "lugar": widget.sitio.lugar,
      "desLugar": descripcionLugarController.text.trim(),
      "latitud": latitudController.text.trim(),
      "longitud": longitudController.text.trim(),
      "continente": widget.sitio.continente,
      "valorLimpieza": valorLimpiezaController.text.trim(),
      "comision": comision,
      "politica": widget.sitio.politica,
      "categoria": widget.sitio.categoria.id,
    };

    // Variable para almacenar el resultado del código de estado de la solicitud
    int resultado = 0;

    try {
      // Realiza la solicitud HTTP PUT para actualizar la información del sitio
      final response = await http.put(
        Uri.parse("$url${widget.sitio.id}/"),
        headers: dataHeader,
        body: json.encode(dataBody),
      );

      // Actualiza la variable resultado con el código de estado de la respuesta
      setState(() {
        resultado = response.statusCode;
      });
    } catch (e) {
      // Maneja cualquier excepción que pueda ocurrir durante la solicitud HTTP
      print(e);
    }

    // Si la solicitud fue exitosa (código de estado 200), navega a la pantalla principal
    if (resultado == 200) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => HomeScreenPage(
            themeManager: widget.themeManager,
          ),
        ),
      );
    }
  }

  // Método que se llama cuando se destruye el widget asociado a este código
  @override
  void dispose() {
    super.dispose();
    // Libera los controladores de texto para evitar pérdidas de memoria
    tituloController.dispose();
    descripcionController.dispose();
    valorNocheController.dispose();
    descripcionLugarController.dispose();
    latitudController.dispose();
    longitudController.dispose();
    valorLimpiezaController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, responsive) {
          // Valida si el ancho de la pantalla es menor a 900
          if (responsive.maxWidth <= 900) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/img.webp',
                      ),
                      fit: BoxFit.cover,
                      opacity: 10.0)),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 5),
                        child: Text(
                          texts.actualizacionUno.actualiza_tu_sitio,
                          style: const TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'JosefinSans-SemiBold',
                              color: Colors.white),
                        ),
                      ),
                      // Campo del titulo
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                          child: TextFormField(
                            onChanged: (val) {
                              tituloController.value =
                                  tituloController.value.copyWith(text: val);
                            },
                            controller: tituloController,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                fillColor: Colors.grey[200],
                                filled: true,
                                labelStyle: const TextStyle(color: Colors.grey),
                                labelText: texts.actualizacionUno.title),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return texts
                                    .pantallaUno.Se_requiere_de_este_campo;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Campo descripción del sitio
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          texts.actualizacionUno.descripcion_del_sitio,
                          style: const TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'JosefinSans-SemiBold'),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                          child: TextFormField(
                            onChanged: (val) {
                              descripcionController.value =
                                  descripcionController.value
                                      .copyWith(text: val);
                            },
                            controller: descripcionController,
                            maxLines: 10,
                            obscureText: false,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                fillColor: Colors.grey[200],
                                filled: true),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return texts
                                    .pantallaUno.Se_requiere_de_este_campo;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Campo número de huespedes
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Text(
                                texts.actualizacionUno.numero_de_huespedes,
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'JosefinSans-SemiBold'),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (count == 0) {
                                            count;
                                          } else {
                                            count--;
                                          }
                                        });
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFAD974F),
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: const Center(
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 5),
                                    child: Text(
                                      count.toString(),
                                      style: const TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          count++;
                                        });
                                      },
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFAD974F),
                                            borderRadius:
                                                BorderRadius.circular(25)),
                                        child: const Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      // Campo valor noche
                      Align(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              child: Text(
                                texts.actualizacionUno.valor_noche,
                                style: const TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'JosefinSans-SemiBold'),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              width: 130,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 2.0, right: 2.0),
                                child: TextFormField(
                                  onChanged: (val) {
                                    valorNocheController.value =
                                        valorNocheController.value
                                            .copyWith(text: val);
                                  },
                                  controller: valorNocheController,
                                  obscureText: false,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      fillColor: Colors.grey[200],
                                      filled: true),
                                  validator: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return texts.pantallaUno
                                          .Se_requiere_de_este_campo;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Campo descripción del lugar
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          texts.actualizacionUno.descripcion_del_lugar,
                          style: const TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'JosefinSans-SemiBold'),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                          child: TextFormField(
                            onChanged: (val) {
                              descripcionLugarController.value =
                                  descripcionLugarController.value
                                      .copyWith(text: val);
                            },
                            controller: descripcionLugarController,
                            maxLines: 10,
                            obscureText: false,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                fillColor: Colors.grey[200],
                                filled: true),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return texts
                                    .pantallaUno.Se_requiere_de_este_campo;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        texts.actualizacionUno.texts1,
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'JosefinSans-SemiBold'),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      // Campos de latitud y longitud para saber la ubicación del sitio
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Text(
                                  texts.actualizacionUno.latitud,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'JosefinSans-SemiBold'),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: 130,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2.0, right: 2.0),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      latitudController.value =
                                          latitudController.value
                                              .copyWith(text: val);
                                    },
                                    controller: latitudController,
                                    obscureText: false,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        fillColor: Colors.grey[200],
                                        filled: true),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return texts.pantallaUno
                                            .Se_requiere_de_este_campo;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Text(
                                  texts.actualizacionUno.longitud,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'JosefinSans-SemiBold'),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                width: 130,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2.0, right: 2.0),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      longitudController.value =
                                          longitudController.value
                                              .copyWith(text: val);
                                    },
                                    controller: longitudController,
                                    obscureText: false,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        fillColor: Colors.grey[200],
                                        filled: true),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return texts.pantallaUno
                                            .Se_requiere_de_este_campo;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Campo valor de la limpieza
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          texts.actualizacionUno.valor_de_la_limpieza,
                          style: const TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'JosefinSans-SemiBold'),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 2.0, right: 2.0),
                          child: TextFormField(
                            onChanged: (val) {
                              valorLimpiezaController.value =
                                  valorLimpiezaController.value
                                      .copyWith(text: val);
                            },
                            controller: valorLimpiezaController,
                            obscureText: false,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                fillColor: Colors.grey[200],
                                filled: true),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return texts
                                    .pantallaUno.Se_requiere_de_este_campo;
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                // Función para editar el sitio
                                Navigator.pop(context);
                              },
                              child: Container(
                                width: 110,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFAD974F),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    texts.categories.cancel,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: 'JosefinSans-SemiBold'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                // Función para editar el sitio
                                if (widget.keyEditSitio.currentState!
                                        .validate() &&
                                    count != 0) {
                                  editSitio();
                                } else {
                                  showDialogFunct(context);
                                }
                              },
                              child: Container(
                                width: 110,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFAD974F),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    texts.actualizacionUno.guardar,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontFamily: 'JosefinSans-SemiBold'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
            // Vista por defecto
          } else {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/img.webp'),
                      fit: BoxFit.cover)),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 30, horizontal: 5),
                                child: Text(
                                  texts.actualizacionUno.actualiza_tu_sitio,
                                  style: const TextStyle(
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'JosefinSans-SemiBold',
                                      color: Colors.white),
                                ),
                              ),
                              // Campo del titulo
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2.0, right: 2.0),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      tituloController.value = tituloController
                                          .value
                                          .copyWith(text: val);
                                    },
                                    controller: tituloController,
                                    keyboardType: TextInputType.number,
                                    obscureText: false,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        fillColor: Colors.grey[200],
                                        filled: true,
                                        labelStyle:
                                            const TextStyle(color: Colors.grey),
                                        labelText:
                                            texts.actualizacionUno.title),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return texts.pantallaUno
                                            .Se_requiere_de_este_campo;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Campo descripción del sitio
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  texts.actualizacionUno.descripcion_del_sitio,
                                  style: const TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'JosefinSans-SemiBold'),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2.0, right: 2.0),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      descripcionController.value =
                                          descripcionController.value
                                              .copyWith(text: val);
                                    },
                                    controller: descripcionController,
                                    maxLines: 10,
                                    obscureText: false,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        fillColor: Colors.grey[200],
                                        filled: true),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return texts.pantallaUno
                                            .Se_requiere_de_este_campo;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              // Campo número de huespedes
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Text(
                                          texts.actualizacionUno
                                              .numero_de_huespedes,
                                          style: const TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  'JosefinSans-SemiBold'),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: Row(
                                          children: [
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    if (count == 0) {
                                                      count;
                                                    } else {
                                                      count--;
                                                    }
                                                  });
                                                },
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFAD974F),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.remove,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                )),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5,
                                                      vertical: 5),
                                              child: Text(
                                                count.toString(),
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    count++;
                                                  });
                                                },
                                                child: Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      color: const Color(
                                                          0xFFAD974F),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25)),
                                                  child: const Center(
                                                    child: Icon(
                                                      Icons.add,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  // Campo valor noche
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5),
                                        child: Text(
                                          texts.actualizacionUno.valor_noche,
                                          style: const TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  'JosefinSans-SemiBold'),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Container(
                                        width: 130,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 2.0, right: 2.0),
                                          child: TextFormField(
                                            onChanged: (val) {
                                              valorNocheController.value =
                                                  valorNocheController.value
                                                      .copyWith(text: val);
                                            },
                                            controller: valorNocheController,
                                            obscureText: false,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                fillColor: Colors.grey[200],
                                                filled: true),
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return texts.pantallaUno
                                                    .Se_requiere_de_este_campo;
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      )),
                  Container(
                    width: 2,
                    height: MediaQuery.of(context).size.height - 150,
                    color: Colors.grey,
                  ),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Campo descripción del lugar
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  texts.actualizacionUno.descripcion_del_lugar,
                                  style: const TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'JosefinSans-SemiBold'),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2.0, right: 2.0),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      descripcionLugarController.value =
                                          descripcionLugarController.value
                                              .copyWith(text: val);
                                    },
                                    controller: descripcionLugarController,
                                    maxLines: 10,
                                    obscureText: false,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        fillColor: Colors.grey[200],
                                        filled: true),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return texts.pantallaUno
                                            .Se_requiere_de_este_campo;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                texts.actualizacionUno.texts1,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'JosefinSans-SemiBold'),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 10),
                              // Campos de latitud y longitud para saber la ubicación del sitio
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5),
                                        child: Text(
                                          texts.actualizacionUno.latitud,
                                          style: const TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  'JosefinSans-SemiBold'),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Container(
                                        width: 130,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 2.0, right: 2.0),
                                          child: TextFormField(
                                            onChanged: (val) {
                                              latitudController.value =
                                                  latitudController.value
                                                      .copyWith(text: val);
                                            },
                                            controller: latitudController,
                                            obscureText: false,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                fillColor: Colors.grey[200],
                                                filled: true),
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return texts.pantallaUno
                                                    .Se_requiere_de_este_campo;
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5),
                                        child: Text(
                                          texts.actualizacionUno.longitud,
                                          style: const TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  'JosefinSans-SemiBold'),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Container(
                                        width: 130,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border:
                                              Border.all(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 2.0, right: 2.0),
                                          child: TextFormField(
                                            onChanged: (val) {
                                              longitudController.value =
                                                  longitudController.value
                                                      .copyWith(text: val);
                                            },
                                            controller: longitudController,
                                            obscureText: false,
                                            style: const TextStyle(
                                                color: Colors.black),
                                            decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                fillColor: Colors.grey[200],
                                                filled: true),
                                            validator: (String? value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return texts.pantallaUno
                                                    .Se_requiere_de_este_campo;
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(height: 20),
                              // Campo Valor limpieza
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Text(
                                  texts.actualizacionUno.valor_de_la_limpieza,
                                  style: const TextStyle(
                                      fontSize: 19,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'JosefinSans-SemiBold'),
                                ),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 2.0, right: 2.0),
                                  child: TextFormField(
                                    onChanged: (val) {
                                      valorLimpiezaController.value =
                                          valorLimpiezaController.value
                                              .copyWith(text: val);
                                    },
                                    controller: valorLimpiezaController,
                                    obscureText: false,
                                    style: const TextStyle(color: Colors.black),
                                    decoration: InputDecoration(
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        fillColor: Colors.grey[200],
                                        filled: true),
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return texts.pantallaUno
                                            .Se_requiere_de_este_campo;
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        // Función para editar el sitio
                                        Navigator.pop(context);
                                      },
                                      child: Container(
                                        width: 110,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFAD974F),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: Text(
                                            texts.categories.cancel,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontFamily:
                                                    'JosefinSans-SemiBold'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: GestureDetector(
                                      onTap: () {
                                        // Función para editar el sitio
                                        if (widget.keyEditSitio.currentState!
                                                .validate() &&
                                            count != 0) {
                                          editSitio();
                                        } else {
                                          showDialogFunct(context);
                                        }
                                      },
                                      child: Container(
                                        width: 110,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFAD974F),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: Text(
                                            texts.actualizacionUno.guardar,
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 17,
                                                fontFamily:
                                                    'JosefinSans-SemiBold'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            );
          }
        },
      ),
    );
  }

  // Modal de alerta acerca de los campos
  showDialogFunct(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              texts.info_importante.question.title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            content: SizedBox(
              height: 200,
              width: 400,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        texts.modalInfor.texts,
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(color: primaryColor, fontSize: 15),
                      ),
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
                      child: Text(texts.mySites.accept)),
                ],
              ),
            ],
          );
        });
  }
}
