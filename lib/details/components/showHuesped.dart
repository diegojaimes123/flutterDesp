// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:proyecto_final/generated/translations.g.dart';
import 'package:proyecto_final/theme/theme_constants.dart';

// ignore: must_be_immutable
class ShowHuesped extends StatefulWidget {
  // propiedades para el funcionamiento del desplegable y para contabilizar los huespedes
  final OverlayEntry? entry;
  TextEditingController numAdultosController;

  TextEditingController numNinosController;

  TextEditingController numBebesController;

  TextEditingController numMascotasController;

  TextEditingController total;

  final VoidCallback updateTotalCallback;

  ShowHuesped({
    super.key,
    required this.entry,
    required this.numAdultosController,
    required this.numNinosController,
    required this.numBebesController,
    required this.numMascotasController,
    required this.total,
    required this.updateTotalCallback,
  });

  @override
  State<ShowHuesped> createState() => _ShowHuespedState();
}

class _ShowHuespedState extends State<ShowHuesped> {
  // Función para cerrar el desplegable del conteo de huespedes
  void hideOverlay() {
    widget.entry?.remove();
  }

  _ShowHuespedState();

  // inicialización de los contadores para contabilizar los huespedes
  var numAdultos = 1;

  var numNinos = 0;

  var numBebes = 0;

  var numMascotas = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Align(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: defaultPadding,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      texts.showHuesped.adults,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      texts.showHuesped.age,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(58),
                          child: Container(
                            color: primaryColor,
                            child: IconButton(
                              onPressed: () {
                                // disminución del contador adultos
                                setState(() {
                                  if (numAdultos <= 0) {
                                    numAdultos = 0;
                                    widget.numAdultosController.text =
                                        numAdultos.toString();
                                  } else {
                                    numAdultos--;
                                    widget.numAdultosController.text =
                                        numAdultos.toString();
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                              style: const ButtonStyle(
                                  backgroundColor:
                                      MaterialStatePropertyAll(primaryColor)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: defaultPadding,
                        ),
                        // ver el contador adultos
                        Text(numAdultos.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                        const SizedBox(
                          width: defaultPadding,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(58),
                          child: Container(
                            color: primaryColor,
                            child: IconButton(
                              onPressed: () {
                                // incrementar el contador adultos
                                setState(() {
                                  numAdultos++;
                                  widget.numAdultosController.text =
                                      numAdultos.toString();
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      texts.showHuesped.children,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      texts.showHuesped.from,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(58),
                          child: Container(
                            color: primaryColor,
                            child: IconButton(
                              onPressed: () {
                                // disminuir el contador niños
                                setState(() {
                                  if (numNinos <= 0) {
                                    numNinos = 0;
                                    widget.numNinosController.text =
                                        numNinos.toString();
                                  } else {
                                    numNinos--;
                                    widget.numNinosController.text =
                                        numNinos.toString();
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: defaultPadding,
                        ),
                        // ver el contador niños
                        Text(numNinos.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                        const SizedBox(
                          width: defaultPadding,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(58),
                          child: Container(
                            color: primaryColor,
                            child: IconButton(
                              onPressed: () {
                                // incrementar el contador niños
                                setState(() {
                                  numNinos++;
                                  widget.numNinosController.text =
                                      numNinos.toString();
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      texts.showHuesped.babys,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      texts.showHuesped.less,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(58),
                          child: Container(
                            color: primaryColor,
                            child: IconButton(
                              onPressed: () {
                                // disminuir el contador bebes
                                setState(() {
                                  if (numBebes <= 0) {
                                    numBebes = 0;
                                    widget.numBebesController.text =
                                        numBebes.toString();
                                  } else {
                                    numBebes--;
                                    widget.numBebesController.text =
                                        numBebes.toString();
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: defaultPadding,
                        ),
                        // ver el contador bebes
                        Text(numBebes.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                        const SizedBox(
                          width: defaultPadding,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(58),
                          child: Container(
                            color: primaryColor,
                            child: IconButton(
                              onPressed: () {
                                // incrementar el contador bebes
                                setState(() {
                                  numBebes++;
                                  widget.numBebesController.text =
                                      numBebes.toString();
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      texts.showHuesped.pets,
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(58),
                          child: Container(
                            color: primaryColor,
                            child: IconButton(
                              onPressed: () {
                                // disminuir el contador mascotas
                                setState(() {
                                  if (numMascotas <= 0) {
                                    numMascotas = 0;
                                    widget.numMascotasController.text =
                                        numMascotas.toString();
                                  } else {
                                    numMascotas--;
                                    widget.numMascotasController.text =
                                        numMascotas.toString();
                                  }
                                });
                              },
                              icon: const Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: defaultPadding,
                        ),
                        // ver el contador mascotas
                        Text(numMascotas.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey)),
                        const SizedBox(
                          width: defaultPadding,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(58),
                          child: Container(
                            color: primaryColor,
                            child: IconButton(
                              onPressed: () {
                                // incrementar el contador mascotas
                                setState(() {
                                  numMascotas++;
                                  widget.numMascotasController.text =
                                      numMascotas.toString();
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                const Divider(
                  height: 1,
                ),
                const SizedBox(
                  height: defaultPadding,
                ),
                Center(
                    child: TextButton(
                        onPressed: () {
                          // suma de los contadores y cierre del desplegable
                          setState(() {
                            widget.total.text =
                                (numAdultos + numNinos + numBebes + numMascotas)
                                    .toString();
                          });
                          widget.updateTotalCallback();
                          hideOverlay();
                        },
                        child: Text(
                          texts.showHuesped.save,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ))),
                const SizedBox(
                  height: defaultPadding,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
