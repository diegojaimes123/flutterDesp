// ignore_for_file:avoid_print, use_build_context_synchronously, prefer_final_fields, avoid_unnecessary_containers

import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firabase_storage;
import 'package:http/http.dart' as http;
import 'package:proyecto_final/Env.dart';
import 'package:proyecto_final/HomePage/home_screens.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:proyecto_final/theme/theme_manager.dart';
import 'package:proyecto_final/generated/translations.g.dart';
import 'package:image/image.dart' as im;

class CategoriaForm extends StatefulWidget {
  final ThemeManager themeManager;
  const CategoriaForm({super.key, required this.themeManager});

  @override
  State<CategoriaForm> createState() => _CategoriaFormState();
}

class _CategoriaFormState extends State<CategoriaForm> {
  //Validacion de formularios
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

// Controladores para los campos de texto
  TextEditingController _categoriaController = TextEditingController();
  TextEditingController _imagenController = TextEditingController();
  TextEditingController _iconController = TextEditingController();

  // Variables para almacenar información sobre la selección de archivos e imágenes
  String selectCFile = '';
  String selectCIcon = '';
  Uint8List? selectedImagenInBytes;
  int imagenCounts = 0;
  List<Uint8List> pickedImagesBytes = [];
  String foto = '';
  Uint8List? iconBytes;
  // Textos para los botones de selección de icono e imagen
  String botonIcono = texts.cosas_faltantes.select;
  String botonImagen = texts.cosas_faltantes.selectImage;

  // Método para seleccionar un archivo de imagen
  _selectFileC(bool imagenFrom) async {
    // Utiliza FilePicker para permitir al usuario seleccionar un archivo de imagen
    FilePickerResult? fileResult = await FilePicker.platform.pickFiles();

    if (fileResult != null) {
      setState(() {
        selectCFile = fileResult.files.first.name;
        selectedImagenInBytes = fileResult.files.first.bytes;
      });
    }

    // Cargar la imagen desde los bytes
    final image = im.decodeImage(selectedImagenInBytes!);

    // Verificar los casos y modificar la imagen según sea necesario
    if (image!.width > 700 && image.height > 500) {
      // Caso 1: La imagen es mayor en ambos anchos y altos
      final resizedImage = im.copyResize(image, width: 700, height: 500);
      selectedImagenInBytes = Uint8List.fromList(
          im.encodeJpg(resizedImage, quality: 50)); // Reducir calidad a 50
    } else if (image.width > 700 && image.height <= 500) {
      // Caso 2: El ancho es mayor a 700 y el alto es menor a 500
      final resizedImage = im.copyResize(image, width: 700);
      selectedImagenInBytes = Uint8List.fromList(
          im.encodeJpg(resizedImage, quality: 50)); // Reducir calidad a 50
    } else if (image.width <= 700 && image.height > 500) {
      // Caso 3: El ancho es menor que 700 y el alto es mayor a 500
      final resizedImage = im.copyResize(image, height: 500);
      selectedImagenInBytes = Uint8List.fromList(
          im.encodeJpg(resizedImage, quality: 50)); // Reducir calidad a 50
    } else {
      // Caso por defecto
      selectedImagenInBytes = Uint8List.fromList(
          im.encodeJpg(image, quality: 50)); // Reducir calidad a 10
    }

    // Sube la imagen seleccionada a Firebase Storage
    final url = await _uploadFileC();
    print(url);
    print(selectCFile);
    setState(() {
      botonImagen = texts.pruebaEdit.listo;
    });
  }

  // Método para seleccionar un icono
  _selectIconC(bool iconFrom) async {
    // Utiliza FilePicker para permitir al usuario seleccionar un archivo de icono
    FilePickerResult? iconResult = await FilePicker.platform.pickFiles();

    if (iconResult != null) {
      setState(() {
        selectCIcon = iconResult.files.first.name;
        iconBytes = iconResult.files.first.bytes;
      });
    }

    // Cargar la imagen desde los bytes
    final image = im.decodeImage(iconBytes!);

    // Verificar los casos y modificar la imagen según sea necesario
    if (image!.width != 512 && image.height != 512) {
      // Caso 1: La imagen es diferente a las medidas establecidas
      final resizedImage = im.copyResize(image, width: 512, height: 512);
      iconBytes = Uint8List.fromList(im.encodePng(resizedImage));
    } else {
      // Caso por defecto
      iconBytes = Uint8List.fromList(im.encodePng(image));
    }

    // Sube el icono seleccionado a Firebase Storage
    final url = await _uploadIconC();
    print(url);
    print(selectCIcon);
    setState(() {
      botonIcono = texts.pruebaEdit.listo;
    });
  }

  // Método para subir el archivo de imagen a Firebase Storage y obtener la URL
  Future<String> _uploadFileC() async {
    String imageUrl = '';
    try {
      firabase_storage.UploadTask uploadTask;

      // Establece la referencia de almacenamiento en Firebase Storage para la imagen
      firabase_storage.Reference ref = firabase_storage.FirebaseStorage.instance
          .ref()
          .child('category')
          .child('/$selectCFile');

      final metadata =
          firabase_storage.SettableMetadata(contentType: 'image/jpeg');

      // Inicia la carga del archivo de imagen a Firebase Storage
      uploadTask = ref.putData(selectedImagenInBytes!, metadata);

      await uploadTask.whenComplete(() => null);
      // Actualiza el valor del controlador con la URL de la imagen
      imageUrl = await ref.getDownloadURL();
      setState(() {
        _imagenController.text = imageUrl;
      });
    } catch (e) {
      print(e);
    }
    return imageUrl;
  }

  // Método para subir el archivo de icono a Firebase Storage y obtener la URL
  Future<String> _uploadIconC() async {
    String iconUrl = '';
    try {
      firabase_storage.UploadTask uploadTask;

      // Establece la referencia de almacenamiento en Firebase Storage para el icono
      firabase_storage.Reference ref = firabase_storage.FirebaseStorage.instance
          .ref()
          .child('category')
          .child('/$selectCIcon');

      final metadata =
          firabase_storage.SettableMetadata(contentType: 'image/png');

      // Inicia la carga del archivo de icono a Firebase Storage
      uploadTask = ref.putData(iconBytes!, metadata);

      await uploadTask.whenComplete(() => null);
      // Actualiza el valor del controlador con la URL del icono
      iconUrl = await ref.getDownloadURL();
      setState(() {
        _iconController.text = iconUrl;
      });
    } catch (e) {
      print(e);
    }
    return iconUrl;
  }

  // Método para registrar una nueva categoría
  Future registerCategory() async {
    String url = "";

    url = "$djangoApi/api/Categorias/";

    // Encabezados y cuerpo de la solicitud HTTP
    final Map<String, String> dataHeader = {
      'Content-Type': 'application/json; charset-UTF=8',
    };

    final Map<String, dynamic> dataBody = {
      "nombre": _categoriaController.text.trim(),
      "icono": _iconController.text.trim(),
      "imagen": _imagenController.text.trim(),
    };

    int resultado = 0;

    try {
      // Enviar solicitud POST para registrar la categoría
      final response = await http.post(
        Uri.parse(url),
        headers: dataHeader,
        body: json.encode(dataBody),
      );

      setState(() {
        resultado = response.statusCode;
      });
    } catch (e) {
      print(e);
    }

    // Navegar a la pantalla de inicio si el registro es exitoso
    if (resultado == 201) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => HomeScreenPage(
            themeManager: widget.themeManager,
          ),
        ),
      );
    }
  }

  // Liberar recursos al cerrar la pantalla
  @override
  void dispose() {
    _categoriaController.dispose();
    _imagenController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Verifica el tema actual
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    final texts = Translations.of(context);
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, responsive) {
          // Verifica si el ancho de la pantalla es menor o igual 730
          if (responsive.maxWidth <= 730) {
            return Column(
              children: [
                Expanded(
                    child: Container(
                  child: Stack(children: [
                    Positioned(
                      left: 10,
                      top: 8,
                      child: MouseRegion(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(22)),
                            child: const Icon(
                              Icons.arrow_back,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )),
                Expanded(
                  flex: 8,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 50),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5))),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 6,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        texts.From.category,
                                        style: const TextStyle(
                                            fontFamily: 'CedarvilleCursive',
                                            fontSize: 40,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(height: 30),
                                      // Formulario de edición de categoría
                                      Form(
                                          key: formKey,
                                          child: Column(
                                            children: [
                                              // Campo de texto para el nombre de la categoría
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 25.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: Colors.white),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 2.0,
                                                            right: 2.0),
                                                    child: TextFormField(
                                                      style: const TextStyle(
                                                          color: Colors.black),
                                                      controller:
                                                          _categoriaController,
                                                      obscureText: false,
                                                      keyboardType:
                                                          TextInputType.name,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle:
                                                            const TextStyle(
                                                                fontSize: 13),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .white),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                  color: Colors
                                                                      .white),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(12),
                                                        ),
                                                        hintText:
                                                            texts.From.category,
                                                        hintStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black),
                                                        fillColor:
                                                            Colors.grey[200],
                                                        filled: true,
                                                      ),
                                                      // Validación del campo
                                                      validator:
                                                          (String? value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return texts
                                                              .From.required;
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              // Selección de archivo de imagen
                                              GestureDetector(
                                                onTap: () async {
                                                  setState(() {
                                                    botonImagen =
                                                        texts.From.loading;
                                                  });
                                                  _selectFileC(true);
                                                },
                                                child: Container(
                                                  width: 200,
                                                  height: 50,
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFFFFFFF),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: const Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      botonImagen,
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              // Vista previa de la imagen seleccionada
                                              Container(
                                                width: 150,
                                                height: 150,
                                                decoration: const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    5))),
                                                child: selectCFile.isEmpty
                                                    ? Image.asset(
                                                        'assets/images/categoria.jpg',
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.memory(
                                                        selectedImagenInBytes!,
                                                        fit: BoxFit.cover,
                                                      ),
                                              ),
                                              const SizedBox(height: 20),
                                              // Selección de archivo de icono
                                              GestureDetector(
                                                onTap: () async {
                                                  setState(() {
                                                    botonIcono =
                                                        texts.From.loading;
                                                  });
                                                  _selectIconC(true);
                                                },
                                                child: Container(
                                                  width: 180,
                                                  height: 50,
                                                  padding: const EdgeInsets.all(
                                                      15.0),
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.5),
                                                        spreadRadius: 5,
                                                        blurRadius: 7,
                                                        offset: const Offset(0,
                                                            3), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      botonIcono,
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              // Vista previa del icono seleccionado
                                              if (iconBytes != null)
                                                Image.memory(
                                                  iconBytes!,
                                                  width: 50,
                                                  height: 50,
                                                )
                                              else
                                                Text(
                                                  texts.From.notIcon,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 17,
                                                      fontFamily:
                                                          'CedarvilleCursive',
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              const SizedBox(
                                                height: defaultPadding,
                                              ),
                                              // Información sobre el proceso de carga de imágenes
                                              Text(
                                                texts.From.summery,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontFamily:
                                                        'CedarvilleCursive',
                                                    fontWeight:
                                                        FontWeight.bold),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
            // Verifica si el ancho de la pantalla es menor o igual a 950 o es igual a 1024
          } else if (responsive.maxWidth <= 950 ||
              responsive.maxWidth == 1024) {
            return Column(
              children: [
                Expanded(
                    child: Container(
                  child: Stack(children: [
                    Positioned(
                      left: 10,
                      top: 8,
                      child: MouseRegion(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(22)),
                            child: const Icon(
                              Icons.arrow_back,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                )),
                Expanded(
                  flex: 8,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Container(
                        height: responsive.maxWidth > 1024 ? 600 : 500,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5))),
                        child: Row(
                          children: [
                            // Vista previa de la imagen seleccionada
                            Expanded(
                              flex: 3,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(5))),
                                child: selectCFile.isEmpty
                                    ? Image.asset(
                                        'assets/images/categoria.jpg',
                                        fit: BoxFit.cover,
                                      )
                                    : Image.memory(
                                        selectedImagenInBytes!,
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        texts.From.category,
                                        style: const TextStyle(
                                            fontFamily: 'CedarvilleCursive',
                                            fontSize: 40,
                                            color: Colors.black),
                                      ),
                                      const SizedBox(height: 30),
                                      // Formulario de edición de categoría
                                      Form(
                                        key: formKey,
                                        child: Column(
                                          children: [
                                            // Campo de texto para el nombre de la categoría
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 25.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 2.0,
                                                          right: 2.0),
                                                  child: TextFormField(
                                                    style: const TextStyle(
                                                        color: Colors.black),
                                                    controller:
                                                        _categoriaController,
                                                    obscureText: false,
                                                    keyboardType:
                                                        TextInputType.name,
                                                    decoration: InputDecoration(
                                                      labelStyle:
                                                          const TextStyle(
                                                              fontSize: 13),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide:
                                                            const BorderSide(
                                                                color: Colors
                                                                    .white),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      hintText:
                                                          texts.From.category,
                                                      hintStyle:
                                                          const TextStyle(
                                                              color:
                                                                  Colors.black),
                                                      fillColor:
                                                          Colors.grey[200],
                                                      filled: true,
                                                    ),
                                                    // Validación del campo
                                                    validator: (String? value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return texts
                                                            .From.required;
                                                      }
                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            // Selección de archivo de imagen
                                            GestureDetector(
                                              onTap: () async {
                                                setState(() {
                                                  botonImagen =
                                                      texts.From.loading;
                                                });
                                                _selectFileC(true);
                                              },
                                              child: Container(
                                                width: 200,
                                                height: 50,
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFFFA810),
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: const Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    botonImagen,
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            // Selección de archivo de icono
                                            GestureDetector(
                                              onTap: () async {
                                                setState(() {
                                                  botonIcono =
                                                      texts.From.loading;
                                                });
                                                _selectIconC(true);
                                              },
                                              child: Container(
                                                width: 180,
                                                height: 50,
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.5),
                                                      spreadRadius: 5,
                                                      blurRadius: 7,
                                                      offset: const Offset(0,
                                                          3), // changes position of shadow
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    botonIcono,
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 20),
                                            // Vista previa del icono seleccionado
                                            if (iconBytes != null)
                                              Image.memory(
                                                iconBytes!,
                                                width: 100,
                                                height: 100,
                                              )
                                            else
                                              Text(
                                                texts.From.notIcon,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 17,
                                                    fontFamily:
                                                        'CedarvilleCursive',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            const SizedBox(
                                              height: defaultPadding,
                                            ),
                                            // Información sobre el proceso de carga de imágenes
                                            Text(
                                              texts.From.summery,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 15,
                                                  fontFamily:
                                                      'CedarvilleCursive',
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          // Vista por defecto
          return Column(
            children: [
              Expanded(
                  child: Container(
                child: Stack(children: [
                  Positioned(
                    left: 10,
                    top: 8,
                    child: MouseRegion(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(22)),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              )),
              Expanded(
                flex: 8,
                child: Center(
                  child: Container(
                    width: 950,
                    height: 550,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5))),
                    child: Row(
                      children: [
                        // Vista previa de la imagen seleccionada
                        Expanded(
                          flex: 3,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5))),
                            child: selectCFile.isEmpty
                                ? Image.asset(
                                    'assets/images/categoria.jpg',
                                    fit: BoxFit.cover,
                                  )
                                : Image.memory(
                                    selectedImagenInBytes!,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    texts.From.category,
                                    style: const TextStyle(
                                        fontFamily: 'CedarvilleCursive',
                                        fontSize: 40,
                                        color: Colors.black),
                                  ),
                                  const SizedBox(height: 30),
                                  // Formulario de edición de categoría
                                  Form(
                                      key: formKey,
                                      child: Column(
                                        children: [
                                          // Campo de texto para el nombre de la categoría
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 25.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 2.0, right: 2.0),
                                                child: TextFormField(
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                  controller:
                                                      _categoriaController,
                                                  obscureText: false,
                                                  keyboardType:
                                                      TextInputType.name,
                                                  decoration: InputDecoration(
                                                    labelStyle: const TextStyle(
                                                        fontSize: 13),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color:
                                                                  Colors.white),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                    ),
                                                    hintText:
                                                        texts.From.category,
                                                    hintStyle: const TextStyle(
                                                        color: Colors.black),
                                                    fillColor: Colors.grey[200],
                                                    filled: true,
                                                  ),
                                                  // Validación del campo
                                                  validator: (String? value) {
                                                    if (value == null ||
                                                        value.isEmpty) {
                                                      return texts
                                                          .From.required;
                                                    }
                                                    return null;
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          // Selección de archivo de imagen
                                          GestureDetector(
                                            onTap: () async {
                                              setState(() {
                                                botonImagen =
                                                    texts.From.loading;
                                              });
                                              _selectFileC(true);
                                            },
                                            child: Container(
                                              width: 200,
                                              height: 50,
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFFA810),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: const Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                  botonImagen,
                                                  style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          // Selección de archivo de icono
                                          GestureDetector(
                                            onTap: () async {
                                              setState(() {
                                                botonIcono = texts.From.loading;
                                              });
                                              _selectIconC(true);
                                            },
                                            child: Container(
                                              width: 180,
                                              height: 50,
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: const Offset(0,
                                                        3), // changes position of shadow
                                                  ),
                                                ],
                                              ),
                                              child: Center(
                                                child: Text(
                                                  botonIcono,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          // Vista previa del icono seleccionado
                                          if (iconBytes != null)
                                            Image.memory(
                                              iconBytes!,
                                              width: 100,
                                              height: 100,
                                            )
                                          else
                                            Text(
                                              texts.From.notIcon,
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 17,
                                                  fontFamily:
                                                      'CedarvilleCursive',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          const SizedBox(
                                            height: defaultPadding,
                                          ),
                                          // Información sobre el proceso de carga de imágenes
                                          Text(
                                            texts.From.summery,
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 15,
                                                fontFamily: 'CedarvilleCursive',
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ))
                                ],
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      // Botón para guardar la categoría
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (formKey.currentState!.validate() &&
              _iconController.text.isNotEmpty &&
              _imagenController.text.isNotEmpty) {
            // Función para guardar la categoría
            registerCategory();
          } else {
            showDialogFunct(context);
          }
        },
        label: Text(
          texts.From.save,
          style: TextStyle(
              color: isDark ? primaryColor : Colors.black,
              fontSize: 17,
              fontFamily: 'CedarvilleCursive'),
        ),
        icon: Icon(
          Icons.save,
          color: isDark ? primaryColor : Colors.black,
        ),
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
