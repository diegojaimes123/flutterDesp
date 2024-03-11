// ignore_for_file: deprecated_member_use, avoid_print, prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use_from_same_package

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:proyecto_final/Splash/page/SplashScreen.dart';
import 'package:proyecto_final/firebase_options.dart';
import 'package:proyecto_final/theme/theme_constants.dart';
import 'package:proyecto_final/theme/theme_manager.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import 'generated/translations.g.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); //Es de utilidad para utitlizar el widget que encierra el myApp
  LocaleSettings.useDeviceLocale();
  final languageCode = ui.window.locale.languageCode;
  final countryCode = ui.window.locale.countryCode;

  String defaultLocale = languageCode;

  if (countryCode != null) {
    defaultLocale += '_$countryCode';
  }

  // Asegura que los widgets estén inicializados antes de ejecutar la aplicación
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializa Firebase con las opciones predeterminadas para la plataforma actual
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Intl.defaultLocale = defaultLocale; //Idioma por defecto
  print(defaultLocale);
  //initializeDateFormatting('es_ES', null);//definicion de la traduccion
  // Ejecuta la aplicación
  runApp(TranslationProvider(child: MyApp()));
}

// Instancia del gestor de temas
ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  //final String countryCode, languageCode;

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  //MyAppState({});

  @override
  void dispose() {
    // Elimina el escucha del gestor de temas al desechar el widget
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    // Agrega un escucha al gestor de temas al iniciar el widget
    _themeManager.addListener(themeListener);
    super.initState();
  }

  //void changeLanguage(Locale locale){
  //setState(() {
  //if(locale.countryCode?.isNotEmpty ?? false){
  //Intl.defaultLocale = '${locale.languageCode}_${locale.countryCode}';
  //}else{
  //Intl.defaultLocale = locale.languageCode;
  //}
  //_locale = locale;
  //});
  //}

  // Método para manejar cambios en el tema
  themeListener() {
    if (mounted) {
      // Actualiza el estado solo si el widget está montado
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // Construye la aplicación MaterialApp con configuraciones específicas
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StayAway',
      theme: lightTheme, // Tema claro
      darkTheme: darkTheme, // Tema oscuro
      themeMode: _themeManager
          .themeMode, // Modo de tema gestionado por el gestor de temas
      home: SplashScreen(
          themeManager:
              _themeManager), // Página de presentación con el gestor de temas
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: LocaleSettings.supportedLocales,
      locale: TranslationProvider.of(context).flutterLocale,
    );
  }
}
