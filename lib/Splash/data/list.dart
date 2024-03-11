import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:proyecto_final/generated/translations.g.dart';

// Clase que define los componentes utilizados en la pantalla de bienvenida
class Components {
  String image; // Ruta de la imagen o icono principal
  String titulo; // Título del componente
  String descripcion; // Descripción del componente
  Widget
      backgroundColor; // Fondo del componente (puede ser un widget como Lottie)
  String imagen2; // Segunda imagen relacionada al componente
  Color background; // Color de fondo del componente

  // Constructor que inicializa los atributos de la clase
  Components(
      {required this.image,
      required this.titulo,
      required this.descripcion,
      required this.backgroundColor,
      required this.imagen2,
      required this.background});
}

// Lista que contiene instancias de la clase Components, representando cada componente de la pantalla
List<Components> listaComponents = [
  Components(
      image: 'assets/icons/img1.svg',
      titulo: texts.splashScreen.explora_el_Mundo.title,
      descripcion: texts.splashScreen.explora_el_Mundo.description,
      backgroundColor: LottieBuilder.asset(
        "assets/animation/animation3.json",
        fit: BoxFit.cover,
      ),
      imagen2: 'assets/images/img1.jpg',
      background: Colors.black),
  Components(
      image: 'assets/icons/img2.svg',
      titulo: texts.splashScreen.viaja_con_Estilo.title,
      descripcion: texts.splashScreen.viaja_con_Estilo.description,
      backgroundColor: Padding(
        padding: const EdgeInsets.only(top: 180),
        child: LottieBuilder.asset(
          "assets/animation/animation3.json",
          fit: BoxFit.cover,
        ),
      ),
      imagen2: 'assets/images/img2.jpg',
      background: Colors.white),
  Components(
      image: 'assets/icons/img3.svg',
      titulo: texts.splashScreen.rutas_Secretas.title,
      descripcion: texts.splashScreen.rutas_Secretas.description,
      backgroundColor: LottieBuilder.asset("assets/animation/animation3.json",
          fit: BoxFit.cover),
      imagen2: 'assets/images/img3.jpg',
      background: Colors.black),
  Components(
      image: 'assets/icons/img4.svg',
      titulo: texts.splashScreen.planifica_Tu_Escape.title,
      descripcion: texts.splashScreen.planifica_Tu_Escape.description,
      backgroundColor: Padding(
        padding: const EdgeInsets.only(top: 180),
        child: LottieBuilder.asset(
          "assets/animation/animation3.json",
          fit: BoxFit.cover,
        ),
      ),
      imagen2: 'assets/images/img4.jpg',
      background: Colors.white),
  Components(
      image: 'assets/icons/img5.svg',
      titulo: texts.splashScreen.viajar_Transforma.title,
      descripcion: texts.splashScreen.viaja_con_Estilo.description,
      backgroundColor: LottieBuilder.asset("assets/animation/animation3.json",
          fit: BoxFit.cover),
      imagen2: 'assets/images/img5.jpg',
      background: Colors.black),
];
