// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';
import 'package:proyecto_final/generated/translations.g.dart';
import 'package:proyecto_final/models/SitioModel.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:translator/translator.dart';

class MapaDetails extends StatefulWidget {
  // parametros para almacenar el sitio
  final SitioModel sitio;

  const MapaDetails({
    super.key,
    required this.sitio,
  });

  @override
  State<MapaDetails> createState() => _MapaDetailsState();
}

class _MapaDetailsState extends State<MapaDetails> {
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
    // pasar a double la longitud y la latitud del sitio
    double latitud = double.parse(widget.sitio.latitud);

    double longitud = double.parse(widget.sitio.longitud);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Titulo
          Text(
            texts.complementos.goTo,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          // Mapa con la ubicación del sitio
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 600,
            child: OpenStreetMapSearchAndPick(
                center: LatLong(longitud, latitud),
                buttonColor: primaryColor,
                buttonText: texts.complementos.searchLocation,
                locationPinIconColor: primaryColor,
                locationPinText: texts.complementos.location,
                locationPinTextStyle: const TextStyle(color: primaryColor),
                onPicked: (pickedData) {}),
          ),
          const SizedBox(
            height: defaultPadding,
          ),
          // Información del sitio
          SizedBox(
            height: 300,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.sitio.lugar,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  FutureBuilder<String>(
                    future: traduccionVariables(context, widget.sitio.desLugar),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return Text(
                          snapshot.data!,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.grey),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
