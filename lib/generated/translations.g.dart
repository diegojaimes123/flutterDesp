/// Generated file. Do not edit.
///
/// Original: i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 1170 (585 per locale)
///
/// Built on 2024-03-10 at 17:01 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	es(languageCode: 'es', build: _TranslationsEs.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of texts).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = texts.someKey.anotherKey;
/// String b = texts['someKey.anotherKey']; // Only for edge cases!
Translations get texts => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final texts = Translations.of(context); // Get texts variable.
/// String a = texts.someKey.anotherKey; // Use texts variable.
/// String b = texts['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.texts.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get texts => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final texts = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _TranslationsBuscadorEn buscador = _TranslationsBuscadorEn._(_root);
	late final _TranslationsCategoriesEn categories = _TranslationsCategoriesEn._(_root);
	late final _TranslationsFromEn From = _TranslationsFromEn._(_root);
	late final _TranslationsChatEn chat = _TranslationsChatEn._(_root);
	late final _TranslationsCommentsEn comments = _TranslationsCommentsEn._(_root);
	late final _TranslationsReservaEn reserva = _TranslationsReservaEn._(_root);
	late final _TranslationsMySitesEn mySites = _TranslationsMySitesEn._(_root);
	late final _TranslationsReservasTodoEn reservas_todo = _TranslationsReservasTodoEn._(_root);
	late final _TranslationsOtrosEn otros = _TranslationsOtrosEn._(_root);
	late final _TranslationsSitioVisitadoEn sitioVisitado = _TranslationsSitioVisitadoEn._(_root);
	late final _TranslationsDScreenEn dScreen = _TranslationsDScreenEn._(_root);
	late final _TranslationsDashboardEn dashboard = _TranslationsDashboardEn._(_root);
	late final _TranslationsHabitacionDetailsEn habitacionDetails = _TranslationsHabitacionDetailsEn._(_root);
	late final _TranslationsComplementosEn complementos = _TranslationsComplementosEn._(_root);
	late final _TranslationsServiciosDetailsEn serviciosDetails = _TranslationsServiciosDetailsEn._(_root);
	late final _TranslationsShowHuespedEn showHuesped = _TranslationsShowHuespedEn._(_root);
	late final _TranslationsInferiorDetailsEn inferiorDetails = _TranslationsInferiorDetailsEn._(_root);
	late final _TranslationsServiciosEn servicios = _TranslationsServiciosEn._(_root);
	late final _TranslationsFromHabitacionEn from_habitacion = _TranslationsFromHabitacionEn._(_root);
	late final _TranslationsServiciosScreenEn serviciosScreen = _TranslationsServiciosScreenEn._(_root);
	late final _TranslationsFormularioSitioEn formularioSitio = _TranslationsFormularioSitioEn._(_root);
	late final _TranslationsPantallaUnoEn pantallaUno = _TranslationsPantallaUnoEn._(_root);
	late final _TranslationsPantallaDosEn pantallaDos = _TranslationsPantallaDosEn._(_root);
	late final _TranslationsPantallaTresEn pantallaTres = _TranslationsPantallaTresEn._(_root);
	late final _TranslationsPantallaCuatroEn pantallaCuatro = _TranslationsPantallaCuatroEn._(_root);
	late final _TranslationsActualizacionUnoEn actualizacionUno = _TranslationsActualizacionUnoEn._(_root);
	late final _TranslationsSearchEn search = _TranslationsSearchEn._(_root);
	late final _TranslationsIdentificacionClasesEn identificacionClases = _TranslationsIdentificacionClasesEn._(_root);
	late final _TranslationsPruebaEditEn pruebaEdit = _TranslationsPruebaEditEn._(_root);
	late final _TranslationsClasesEn clases = _TranslationsClasesEn._(_root);
	late final _TranslationsListaEn lista = _TranslationsListaEn._(_root);
	late final _TranslationsRegisterEn register = _TranslationsRegisterEn._(_root);
	late final _TranslationsPruebaTresEn pruebaTres = _TranslationsPruebaTresEn._(_root);
	late final _TranslationsMenuPdfEn menu_pdf = _TranslationsMenuPdfEn._(_root);
	late final _TranslationsPdfEn pdf = _TranslationsPdfEn._(_root);
	late final _TranslationsSplashScreenEn splashScreen = _TranslationsSplashScreenEn._(_root);
	late final _TranslationsInfoImportanteEn info_importante = _TranslationsInfoImportanteEn._(_root);
	late final _TranslationsCosasFaltantesEn cosas_faltantes = _TranslationsCosasFaltantesEn._(_root);
	late final _TranslationsModalInforEn modalInfor = _TranslationsModalInforEn._(_root);
	String get texts1 => 'Hello, in case you still don\'t know how to generate a reservation in our app, you can watch a video that we have generated for you so that you know more about our features.';
	String get textS => 'If you are registering a site for the first time, we invite you to watch the following video.';
	String get botonS => 'Watch the video';
	String get botonV => 'Go now to the video';
	String get administradorE => 'Administrator';
	String get usuarioE => 'User';
	String get pendienteE => 'Earring';
	String get finalizadoE => 'Finalized';
	String get huella1 => 'Please scan your fingerprint to confirm your reservation';
	String get huella2 => 'Please scan your fingerprint to access';
	String get voz1 => 'Please keep the button pressed while speaking. Once you\'ve finished, release it and press it again to log in';
	String get voz2 => 'Please hold down the button while speaking. Once you\'ve finished speaking, release it and press it again to make the reservation';
}

// Path: buscador
class _TranslationsBuscadorEn {
	_TranslationsBuscadorEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get Searchbyregion => 'Region';
	String get SouthAmerica => 'SOUTH AMERICA';
	String get NorthAmerica => 'NORTH AMERICA';
	String get CentralAmerica => 'CENTRAL AMERICA';
	String get Europe => 'EUROPE';
	String get Asia => 'ASIA';
	String get Africa => 'AFRICA';
	String get Oceania => 'OCEANIA';
	late final _TranslationsBuscadorStepEn Step = _TranslationsBuscadorStepEn._(_root);
	late final _TranslationsBuscadorStep2En Step2 = _TranslationsBuscadorStep2En._(_root);
	late final _TranslationsBuscadorCardEn card = _TranslationsBuscadorCardEn._(_root);
}

// Path: categories
class _TranslationsCategoriesEn {
	_TranslationsCategoriesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get questionCategorie => 'Do you want to delete this category?';
	String get questionCategorie2 => 'If you delete this category there is no going back. Are you sure about doing this operation?';
	String get cancel => 'Cancel';
	String get delete => 'Delete';
	String get categories => 'Categories';
	String get addCategory => 'Add Category';
	String get login => 'Login';
}

// Path: From
class _TranslationsFromEn {
	_TranslationsFromEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get category => 'Category';
	String get required => 'This field is required';
	String get loading => 'Loading';
	String get notIcon => 'No icon has been selected';
	String get summery => 'When you select an icon, please wait a moment while it uploads to our server.';
	String get save => 'Save';
	String get summery2 => 'When you select an image, please wait a moment while it uploads to our server. After successful upload, click the Save button located at the bottom of the form to make the changes.';
}

// Path: chat
class _TranslationsChatEn {
	_TranslationsChatEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get write => 'Write a message...';
	String get administrators => 'Administrators';
	String get hosts => 'Hosts';
	String get myGuests => 'My Guests';
	String get users => 'Users';
}

// Path: comments
class _TranslationsCommentsEn {
	_TranslationsCommentsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get site => 'Site';
	String get cleaning => 'Cleaning';
	String get communication => 'Communication';
	String get arrival => 'Arrival';
	String get reliability => 'Reliability';
	String get location => 'Location';
	String get price => 'Price';
	String get comment => 'Comment';
	late final _TranslationsCommentsQuestionEn question = _TranslationsCommentsQuestionEn._(_root);
	late final _TranslationsCommentsEditCommentEn editComment = _TranslationsCommentsEditCommentEn._(_root);
	late final _TranslationsCommentsCommentPageEn commentPage = _TranslationsCommentsCommentPageEn._(_root);
}

// Path: reserva
class _TranslationsReservaEn {
	_TranslationsReservaEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get payments => 'Payments received';
	String get site => 'Site';
	String get user => 'User';
	String get payDay => 'Pay Day';
	String get State => 'State';
	String get see => 'See';
	late final _TranslationsReservaSummeryEn summery = _TranslationsReservaSummeryEn._(_root);
	String get fullname => 'Full name';
	String get paymentDate => 'Payment Date';
	String get dateOfFiling => 'Date of filing';
	String get paymentMethod => 'Payment method';
	String get paymentStatus => 'Payment Status';
	String get entryDate => 'Entry Date';
	String get departureeDate => 'Departure Date';
	String get NumberOfGuests => 'Number of guests';
	String get NumberOfBabys => 'Number of Babys';
	String get NumberOfPets => 'Number of Pets';
	String get ReserveValue => 'Reserve Value';
	String get ValueGain => 'Value Gain';
	String get valueToReturn => 'Value to return';
	String get cerrar => 'Close';
	late final _TranslationsReservaReservaActivaEn reserva_activa = _TranslationsReservaReservaActivaEn._(_root);
	late final _TranslationsReservaReservaCanceladaEn reserva_cancelada = _TranslationsReservaReservaCanceladaEn._(_root);
	late final _TranslationsReservaReservaFinalizadaEn reserva_finalizada = _TranslationsReservaReservaFinalizadaEn._(_root);
}

// Path: mySites
class _TranslationsMySitesEn {
	_TranslationsMySitesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title2 => 'All sites';
	String get title => 'My sites';
	String categoria({required Object name}) => 'Category ${name}';
	String huespedes({required Object name}) => 'Guests ${name}';
	String noche({required Object name}) => '${name} nigth';
	late final _TranslationsMySitesQuestionEn question = _TranslationsMySitesQuestionEn._(_root);
	late final _TranslationsMySitesQuestion2En question2 = _TranslationsMySitesQuestion2En._(_root);
	late final _TranslationsMySitesQuestion3En question3 = _TranslationsMySitesQuestion3En._(_root);
	String get accept => 'Accept';
}

// Path: reservas_todo
class _TranslationsReservasTodoEn {
	_TranslationsReservasTodoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _TranslationsReservasTodoReservasCanceladasEn reservas_canceladas = _TranslationsReservasTodoReservasCanceladasEn._(_root);
	late final _TranslationsReservasTodoTotalDevolucionesEn totalDevoluciones = _TranslationsReservasTodoTotalDevolucionesEn._(_root);
	late final _TranslationsReservasTodoMultasEn multas = _TranslationsReservasTodoMultasEn._(_root);
	late final _TranslationsReservasTodoTotalPagosAnfEn totalPagosAnf = _TranslationsReservasTodoTotalPagosAnfEn._(_root);
	late final _TranslationsReservasTodoPagosTotalAnfEn pagosTotalAnf = _TranslationsReservasTodoPagosTotalAnfEn._(_root);
	late final _TranslationsReservasTodoUsuarioTotalPagoEn usuarioTotalPago = _TranslationsReservasTodoUsuarioTotalPagoEn._(_root);
	late final _TranslationsReservasTodoCancelacionReservaEn cancelacionReserva = _TranslationsReservasTodoCancelacionReservaEn._(_root);
	late final _TranslationsReservasTodoConfirmacionPago2En confirmacionPago2 = _TranslationsReservasTodoConfirmacionPago2En._(_root);
	late final _TranslationsReservasTodoMisMultasEn misMultas = _TranslationsReservasTodoMisMultasEn._(_root);
	late final _TranslationsReservasTodoMisDevolucionesEn misDevoluciones = _TranslationsReservasTodoMisDevolucionesEn._(_root);
	late final _TranslationsReservasTodoMisPagosEn misPagos = _TranslationsReservasTodoMisPagosEn._(_root);
	late final _TranslationsReservasTodoMisReservasActivasEn misReservasActivas = _TranslationsReservasTodoMisReservasActivasEn._(_root);
	late final _TranslationsReservasTodoActualizacionDevolucionesEn actualizacionDevoluciones = _TranslationsReservasTodoActualizacionDevolucionesEn._(_root);
	late final _TranslationsReservasTodoActualizacionPagoEn actualizacionPago = _TranslationsReservasTodoActualizacionPagoEn._(_root);
	late final _TranslationsReservasTodoReservasFinalizadasEn reservas_finalizadas = _TranslationsReservasTodoReservasFinalizadasEn._(_root);
	late final _TranslationsReservasTodoReservasPendientesEn reservas_pendientes = _TranslationsReservasTodoReservasPendientesEn._(_root);
	late final _TranslationsReservasTodoQuestionsEn questions = _TranslationsReservasTodoQuestionsEn._(_root);
	late final _TranslationsReservasTodoMisReservasCanceladasEn misReservasCanceladas = _TranslationsReservasTodoMisReservasCanceladasEn._(_root);
	late final _TranslationsReservasTodoMisReservasFinalizadasEn misReservasFinalizadas = _TranslationsReservasTodoMisReservasFinalizadasEn._(_root);
	late final _TranslationsReservasTodoMisReservasPendientesEn misReservasPendientes = _TranslationsReservasTodoMisReservasPendientesEn._(_root);
}

// Path: otros
class _TranslationsOtrosEn {
	_TranslationsOtrosEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _TranslationsOtrosCardsEn cards = _TranslationsOtrosCardsEn._(_root);
	late final _TranslationsOtrosFavoriteEn favorite = _TranslationsOtrosFavoriteEn._(_root);
}

// Path: sitioVisitado
class _TranslationsSitioVisitadoEn {
	_TranslationsSitioVisitadoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Visited Sites';
}

// Path: dScreen
class _TranslationsDScreenEn {
	_TranslationsDScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get pAnfitrion => 'Host Panel';
	String get pAdmin => 'Administrator Panel';
}

// Path: dashboard
class _TranslationsDashboardEn {
	_TranslationsDashboardEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get inicio => 'Home';
	String get perfil => 'Update Data';
	String get categorias => 'Categories';
	String get comentario => 'Comments';
	String get chats => 'My Chats';
	String get sitio => 'New Site';
	String get claro => 'Light Mode';
	String get oscuro => 'Dark Mode';
	String get sesion => 'Logout';
}

// Path: habitacionDetails
class _TranslationsHabitacionDetailsEn {
	_TranslationsHabitacionDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Where are you going to sleep?';
}

// Path: complementos
class _TranslationsComplementosEn {
	_TranslationsComplementosEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get share => 'share';
	String get favorites => 'Favorites';
	late final _TranslationsComplementosQuestionEn question = _TranslationsComplementosQuestionEn._(_root);
	late final _TranslationsComplementosQuestion2En question2 = _TranslationsComplementosQuestion2En._(_root);
	String get telefono => 'Enter the phone number';
	String get required => 'This field is required';
	late final _TranslationsComplementosSummeryEn summery = _TranslationsComplementosSummeryEn._(_root);
	String get send => 'Send';
	String get seeAllPhotos => 'See all Photographies';
	String get goTo => 'Where you go';
	String get searchLocation => 'Search location';
	String get location => 'Location';
	String get home => 'Home';
	String get night => 'Night';
	String get arrive => 'Arrived';
	String get exit => 'Exit';
	String get clearnCOst => 'Cleaning fee';
	String get payAndConfirm => 'Confirm and pay';
	String get info => 'Information about your trip';
	String get yourTotal => 'Your total';
	String get confirm => 'Confirm payment';
	String get totalCOP => 'Total (COP)';
	String get guest => 'Guests';
}

// Path: serviciosDetails
class _TranslationsServiciosDetailsEn {
	_TranslationsServiciosDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String summery({required Object name}) => 'Show ${name} services';
	String get ofrece => 'What this place offers';
}

// Path: showHuesped
class _TranslationsShowHuespedEn {
	_TranslationsShowHuespedEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get adults => 'Adults';
	String get age => 'Age 13 years or older';
	String get children => 'Children';
	String get from => 'From 2 to 12 years';
	String get babys => 'Babys';
	String get less => 'less than 2 years';
	String get pets => 'Pets';
	String get save => 'Save';
}

// Path: inferiorDetails
class _TranslationsInferiorDetailsEn {
	_TranslationsInferiorDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get rules => 'House Rules';
	String get securityAndPrivacy => 'Security and privacy';
	String get polices => 'Cancellation policies';
	String get reglasSitio => 'Site rules';
	String get seguridad => 'Security and site ownership';
	String get cancelacion => 'Free cancellation for 48 hours';
}

// Path: servicios
class _TranslationsServiciosEn {
	_TranslationsServiciosEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get wifi => 'Wifi';
	String get piscina => 'Piscina';
	late final _TranslationsServiciosKitchenEn kitchen = _TranslationsServiciosKitchenEn._(_root);
	String get jacuzzi => 'Jacuzzi';
	String get bodySoap => 'Body soap';
	String get shampoo => 'Shampoo';
	String get shocked_Refrigerator => 'Assorted refrigerator';
	String get assorted_Minibar => 'Assorted minibar';
	String get microwave => 'Microwave';
	String get grill => 'Grill';
	String get coffee_Maker => 'Coffee maker';
	String get autonomous_Entry => 'Autonomous entry';
	String get hot_Water => 'Hot water';
	String get air_conditioning => 'Air conditioning';
	String get washer_Dryer => 'Washer dryer';
	String get television_or_cable => 'Television or cable';
	String get chimney => 'Chimney';
	String get parking_lot => 'Parking lot';
	String get good_lighting => 'Good lighting';
	late final _TranslationsServiciosOtroEn otro = _TranslationsServiciosOtroEn._(_root);
	String get office_supplies => 'Office supplies';
	String get security_cameras => 'Security cameras on the property';
	String get luggage_storage => 'Luggage storage';
	String get towel_per_guest => 'Towel per guest';
	String get pillow_per_guest => 'Pillow per guest';
	String get bed_sheets => 'Bed sheets for each bed';
	String get cleaning_products => 'Cleaning products';
	String get bedding => 'Bedding';
	String get equipped_kitchen => 'Equipped kitchen';
	String get hair_dryer => 'Hair dryer';
	String get iron_and_board => 'Iron and board';
	String get smoke_detector => 'Smoke detector';
	String get carbon_monoxide_detector => 'Carbon monoxide detector';
	String get fire_extinguisher => 'Fire extinguisher';
	String get first_aid_kit => 'First aid kit';
	String get child_seat => 'Child seat';
	String get board_games => 'Board games';
	String get free_bicycles => 'Free bicycles';
	String get gym => 'Gym';
	String get sauna => 'Sauna';
	String get patio_or_terrace => 'Patio or terrace';
	String get daily_cleaning_service => 'Daily cleaning service';
	String get lake_view => 'Lake view';
	String get ocean_view => 'Ocean view';
	String get safe_box => 'Safe box';
	String get concierge_service => 'Concierge service';
	late final _TranslationsServiciosTwoEn two = _TranslationsServiciosTwoEn._(_root);
	String get car_rental => 'Car rental';
	String get local_tour_guide => 'Local tour guide';
	String get babysitting_service => 'Babysitting service';
	String get musical_instruments => 'Musical instruments';
	String get customized_tours => 'Customized tours';
	late final _TranslationsServiciosThreeEn three = _TranslationsServiciosThreeEn._(_root);
	String get crib => 'Crib';
	String get catering_services => 'Catering services';
	String get sound_system => 'Sound system';
	String get streaming_service => 'Streaming service';
	String get welcome_kit => 'Welcome kit';
	String get boat_service => 'Boat service';
	String get restaurant_discounts => 'Restaurant discounts';
}

// Path: from_habitacion
class _TranslationsFromHabitacionEn {
	_TranslationsFromHabitacionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Title';
	String get required => 'This field is required';
	String get description => 'Description';
	String get add => 'Add room';
	String get save => 'Save Rooms';
}

// Path: serviciosScreen
class _TranslationsServiciosScreenEn {
	_TranslationsServiciosScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get select => 'Select your services';
	String get description => 'Below, you will find several services. Select those that your property offers. At the bottom of this list, you will find a button in which you will save the selected services to our server.';
	String get save => 'Save Services';
}

// Path: formularioSitio
class _TranslationsFormularioSitioEn {
	_TranslationsFormularioSitioEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get save => 'Save';
	String get Continue => 'Continue';
	String get loading => 'Loading';
}

// Path: pantallaUno
class _TranslationsPantallaUnoEn {
	_TranslationsPantallaUnoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get Agrega_tu_Sitio => 'Add Your Site';
	String get Categoria => 'Category';
	String get Titulo_del_sitio => 'Site Title';
	String get Se_requiere_de_este_campo => 'This Field is Required';
	String get Numero_de_Huespedes => 'Number of Guests';
	String get Numero_de_Camas => 'Number of Beds';
	String get Numero_de_Banos => 'Number of Bathrooms';
	String get Descripcion => 'Description';
}

// Path: pantallaDos
class _TranslationsPantallaDosEn {
	_TranslationsPantallaDosEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get america_del_sur => 'South America';
	String get america_del_norte => 'North America';
	String get centro_america => 'Central America';
	String get europa => 'Europe';
	String get asia => 'Asia';
	String get africa => 'Africa';
	String get oceania => 'Oceania';
	String get valor_noche => 'Nightly Rate';
	String get se_requiere_de_este_campo => 'This field is required';
	String get lugar => 'Location';
	String get descripcion_del_lugar => 'Location Description';
	String get continente => 'Continent';
	String get text => 'We need the latitude and longitude of your property as we manage a map that will show your future guests the exact location. You can find this data on Google Maps or on your preferred location app.';
	String get longitud => 'Longitude';
	String get latitud => 'Latitude';
}

// Path: pantallaTres
class _TranslationsPantallaTresEn {
	_TranslationsPantallaTresEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get valor_limpieza => 'Cleaning value';
	String get se_requiere_de_este_campo => 'This field is required';
	String get texts1 => 'Clicking on the rooms field will display a button. Use it to add the title and a description about the room you\'re about to add.';
	String get habitaciones => 'Rooms';
	String get agregar => 'Add';
	String get aceptar_terminos_y_condiciones => 'Accept Terms and Conditions';
	String get texts2 => 'To access our terms and conditions, please click on the following button';
	String get terminos_y_condiciones => 'Terms and Conditions';
	String get anadir_imagenes => 'Add Images';
	String get anadir_mas => 'Add More';
	String get texts3 => 'After selecting your images, click on the upload icon to save them to our server. This process may take time depending on the number of images you\'re uploading.';
}

// Path: pantallaCuatro
class _TranslationsPantallaCuatroEn {
	_TranslationsPantallaCuatroEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get siteRules => 'Site rules';
	String get rules => 'Rules';
	String get required => 'This field is required';
	String get siteSecurity => 'Site security';
	String get security => 'Security';
}

// Path: actualizacionUno
class _TranslationsActualizacionUnoEn {
	_TranslationsActualizacionUnoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get actualiza_tu_sitio => 'Update Your Site';
	String get title => 'Title';
	String get descripcion_del_sitio => 'Site Description';
	String get numero_de_huespedes => 'Number of Guests';
	String get valor_noche => 'Nightly Rate';
	String get descripcion_del_lugar => 'Location Description';
	String get texts1 => 'We need the latitude and longitude of your property as we manage a map that will show your future guests the exact location. You can find this data on Google Maps or on your preferred location app.';
	String get latitud => 'Latitude';
	String get longitud => 'Longitude';
	String get valor_de_la_limpieza => 'Cleaning Fee';
	String get guardar => 'Save';
}

// Path: search
class _TranslationsSearchEn {
	_TranslationsSearchEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get spanish => 'Spanish';
	String get english => 'English';
	String get login => 'Login';
	String get close => 'Close';
}

// Path: identificacionClases
class _TranslationsIdentificacionClasesEn {
	_TranslationsIdentificacionClasesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get error_al_verificar_credenciales => 'Error verifying credentials.';
	String get cerrar => 'Close';
	String get iniciar_sesion => 'Log in';
	String get viaja_con_estilo_destinos_de_ensueno_a_tu_alcance => 'Travel in Style, Dream Destinations Within Your Reach';
	String get diga_la_siguiente_palabra => 'Say the following word:';
	String get texts1 => 'Discover unexplored destinations, live unique experiences, and create memories that will last a lifetime. Join the traveler community and make your travel dreams come true!';
	String get authentication => 'Authentication';
	String get password => 'Change of password';
	String get message => 'Your password has been changed successfully!';
	String get accept => 'Accept';
	String get email => 'E-mail';
	String get pass => 'Password';
	String get forgot => 'Forgot password?';
}

// Path: pruebaEdit
class _TranslationsPruebaEditEn {
	_TranslationsPruebaEditEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get actualizar_datos => 'Update Data';
	String get texts1 => 'Update your data and don\'t miss the opportunity to enjoy the best vacation of your life! Do it now and live the experience to the fullest!';
	String get telefono => 'Phone';
	String get se_requiere_de_un_numero_de_telefono => 'A phone number is required';
	String get idioma => 'Language';
	String get quieres_agregar_una_descripcion => 'Would you like to add a description?';
	String get descripcion => 'Description';
	String get nombre_completo => 'Full Name';
	String get tipo_de_documento => 'Document Type';
	String get numero_de_documento => 'Document Number';
	String get texts2 => 'You will register as a user and host. We request your bank details to make the respective payments in case you offer a rental site. Also, in case of canceling a reservation, this information will help us make the respective refund of your money.';
	String get bank => 'Bank';
	String get numero_de_daviplata => 'Daviplata Number';
	String get contrasena => 'Password';
	String get confirmacion_de_contrasena => 'Password Confirmation';
	String get cambiar_contrasena => 'Change Password';
	String get telefono_celular => 'Cell Phone';
	String get seleccionar_foto_de_perfil => 'Select Profile Picture';
	String get listo => 'Done';
	String get cargando => 'Loading';
	String get texts3 => 'When you select your profile picture, please wait a moment while it loads on our server. Be sure to scroll to the bottom of this form and save the changes for the new profile picture to be applied correctly. If you do not complete this step, the selected image will not be saved as your new profile picture.';
}

// Path: clases
class _TranslationsClasesEn {
	_TranslationsClasesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get singnIn => 'Sign In';
	String get singUp => 'Sign Up';
}

// Path: lista
class _TranslationsListaEn {
	_TranslationsListaEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get cc => 'Citizenship card';
	String get ce => 'Foreigner ID';
	String get pass => 'Passport';
	String get nit => 'Tax identification number';
	late final _TranslationsListaBanksEn banks = _TranslationsListaBanksEn._(_root);
}

// Path: register
class _TranslationsRegisterEn {
	_TranslationsRegisterEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get register => 'Register';
	String get text1 => 'What are you waiting for to register? Don\'t hold back from enjoying the best vacation of your life!';
	String get tel => 'Phone';
	String get requiredPhone => 'A phone number is required';
	String get lenguaje => 'Language';
}

// Path: pruebaTres
class _TranslationsPruebaTresEn {
	_TranslationsPruebaTresEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get sing_up => 'Sign Up';
	String get text1 => 'You will register as a user and host. We request your bank details to make the respective payments in case you offer a rental site. Also, in case of canceling a reservation, this information will help us make the respective refund of your money.';
	String get bank => 'Bank';
	String get daviplata => 'Daviplata Number';
	String get contrasena_incorrecta => 'Incorrect password';
}

// Path: menu_pdf
class _TranslationsMenuPdfEn {
	_TranslationsMenuPdfEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text1 => 'Document printed successfully';
	String get text2 => 'Document shared successfully';
}

// Path: pdf
class _TranslationsPdfEn {
	_TranslationsPdfEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get factura => 'StayAway invoice';
	String get information => 'StayAway Information';
	String telefono({required Object name}) => 'Phone: ${name}';
	String nombre_del_sitio({required Object name}) => 'Site name: ${name}';
	String nombre_del_cliente({required Object name}) => 'Client name: ${name}';
	String documento({required Object name}) => 'Document: ${name}';
	String get informacion_reserva => 'Information about your reservation';
}

// Path: splashScreen
class _TranslationsSplashScreenEn {
	_TranslationsSplashScreenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _TranslationsSplashScreenExploraElMundoEn explora_el_Mundo = _TranslationsSplashScreenExploraElMundoEn._(_root);
	late final _TranslationsSplashScreenViajaConEstiloEn viaja_con_Estilo = _TranslationsSplashScreenViajaConEstiloEn._(_root);
	late final _TranslationsSplashScreenRutasSecretasEn rutas_Secretas = _TranslationsSplashScreenRutasSecretasEn._(_root);
	late final _TranslationsSplashScreenPlanificaTuEscapeEn planifica_Tu_Escape = _TranslationsSplashScreenPlanificaTuEscapeEn._(_root);
	late final _TranslationsSplashScreenViajarTransformaEn viajar_Transforma = _TranslationsSplashScreenViajarTransformaEn._(_root);
	String get skip => 'Skip';
}

// Path: info_importante
class _TranslationsInfoImportanteEn {
	_TranslationsInfoImportanteEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _TranslationsInfoImportanteQuestionEn question = _TranslationsInfoImportanteQuestionEn._(_root);
	late final _TranslationsInfoImportanteQuestion2En question2 = _TranslationsInfoImportanteQuestion2En._(_root);
}

// Path: cosas_faltantes
class _TranslationsCosasFaltantesEn {
	_TranslationsCosasFaltantesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get reset => 'Reiniciar';
	String get select => 'Select Icon';
	String get selectImage => 'Select Image';
	late final _TranslationsCosasFaltantesRolesEn roles = _TranslationsCosasFaltantesRolesEn._(_root);
	String info({required Object date1, required Object date2}) => 'The following dates from ${date1} to ${date2} are reserved';
	late final _TranslationsCosasFaltantesAlertEn alert = _TranslationsCosasFaltantesAlertEn._(_root);
	String get all => 'All users';
	String get name => 'Name';
	String get mail => 'Mail';
	String get rol => 'Role';
	String get update => 'Update rol';
	String get number => 'Account number';
	String get date => 'Registration date';
	late final _TranslationsCosasFaltantesQuestionsEn questions = _TranslationsCosasFaltantesQuestionsEn._(_root);
	late final _TranslationsCosasFaltantesDetailsEn details = _TranslationsCosasFaltantesDetailsEn._(_root);
	String get disponibilidad => 'Availability';
	String get summery => 'There are no comments available';
	String get add => 'Add comments';
	String get send => 'Send comment';
	String noche({required Object name}) => '${name} nigths';
	String get modalText => 'About this space';
	String get showMore => 'Show More >';
}

// Path: modalInfor
class _TranslationsModalInforEn {
	_TranslationsModalInforEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get texts => 'Before continuing, check that all fields are correct.';
}

// Path: buscador.Step
class _TranslationsBuscadorStepEn {
	_TranslationsBuscadorStepEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get Date => 'Dates';
	String get ArrivalDate => 'Arrival date';
	String get DepartureDate => 'Departure date';
}

// Path: buscador.Step2
class _TranslationsBuscadorStep2En {
	_TranslationsBuscadorStep2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get NumberOfGuests => 'Guests';
	String get EnterNumberOfGuests => 'Enter the number of guests';
	String get LookFor => 'Look for';
	String get Following => 'Following';
	String get Back => 'Back';
}

// Path: buscador.card
class _TranslationsBuscadorCardEn {
	_TranslationsBuscadorCardEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get adults => 'Adults';
	String get age => 'Age 13 years or older';
	String get children => 'Children';
	String get from2 => 'From 2 to 12 years';
	String get babys => 'Babys';
	String get less => 'less than 2 years';
	String get Pets => 'Pets';
	String get save => 'Save';
}

// Path: comments.question
class _TranslationsCommentsQuestionEn {
	_TranslationsCommentsQuestionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get question1 => 'Do you want to delete this comment?';
	String get question2 => 'If you delete this comment there is no going back. Are you sure about doing this operation?';
}

// Path: comments.editComment
class _TranslationsCommentsEditCommentEn {
	_TranslationsCommentsEditCommentEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final _TranslationsCommentsEditCommentOneEn one = _TranslationsCommentsEditCommentOneEn._(_root);
	late final _TranslationsCommentsEditCommentEleccionEn eleccion = _TranslationsCommentsEditCommentEleccionEn._(_root);
	late final _TranslationsCommentsEditCommentTwoEn two = _TranslationsCommentsEditCommentTwoEn._(_root);
	late final _TranslationsCommentsEditCommentThreeEn three = _TranslationsCommentsEditCommentThreeEn._(_root);
	late final _TranslationsCommentsEditCommentFourEn four = _TranslationsCommentsEditCommentFourEn._(_root);
	late final _TranslationsCommentsEditCommentFiveEn five = _TranslationsCommentsEditCommentFiveEn._(_root);
	late final _TranslationsCommentsEditCommentSixEn six = _TranslationsCommentsEditCommentSixEn._(_root);
	late final _TranslationsCommentsEditCommentSevenEn seven = _TranslationsCommentsEditCommentSevenEn._(_root);
	String get boton => 'Edit Comment';
}

// Path: comments.commentPage
class _TranslationsCommentsCommentPageEn {
	_TranslationsCommentsCommentPageEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get comments => 'Comments';
	String get myComments => 'My comments';
	String get comments2 => 'Comments on my sites';
	String get allComments => 'All comments';
}

// Path: reserva.summery
class _TranslationsReservaSummeryEn {
	_TranslationsReservaSummeryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text1 => 'You received a payment for a reservation with the following information: \n';
	String nameSite({required Object name}) => 'Site name: ${name}\n';
	String location({required Object name}) => 'Location: ${name}\n';
	String checkInDate({required Object name}) => 'Check in date: ${name}\n';
	String checkOut({required Object name}) => 'Check-out: ${name}';
	String paymentMethod({required Object name}) => 'Payment method: ${name}\n';
	String paymentDate({required Object name}) => 'Payment Date: ${name}\n';
	String total({required Object name}) => 'Total number of guests: ${name}';
	String totalPrice({required Object name}) => 'Total price of the stay: ${name}';
}

// Path: reserva.reserva_activa
class _TranslationsReservaReservaActivaEn {
	_TranslationsReservaReservaActivaEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Active reservations for my sites';
	String get date => 'Date';
	String get fechaReserva => 'Reservation date';
	String get numeroAdultos => 'Number of Adults';
	String get numeroNinhos => 'Number of Children';
	String get fechallegada => 'arrival date';
}

// Path: reserva.reserva_cancelada
class _TranslationsReservaReservaCanceladaEn {
	_TranslationsReservaReservaCanceladaEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Canceled reservations from my sites';
}

// Path: reserva.reserva_finalizada
class _TranslationsReservaReservaFinalizadaEn {
	_TranslationsReservaReservaFinalizadaEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Completed reservations for my sites';
}

// Path: mySites.question
class _TranslationsMySitesQuestionEn {
	_TranslationsMySitesQuestionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get one => 'Are there active reservations for this site?';
	String get contenedor => 'There are active reservations linked to this site; It will be necessary to wait for them to finish or be cancelled.';
}

// Path: mySites.question2
class _TranslationsMySitesQuestion2En {
	_TranslationsMySitesQuestion2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get one => 'Do you want to perform this action?';
	String get contenedor => 'To carry out this action, you must log in first.';
}

// Path: mySites.question3
class _TranslationsMySitesQuestion3En {
	_TranslationsMySitesQuestion3En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get one => 'Do you want to delete this site?';
	String get contenedor => 'If you delete this site there is no going back. Are you sure about doing this operation?';
}

// Path: reservas_todo.reservas_canceladas
class _TranslationsReservasTodoReservasCanceladasEn {
	_TranslationsReservasTodoReservasCanceladasEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'All reservations canceled';
	late final _TranslationsReservasTodoReservasCanceladasSummeryEn summery = _TranslationsReservasTodoReservasCanceladasSummeryEn._(_root);
}

// Path: reservas_todo.totalDevoluciones
class _TranslationsReservasTodoTotalDevolucionesEn {
	_TranslationsReservasTodoTotalDevolucionesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Reservation Return';
	String get upload_status => 'State upload';
	late final _TranslationsReservasTodoTotalDevolucionesSummeryEn summery = _TranslationsReservasTodoTotalDevolucionesSummeryEn._(_root);
}

// Path: reservas_todo.multas
class _TranslationsReservasTodoMultasEn {
	_TranslationsReservasTodoMultasEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get fines => 'Fines';
	String get booking => 'Booking';
	String get value => 'Value';
	late final _TranslationsReservasTodoMultasSummeryEn summery = _TranslationsReservasTodoMultasSummeryEn._(_root);
	String get fineValue => 'Fine value';
	String get returnValue => 'Return value';
}

// Path: reservas_todo.totalPagosAnf
class _TranslationsReservasTodoTotalPagosAnfEn {
	_TranslationsReservasTodoTotalPagosAnfEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'All payments made to hosts';
}

// Path: reservas_todo.pagosTotalAnf
class _TranslationsReservasTodoPagosTotalAnfEn {
	_TranslationsReservasTodoPagosTotalAnfEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'All payments made to hosts';
}

// Path: reservas_todo.usuarioTotalPago
class _TranslationsReservasTodoUsuarioTotalPagoEn {
	_TranslationsReservasTodoUsuarioTotalPagoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Reservation Payments';
	late final _TranslationsReservasTodoUsuarioTotalPagoSummeryEn summery = _TranslationsReservasTodoUsuarioTotalPagoSummeryEn._(_root);
}

// Path: reservas_todo.cancelacionReserva
class _TranslationsReservasTodoCancelacionReservaEn {
	_TranslationsReservasTodoCancelacionReservaEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get question1 => 'Do you want to cancel this reservation?';
	String get summery => 'If you decide to cancel this reservation, a penalty may apply if cancellation is made after 48 hours. Are you sure about doing this operation?';
}

// Path: reservas_todo.confirmacionPago2
class _TranslationsReservasTodoConfirmacionPago2En {
	_TranslationsReservasTodoConfirmacionPago2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Reservation information';
	String get summery1 => 'Next, look at the information of the site you are ordering from before making payment.';
	String get siteName => 'Name of the site';
	String get location => 'Location';
	String guest({required Object name}) => '${name} Guest';
	String get totalCost => 'Total cost';
	String get qrCode => 'QR Code';
	String get summery2 => 'At this time, your reservation is in pending status. If you want it to be activated, please make payment via the QR code above within 48 hours. After this, when your reservation is activated, the host\'s contact will appear in our online chat to finalize details and ensure you can enjoy your stay.';
}

// Path: reservas_todo.misMultas
class _TranslationsReservasTodoMisMultasEn {
	_TranslationsReservasTodoMisMultasEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My fines';
	late final _TranslationsReservasTodoMisMultasSummeryEn summery = _TranslationsReservasTodoMisMultasSummeryEn._(_root);
}

// Path: reservas_todo.misDevoluciones
class _TranslationsReservasTodoMisDevolucionesEn {
	_TranslationsReservasTodoMisDevolucionesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My returns';
}

// Path: reservas_todo.misPagos
class _TranslationsReservasTodoMisPagosEn {
	_TranslationsReservasTodoMisPagosEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My payments';
}

// Path: reservas_todo.misReservasActivas
class _TranslationsReservasTodoMisReservasActivasEn {
	_TranslationsReservasTodoMisReservasActivasEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My active reservations';
	String get title2 => 'All active reservations';
	late final _TranslationsReservasTodoMisReservasActivasSummeryEn summery = _TranslationsReservasTodoMisReservasActivasSummeryEn._(_root);
}

// Path: reservas_todo.actualizacionDevoluciones
class _TranslationsReservasTodoActualizacionDevolucionesEn {
	_TranslationsReservasTodoActualizacionDevolucionesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Returns update';
	String get status => 'Status: ';
	String get cancel => 'Cancel';
	String get save => 'Save';
}

// Path: reservas_todo.actualizacionPago
class _TranslationsReservasTodoActualizacionPagoEn {
	_TranslationsReservasTodoActualizacionPagoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Host Payment Update';
}

// Path: reservas_todo.reservas_finalizadas
class _TranslationsReservasTodoReservasFinalizadasEn {
	_TranslationsReservasTodoReservasFinalizadasEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'All reservations finalized';
	late final _TranslationsReservasTodoReservasFinalizadasSummeryEn summery = _TranslationsReservasTodoReservasFinalizadasSummeryEn._(_root);
}

// Path: reservas_todo.reservas_pendientes
class _TranslationsReservasTodoReservasPendientesEn {
	_TranslationsReservasTodoReservasPendientesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'All pending reservations';
	String get activate => 'Activate';
	String get delete => 'Delete';
	late final _TranslationsReservasTodoReservasPendientesSummeryEn summery = _TranslationsReservasTodoReservasPendientesSummeryEn._(_root);
}

// Path: reservas_todo.questions
class _TranslationsReservasTodoQuestionsEn {
	_TranslationsReservasTodoQuestionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get one => 'Do you want to delete this reservation?';
	String get comment => 'If you delete this reservation there is no going back. Are you sure about doing this operation?';
}

// Path: reservas_todo.misReservasCanceladas
class _TranslationsReservasTodoMisReservasCanceladasEn {
	_TranslationsReservasTodoMisReservasCanceladasEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My canceled reservations';
	late final _TranslationsReservasTodoMisReservasCanceladasSummeryEn summery = _TranslationsReservasTodoMisReservasCanceladasSummeryEn._(_root);
}

// Path: reservas_todo.misReservasFinalizadas
class _TranslationsReservasTodoMisReservasFinalizadasEn {
	_TranslationsReservasTodoMisReservasFinalizadasEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My finalized reservations';
	late final _TranslationsReservasTodoMisReservasFinalizadasSummeryEn summery = _TranslationsReservasTodoMisReservasFinalizadasSummeryEn._(_root);
}

// Path: reservas_todo.misReservasPendientes
class _TranslationsReservasTodoMisReservasPendientesEn {
	_TranslationsReservasTodoMisReservasPendientesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'My pending reservations';
	late final _TranslationsReservasTodoMisReservasPendientesSummeryEn summery = _TranslationsReservasTodoMisReservasPendientesSummeryEn._(_root);
	String get pay => 'pay';
	String get delete => 'Delete';
}

// Path: otros.cards
class _TranslationsOtrosCardsEn {
	_TranslationsOtrosCardsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'User panel';
	String get misReservas => 'My reservations';
	String get reservasActivas => 'Active reservations';
	String get reservasCancelas => 'Canceled reservations';
	String get reservasFinalizadas => 'Reservations completed';
	String get total => 'Total';
}

// Path: otros.favorite
class _TranslationsOtrosFavoriteEn {
	_TranslationsOtrosFavoriteEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Favorite sites';
}

// Path: complementos.question
class _TranslationsComplementosQuestionEn {
	_TranslationsComplementosQuestionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get one => 'Do you want to perform this action?';
	String get summery => 'To carry out this action, you must log in first.';
}

// Path: complementos.question2
class _TranslationsComplementosQuestion2En {
	_TranslationsComplementosQuestion2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get one => 'Do you want to share information about the site?';
	String get summery => 'Next you can enter the WhatsApp number of the person to whom you want to share the information on the site.';
}

// Path: complementos.summery
class _TranslationsComplementosSummeryEn {
	_TranslationsComplementosSummeryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String one({required Object name}) => 'The site is called ${name}\n';
	String two({required Object name}) => 'It has an excellent location in ${name} \n';
	String three({required Object name}) => 'it has a capacity for ${name} ';
	String four({required Object name}) => 'guests and its price is very affordable with a cost of ${name} per night. What are you waiting for to book it!';
}

// Path: servicios.kitchen
class _TranslationsServiciosKitchenEn {
	_TranslationsServiciosKitchenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Kitchen';
	String get text => 'Guests can cook in this space';
}

// Path: servicios.otro
class _TranslationsServiciosOtroEn {
	_TranslationsServiciosOtroEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get area_to_work => 'Area para trabajar';
	String get text => 'in a shared area';
}

// Path: servicios.two
class _TranslationsServiciosTwoEn {
	_TranslationsServiciosTwoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get pets_allowed => 'Pets allowed';
	String get no_assistance_animal_restrictions => 'No restrictions regarding assistance animals';
}

// Path: servicios.three
class _TranslationsServiciosThreeEn {
	_TranslationsServiciosThreeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get private_garden => 'Private garden';
	String get open_space => 'Open space generally covered in grass';
}

// Path: lista.banks
class _TranslationsListaBanksEn {
	_TranslationsListaBanksEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get one => 'BANCOLOMBIA';
	String get two => 'Bank of Bogota';
	String get three => 'Social housing Bank';
	String get four => 'Av Villas';
	String get five => 'Western Bank';
	String get six => 'Popular Bank';
	String get seven => 'Agrarian Bank';
	String get eight => 'Davivienda';
	String get nine => 'Colpatria';
}

// Path: splashScreen.explora_el_Mundo
class _TranslationsSplashScreenExploraElMundoEn {
	_TranslationsSplashScreenExploraElMundoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Explore the World';
	String get description => 'Discover unexplored destinations, live unique experiences, and create memories that will last a lifetime. Join the travel community and make your travel dreams come true!';
}

// Path: splashScreen.viaja_con_Estilo
class _TranslationsSplashScreenViajaConEstiloEn {
	_TranslationsSplashScreenViajaConEstiloEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Travel in Style';
	String get description => 'From paradisiacal beaches to exciting metropolises, find inspiration for your next trip and discover exclusive deals that will make your journey unforgettable.';
}

// Path: splashScreen.rutas_Secretas
class _TranslationsSplashScreenRutasSecretasEn {
	_TranslationsSplashScreenRutasSecretasEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Secret Routes';
	String get description => 'Are you looking for authentic adventures? Navigate through our secret routes and uncover the hidden treasures that only the most intrepid travelers know.';
}

// Path: splashScreen.planifica_Tu_Escape
class _TranslationsSplashScreenPlanificaTuEscapeEn {
	_TranslationsSplashScreenPlanificaTuEscapeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Plan Your Escape';
	String get description => 'Whether it\'s a weekend getaway or a dream trip, our app will help you plan the perfect escape. Let the adventure begin!';
}

// Path: splashScreen.viajar_Transforma
class _TranslationsSplashScreenViajarTransformaEn {
	_TranslationsSplashScreenViajarTransformaEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Travel Transforms';
	String get description => 'Travel not only changes your destinations, it also changes your perspective. Join our global community of travelers and discover how travel can transform your life.';
}

// Path: info_importante.question
class _TranslationsInfoImportanteQuestionEn {
	_TranslationsInfoImportanteQuestionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Important Information to Consider';
	String text({required Object name}) => 'Before proceeding with your reservation, you must select the number of guests. Remember that they must not exceed the number of guests allowed by the site host. In this case, the maximum number of guests is ${name}';
}

// Path: info_importante.question2
class _TranslationsInfoImportanteQuestion2En {
	_TranslationsInfoImportanteQuestion2En._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String text({required Object name, required Object name2}) => 'Before continuing with your reservation, please select the check-in and check-out dates. The currently registered dates are from ${name} to ${name2}. To continue, you must change these dates to the ones you wish to book for your trip.';
}

// Path: cosas_faltantes.roles
class _TranslationsCosasFaltantesRolesEn {
	_TranslationsCosasFaltantesRolesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text => 'Change of role in the application';
	String get user => 'User';
	String get admin => 'Admin';
}

// Path: cosas_faltantes.alert
class _TranslationsCosasFaltantesAlertEn {
	_TranslationsCosasFaltantesAlertEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Password recovery';
	String text({required Object email}) => 'An email was sent to the account ${email}';
	String get text2 => 'Enter your email to reset your password';
	String get text3 => 'Restore password';
}

// Path: cosas_faltantes.questions
class _TranslationsCosasFaltantesQuestionsEn {
	_TranslationsCosasFaltantesQuestionsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get one => 'Do you want to delete this user?';
	String get summery => 'If you delete this user there is no going back. Are you sure about doing this operation?';
}

// Path: cosas_faltantes.details
class _TranslationsCosasFaltantesDetailsEn {
	_TranslationsCosasFaltantesDetailsEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String guests({required Object name}) => '${name} guests';
	String rooms({required Object name}) => '${name} Rooms';
	String beds({required Object name}) => '${name} Bads';
	String Bathrooms({required Object name}) => '${name} Bathrooms';
	String text({required Object fecha}) => 'Registration on: ${fecha}';
	String get info => 'See information';
	String get info2 => 'Host Information';
	String anfi({required Object name}) => 'Host: ${name}';
	String get contact => 'Contact';
	String get tel => 'Landline';
}

// Path: comments.editComment.one
class _TranslationsCommentsEditCommentOneEn {
	_TranslationsCommentsEditCommentOneEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get question1 => 'How was the cleanliness of the place?';
	String get question2 => 'Did you have any problems?';
	String get comment => 'Tell us your problem';
}

// Path: comments.editComment.eleccion
class _TranslationsCommentsEditCommentEleccionEn {
	_TranslationsCommentsEditCommentEleccionEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get veryBad => 'Very bad';
	String get bad => 'Bad';
	String get basic => 'Basic';
	String get good => 'Good';
	String get Excellent => 'Excellent';
}

// Path: comments.editComment.two
class _TranslationsCommentsEditCommentTwoEn {
	_TranslationsCommentsEditCommentTwoEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get question1 => 'How was your communication with the host of the place?';
}

// Path: comments.editComment.three
class _TranslationsCommentsEditCommentThreeEn {
	_TranslationsCommentsEditCommentThreeEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get question1 => 'Rate your arrival at the place?';
	String get question2 => 'What happened to you? !Tell us!';
}

// Path: comments.editComment.four
class _TranslationsCommentsEditCommentFourEn {
	_TranslationsCommentsEditCommentFourEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get question1 => 'Did it meet your expectations?';
	String get question2 => 'Why didn\'t I meet your expectations?';
}

// Path: comments.editComment.five
class _TranslationsCommentsEditCommentFiveEn {
	_TranslationsCommentsEditCommentFiveEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get question1 => 'Tell us about the location of the place? You like me?';
	String get question2 => 'What do you dislike? !Tell us!';
}

// Path: comments.editComment.six
class _TranslationsCommentsEditCommentSixEn {
	_TranslationsCommentsEditCommentSixEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get question1 => 'How about the price?';
	String get question2 => 'Doesn\'t it fit the place?';
}

// Path: comments.editComment.seven
class _TranslationsCommentsEditCommentSevenEn {
	_TranslationsCommentsEditCommentSevenEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get comment => 'Comment about our place, remember that your opinion is very valuable to us.';
	String get comment2 => 'Leave your comment';
}

// Path: reservas_todo.reservas_canceladas.summery
class _TranslationsReservasTodoReservasCanceladasSummeryEn {
	_TranslationsReservasTodoReservasCanceladasSummeryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text1 => 'You have a canceled reservation with the following information: \n';
	String nameSite({required Object name}) => 'Site name: ${name}\n';
	String location({required Object name}) => 'Location: ${name}\n';
	String checkInDate({required Object name}) => 'Check in date: ${name}\n';
	String checkOut({required Object name}) => 'Check-out: ${name}';
	String paymentMethod({required Object name}) => 'Payment method: ${name}\n';
	String paymentDate({required Object name}) => 'Payment Date: ${name}\n';
	String total({required Object name}) => 'Total number of guests: ${name}';
	String totalPrice({required Object name}) => 'Total price of the stay: ${name}';
}

// Path: reservas_todo.totalDevoluciones.summery
class _TranslationsReservasTodoTotalDevolucionesSummeryEn {
	_TranslationsReservasTodoTotalDevolucionesSummeryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text1 => 'You have a return for a reservation with the following information: \n';
	String nameSite({required Object name}) => 'Site name: ${name}\n';
	String location({required Object name}) => 'Location: ${name}\n';
	String filingDate({required Object name}) => 'Filing Date:: ${name}\n';
	String checkInDate({required Object name}) => 'Check in date: ${name}\n';
	String checkOut({required Object name}) => 'Check-out: ${name}';
	String paymentMethod({required Object name}) => 'Payment method: ${name}\n';
	String paymentDate({required Object name}) => 'Payment Date: ${name}\n';
	String total({required Object name}) => 'Total number of guests: ${name}';
	String totalPrice({required Object name}) => 'Total price of the stay: ${name}';
}

// Path: reservas_todo.multas.summery
class _TranslationsReservasTodoMultasSummeryEn {
	_TranslationsReservasTodoMultasSummeryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text1 => 'You have a fine reservation with the following information: \n';
	String nameSite({required Object name}) => 'Site name: ${name}\n';
	String location({required Object name}) => 'Location: ${name}\n';
	String filingDate({required Object name}) => 'Filing Date:: ${name}\n';
	String checkInDate({required Object name}) => 'Check in date: ${name}\n';
	String checkOut({required Object name}) => 'Check-out: ${name}';
	String paymentMethod({required Object name}) => 'Payment method: ${name}\n';
	String paymentDate({required Object name}) => 'Payment Date: ${name}\n';
	String bookingValue({required Object name}) => 'Booking value: ${name}';
	String fineValue({required Object name}) => 'Fine value: ${name}';
	String returnValue({required Object name}) => 'Return value: ${name}';
	String total({required Object name}) => 'Total number of guests: ${name}';
	String totalPrice({required Object name}) => 'Total price of the stay: ${name}';
}

// Path: reservas_todo.usuarioTotalPago.summery
class _TranslationsReservasTodoUsuarioTotalPagoSummeryEn {
	_TranslationsReservasTodoUsuarioTotalPagoSummeryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text1 => 'You made a payment for a reservation with the following information: \n';
	String nameSite({required Object name}) => 'Site name: ${name}\n';
	String location({required Object name}) => 'Location: ${name}\n';
	String filingDate({required Object name}) => 'Filing Date:: ${name}\n';
	String checkInDate({required Object name}) => 'Check in date: ${name}\n';
	String checkOut({required Object name}) => 'Check-out: ${name}';
	String paymentMethod({required Object name}) => 'Payment method: ${name}\n';
	String paymentDate({required Object name}) => 'Payment Date: ${name}\n';
	String total({required Object name}) => 'Total number of guests: ${name}';
	String totalPrice({required Object name}) => 'Total price of the stay: ${name}';
}

// Path: reservas_todo.misMultas.summery
class _TranslationsReservasTodoMisMultasSummeryEn {
	_TranslationsReservasTodoMisMultasSummeryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text1 => 'You have a fine with the following information: \n';
	String nameSite({required Object name}) => 'Site name: ${name}\n';
	String location({required Object name}) => 'Location: ${name}\n';
	String checkInDate({required Object name}) => 'Check in date: ${name}\n';
	String checkOut({required Object name}) => 'Check-out: ${name}';
	String bookingValue({required Object name}) => 'Booking value: ${name}';
	String fineValue({required Object name}) => 'Fine value: ${name}';
	String returnValue({required Object name}) => 'Return value: ${name}';
}

// Path: reservas_todo.misReservasActivas.summery
class _TranslationsReservasTodoMisReservasActivasSummeryEn {
	_TranslationsReservasTodoMisReservasActivasSummeryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text1 => 'You have a active reservation with the following information: \n';
	String nameSite({required Object name}) => 'Site name: ${name}\n';
	String location({required Object name}) => 'Location: ${name}\n';
	String checkInDate({required Object name}) => 'Check in date: ${name}\n';
	String checkOut({required Object name}) => 'Check-out: ${name}';
	String total({required Object name}) => 'Total number of guests: ${name}';
	String totalPrice({required Object name}) => 'Total price of the stay: ${name}';
}

// Path: reservas_todo.reservas_finalizadas.summery
class _TranslationsReservasTodoReservasFinalizadasSummeryEn {
	_TranslationsReservasTodoReservasFinalizadasSummeryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text1 => 'You have a finalized reservation with the following information: \n';
	String nameSite({required Object name}) => 'Site name: ${name}\n';
	String location({required Object name}) => 'Location: ${name}\n';
	String checkInDate({required Object name}) => 'Check in date: ${name}\n';
	String checkOut({required Object name}) => 'Check-out: ${name}';
	String total({required Object name}) => 'Total number of guests: ${name}';
	String totalPrice({required Object name}) => 'Total price of the stay: ${name}';
}

// Path: reservas_todo.reservas_pendientes.summery
class _TranslationsReservasTodoReservasPendientesSummeryEn {
	_TranslationsReservasTodoReservasPendientesSummeryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text1 => 'You have a pendig reservation with the following information: \n';
	String nameSite({required Object name}) => 'Site name: ${name}\n';
	String location({required Object name}) => 'Location: ${name}\n';
	String checkInDate({required Object name}) => 'Check in date: ${name}\n';
	String checkOut({required Object name}) => 'Check-out: ${name}';
	String total({required Object name}) => 'Total number of guests: ${name}';
	String totalPrice({required Object name}) => 'Total price of the stay: ${name}';
}

// Path: reservas_todo.misReservasCanceladas.summery
class _TranslationsReservasTodoMisReservasCanceladasSummeryEn {
	_TranslationsReservasTodoMisReservasCanceladasSummeryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text1 => 'You have a canceled reservation with the following information: \n';
	String nameSite({required Object name}) => 'Site name: ${name}\n';
	String location({required Object name}) => 'Location: ${name}\n';
	String checkInDate({required Object name}) => 'Check in date: ${name}\n';
	String checkOut({required Object name}) => 'Check-out: ${name}';
	String total({required Object name}) => 'Total number of guests: ${name}';
	String totalPrice({required Object name}) => 'Total price of the stay: ${name}';
}

// Path: reservas_todo.misReservasFinalizadas.summery
class _TranslationsReservasTodoMisReservasFinalizadasSummeryEn {
	_TranslationsReservasTodoMisReservasFinalizadasSummeryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text1 => 'You have a finalized reservation with the following information: \n';
	String nameSite({required Object name}) => 'Site name: ${name}\n';
	String location({required Object name}) => 'Location: ${name}\n';
	String checkInDate({required Object name}) => 'Check in date: ${name}\n';
	String checkOut({required Object name}) => 'Check-out: ${name}';
	String total({required Object name}) => 'Total number of guests: ${name}';
	String totalPrice({required Object name}) => 'Total price of the stay: ${name}';
}

// Path: reservas_todo.misReservasPendientes.summery
class _TranslationsReservasTodoMisReservasPendientesSummeryEn {
	_TranslationsReservasTodoMisReservasPendientesSummeryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get text1 => 'You have a pendig reservation with the following information: \n';
	String nameSite({required Object name}) => 'Site name: ${name}\n';
	String location({required Object name}) => 'Location: ${name}\n';
	String checkInDate({required Object name}) => 'Check in date: ${name}\n';
	String checkOut({required Object name}) => 'Check-out: ${name}';
	String total({required Object name}) => 'Total number of guests: ${name}';
	String totalPrice({required Object name}) => 'Total price of the stay: ${name}';
}

// Path: <root>
class _TranslationsEs implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_TranslationsEs.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.es,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <es>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _TranslationsEs _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsBuscadorEs buscador = _TranslationsBuscadorEs._(_root);
	@override late final _TranslationsCategoriesEs categories = _TranslationsCategoriesEs._(_root);
	@override late final _TranslationsFromEs From = _TranslationsFromEs._(_root);
	@override late final _TranslationsChatEs chat = _TranslationsChatEs._(_root);
	@override late final _TranslationsCommentsEs comments = _TranslationsCommentsEs._(_root);
	@override late final _TranslationsReservaEs reserva = _TranslationsReservaEs._(_root);
	@override late final _TranslationsMySitesEs mySites = _TranslationsMySitesEs._(_root);
	@override late final _TranslationsReservasTodoEs reservas_todo = _TranslationsReservasTodoEs._(_root);
	@override late final _TranslationsOtrosEs otros = _TranslationsOtrosEs._(_root);
	@override late final _TranslationsSitioVisitadoEs sitioVisitado = _TranslationsSitioVisitadoEs._(_root);
	@override late final _TranslationsDScreenEs dScreen = _TranslationsDScreenEs._(_root);
	@override late final _TranslationsDashboardEs dashboard = _TranslationsDashboardEs._(_root);
	@override late final _TranslationsHabitacionDetailsEs habitacionDetails = _TranslationsHabitacionDetailsEs._(_root);
	@override late final _TranslationsComplementosEs complementos = _TranslationsComplementosEs._(_root);
	@override late final _TranslationsServiciosDetailsEs serviciosDetails = _TranslationsServiciosDetailsEs._(_root);
	@override late final _TranslationsShowHuespedEs showHuesped = _TranslationsShowHuespedEs._(_root);
	@override late final _TranslationsInferiorDetailsEs inferiorDetails = _TranslationsInferiorDetailsEs._(_root);
	@override late final _TranslationsServiciosEs servicios = _TranslationsServiciosEs._(_root);
	@override late final _TranslationsFromHabitacionEs from_habitacion = _TranslationsFromHabitacionEs._(_root);
	@override late final _TranslationsServiciosScreenEs serviciosScreen = _TranslationsServiciosScreenEs._(_root);
	@override late final _TranslationsFormularioSitioEs formularioSitio = _TranslationsFormularioSitioEs._(_root);
	@override late final _TranslationsPantallaUnoEs pantallaUno = _TranslationsPantallaUnoEs._(_root);
	@override late final _TranslationsPantallaDosEs pantallaDos = _TranslationsPantallaDosEs._(_root);
	@override late final _TranslationsPantallaTresEs pantallaTres = _TranslationsPantallaTresEs._(_root);
	@override late final _TranslationsPantallaCuatroEs pantallaCuatro = _TranslationsPantallaCuatroEs._(_root);
	@override late final _TranslationsActualizacionUnoEs actualizacionUno = _TranslationsActualizacionUnoEs._(_root);
	@override late final _TranslationsSearchEs search = _TranslationsSearchEs._(_root);
	@override late final _TranslationsIdentificacionClasesEs identificacionClases = _TranslationsIdentificacionClasesEs._(_root);
	@override late final _TranslationsPruebaEditEs pruebaEdit = _TranslationsPruebaEditEs._(_root);
	@override late final _TranslationsClasesEs clases = _TranslationsClasesEs._(_root);
	@override late final _TranslationsListaEs lista = _TranslationsListaEs._(_root);
	@override late final _TranslationsRegisterEs register = _TranslationsRegisterEs._(_root);
	@override late final _TranslationsPruebaTresEs pruebaTres = _TranslationsPruebaTresEs._(_root);
	@override late final _TranslationsMenuPdfEs menu_pdf = _TranslationsMenuPdfEs._(_root);
	@override late final _TranslationsPdfEs pdf = _TranslationsPdfEs._(_root);
	@override late final _TranslationsSplashScreenEs splashScreen = _TranslationsSplashScreenEs._(_root);
	@override late final _TranslationsInfoImportanteEs info_importante = _TranslationsInfoImportanteEs._(_root);
	@override late final _TranslationsCosasFaltantesEs cosas_faltantes = _TranslationsCosasFaltantesEs._(_root);
	@override late final _TranslationsModalInforEs modalInfor = _TranslationsModalInforEs._(_root);
	@override String get texts1 => 'Hola, por si no sabes aún como generar una reserva en nuestra app, puedes mirar un video que hemos generado para ti para que sepas más de nuestras funcionalidades.';
	@override String get textS => 'Si estás registrando un sitio por primera vez, te invitamos a ver el siguiente video.';
	@override String get botonS => 'Ver video';
	@override String get botonV => 'Ir ahora al video';
	@override String get administradorE => 'Administrador';
	@override String get usuarioE => 'Usuario';
	@override String get pendienteE => 'Pendiente';
	@override String get finalizadoE => 'Finalizado';
	@override String get huella1 => 'Por favor, escanee su huella dactilar para confirmar su reserva';
	@override String get huella2 => 'Por favor, escanee su huella dactilar para acceder';
	@override String get voz1 => 'Por favor, mantenga presionado el botón mientras habla. Una vez haya terminado de hablar, suéltelo y vuelva a presionarlo para iniciar sesión';
	@override String get voz2 => 'Por favor, mantenga presionado el botón mientras habla. Una vez haya terminado de hablar, suéltelo y vuelva a presionarlo para realizar la reserva';
}

// Path: buscador
class _TranslationsBuscadorEs implements _TranslationsBuscadorEn {
	_TranslationsBuscadorEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get Searchbyregion => 'Región';
	@override String get SouthAmerica => 'AMÉRICA DEL SUR';
	@override String get NorthAmerica => 'AMÉRICA DEL NORTE';
	@override String get CentralAmerica => 'CENTROAMÉRICA';
	@override String get Europe => 'EUROPA';
	@override String get Asia => 'ASIA';
	@override String get Africa => 'ÁFRICA';
	@override String get Oceania => 'OCEANIA';
	@override late final _TranslationsBuscadorStepEs Step = _TranslationsBuscadorStepEs._(_root);
	@override late final _TranslationsBuscadorStep2Es Step2 = _TranslationsBuscadorStep2Es._(_root);
	@override late final _TranslationsBuscadorCardEs card = _TranslationsBuscadorCardEs._(_root);
}

// Path: categories
class _TranslationsCategoriesEs implements _TranslationsCategoriesEn {
	_TranslationsCategoriesEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get questionCategorie => '¿Quiere eliminar esta categoría?';
	@override String get questionCategorie2 => 'Si elimina esta categoría no hay marcha atras. ¿Esta seguro de hacer esta operación?';
	@override String get cancel => 'Cancelar';
	@override String get delete => 'Eliminar';
	@override String get categories => 'Categorías';
	@override String get addCategory => 'Añadir Categoría';
	@override String get login => 'Iniciar Sesión';
}

// Path: From
class _TranslationsFromEs implements _TranslationsFromEn {
	_TranslationsFromEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get category => 'Categoría';
	@override String get required => 'Se requiere este campo';
	@override String get loading => 'Cargando';
	@override String get notIcon => 'No se ha seleccionado ningún icono';
	@override String get summery => 'Cuando seleccione un icono, por favor, espere un momento mientras se carga en nuestro servidor.';
	@override String get save => 'Guardar';
	@override String get summery2 => 'Cuando seleccione una imagen, por favor, espere un momento mientras se carga en nuestro servidor. Después de la carga exitosa, haga clic en el botón Guardar ubicado al final del formulario para efectuar los cambios.';
}

// Path: chat
class _TranslationsChatEs implements _TranslationsChatEn {
	_TranslationsChatEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get write => 'Escribir mensaje';
	@override String get administrators => 'Administradores';
	@override String get hosts => 'Anfitriones';
	@override String get myGuests => 'Mis huéspedes';
	@override String get users => 'Usuarios';
}

// Path: comments
class _TranslationsCommentsEs implements _TranslationsCommentsEn {
	_TranslationsCommentsEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get site => 'Sitio';
	@override String get cleaning => 'Limpieza';
	@override String get communication => 'Comunicación';
	@override String get arrival => 'Llegada';
	@override String get reliability => 'Fiabilidad';
	@override String get location => 'Ubicación';
	@override String get price => 'Precio';
	@override String get comment => 'Comentario';
	@override late final _TranslationsCommentsQuestionEs question = _TranslationsCommentsQuestionEs._(_root);
	@override late final _TranslationsCommentsEditCommentEs editComment = _TranslationsCommentsEditCommentEs._(_root);
	@override late final _TranslationsCommentsCommentPageEs commentPage = _TranslationsCommentsCommentPageEs._(_root);
}

// Path: reserva
class _TranslationsReservaEs implements _TranslationsReservaEn {
	_TranslationsReservaEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get payments => 'Pagos Recibidos';
	@override String get site => 'Sitio';
	@override String get user => 'Usuario';
	@override String get payDay => 'Fecha Pago';
	@override String get State => 'Estado';
	@override String get see => 'Ver';
	@override late final _TranslationsReservaSummeryEs summery = _TranslationsReservaSummeryEs._(_root);
	@override String get fullname => 'Nombre Completo';
	@override String get paymentDate => 'Fecha de pago';
	@override String get dateOfFiling => 'Fecha del radicado';
	@override String get paymentMethod => 'Medio de Pago';
	@override String get paymentStatus => 'Estado de pago';
	@override String get entryDate => 'Fecha de entrada';
	@override String get departureeDate => 'Fecha de salida';
	@override String get NumberOfGuests => 'Número de huéspedes';
	@override String get NumberOfBabys => 'Número de Bebes';
	@override String get NumberOfPets => 'Número de Mascotas';
	@override String get ReserveValue => 'Valor Reserva';
	@override String get ValueGain => 'Valor Ganancia';
	@override String get valueToReturn => 'Valor a devolver';
	@override String get cerrar => 'Cerrar';
	@override late final _TranslationsReservaReservaActivaEs reserva_activa = _TranslationsReservaReservaActivaEs._(_root);
	@override late final _TranslationsReservaReservaCanceladaEs reserva_cancelada = _TranslationsReservaReservaCanceladaEs._(_root);
	@override late final _TranslationsReservaReservaFinalizadaEs reserva_finalizada = _TranslationsReservaReservaFinalizadaEs._(_root);
}

// Path: mySites
class _TranslationsMySitesEs implements _TranslationsMySitesEn {
	_TranslationsMySitesEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title2 => 'Todos los sitios';
	@override String get title => 'Mis sitios';
	@override String categoria({required Object name}) => 'Categoría ${name}';
	@override String huespedes({required Object name}) => 'Huéspedes ${name}';
	@override String noche({required Object name}) => '${name} noche';
	@override late final _TranslationsMySitesQuestionEs question = _TranslationsMySitesQuestionEs._(_root);
	@override late final _TranslationsMySitesQuestion2Es question2 = _TranslationsMySitesQuestion2Es._(_root);
	@override late final _TranslationsMySitesQuestion3Es question3 = _TranslationsMySitesQuestion3Es._(_root);
	@override String get accept => 'Aceptar';
}

// Path: reservas_todo
class _TranslationsReservasTodoEs implements _TranslationsReservasTodoEn {
	_TranslationsReservasTodoEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsReservasTodoReservasCanceladasEs reservas_canceladas = _TranslationsReservasTodoReservasCanceladasEs._(_root);
	@override late final _TranslationsReservasTodoTotalDevolucionesEs totalDevoluciones = _TranslationsReservasTodoTotalDevolucionesEs._(_root);
	@override late final _TranslationsReservasTodoMultasEs multas = _TranslationsReservasTodoMultasEs._(_root);
	@override late final _TranslationsReservasTodoTotalPagosAnfEs totalPagosAnf = _TranslationsReservasTodoTotalPagosAnfEs._(_root);
	@override late final _TranslationsReservasTodoPagosTotalAnfEs pagosTotalAnf = _TranslationsReservasTodoPagosTotalAnfEs._(_root);
	@override late final _TranslationsReservasTodoUsuarioTotalPagoEs usuarioTotalPago = _TranslationsReservasTodoUsuarioTotalPagoEs._(_root);
	@override late final _TranslationsReservasTodoCancelacionReservaEs cancelacionReserva = _TranslationsReservasTodoCancelacionReservaEs._(_root);
	@override late final _TranslationsReservasTodoConfirmacionPago2Es confirmacionPago2 = _TranslationsReservasTodoConfirmacionPago2Es._(_root);
	@override late final _TranslationsReservasTodoMisMultasEs misMultas = _TranslationsReservasTodoMisMultasEs._(_root);
	@override late final _TranslationsReservasTodoMisDevolucionesEs misDevoluciones = _TranslationsReservasTodoMisDevolucionesEs._(_root);
	@override late final _TranslationsReservasTodoMisPagosEs misPagos = _TranslationsReservasTodoMisPagosEs._(_root);
	@override late final _TranslationsReservasTodoMisReservasActivasEs misReservasActivas = _TranslationsReservasTodoMisReservasActivasEs._(_root);
	@override late final _TranslationsReservasTodoActualizacionDevolucionesEs actualizacionDevoluciones = _TranslationsReservasTodoActualizacionDevolucionesEs._(_root);
	@override late final _TranslationsReservasTodoActualizacionPagoEs actualizacionPago = _TranslationsReservasTodoActualizacionPagoEs._(_root);
	@override late final _TranslationsReservasTodoReservasFinalizadasEs reservas_finalizadas = _TranslationsReservasTodoReservasFinalizadasEs._(_root);
	@override late final _TranslationsReservasTodoReservasPendientesEs reservas_pendientes = _TranslationsReservasTodoReservasPendientesEs._(_root);
	@override late final _TranslationsReservasTodoQuestionsEs questions = _TranslationsReservasTodoQuestionsEs._(_root);
	@override late final _TranslationsReservasTodoMisReservasCanceladasEs misReservasCanceladas = _TranslationsReservasTodoMisReservasCanceladasEs._(_root);
	@override late final _TranslationsReservasTodoMisReservasFinalizadasEs misReservasFinalizadas = _TranslationsReservasTodoMisReservasFinalizadasEs._(_root);
	@override late final _TranslationsReservasTodoMisReservasPendientesEs misReservasPendientes = _TranslationsReservasTodoMisReservasPendientesEs._(_root);
}

// Path: otros
class _TranslationsOtrosEs implements _TranslationsOtrosEn {
	_TranslationsOtrosEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsOtrosCardsEs cards = _TranslationsOtrosCardsEs._(_root);
	@override late final _TranslationsOtrosFavoriteEs favorite = _TranslationsOtrosFavoriteEs._(_root);
}

// Path: sitioVisitado
class _TranslationsSitioVisitadoEs implements _TranslationsSitioVisitadoEn {
	_TranslationsSitioVisitadoEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sitios visitados';
}

// Path: dScreen
class _TranslationsDScreenEs implements _TranslationsDScreenEn {
	_TranslationsDScreenEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get pAnfitrion => 'Panel anfitrión';
	@override String get pAdmin => 'Panel Administrador';
}

// Path: dashboard
class _TranslationsDashboardEs implements _TranslationsDashboardEn {
	_TranslationsDashboardEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get inicio => 'Inicio';
	@override String get perfil => 'Actualizar Datos';
	@override String get categorias => 'Categorías';
	@override String get comentario => 'Comentarios';
	@override String get chats => 'Mis Chats';
	@override String get sitio => 'Nuevo Sitio';
	@override String get claro => 'Modo Claro';
	@override String get oscuro => 'Modo Oscuro';
	@override String get sesion => 'Cerrar Sesión';
}

// Path: habitacionDetails
class _TranslationsHabitacionDetailsEs implements _TranslationsHabitacionDetailsEn {
	_TranslationsHabitacionDetailsEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => '¿Dónde vas a dormir?';
}

// Path: complementos
class _TranslationsComplementosEs implements _TranslationsComplementosEn {
	_TranslationsComplementosEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get share => 'Compartir';
	@override String get favorites => 'Favoritos';
	@override late final _TranslationsComplementosQuestionEs question = _TranslationsComplementosQuestionEs._(_root);
	@override late final _TranslationsComplementosQuestion2Es question2 = _TranslationsComplementosQuestion2Es._(_root);
	@override String get telefono => 'Ingrese el número de telefono';
	@override String get required => 'Se requiere de este campo';
	@override late final _TranslationsComplementosSummeryEs summery = _TranslationsComplementosSummeryEs._(_root);
	@override String get send => 'Enviar';
	@override String get seeAllPhotos => 'Ver todas las fotos';
	@override String get goTo => 'A dónde irás';
	@override String get searchLocation => 'Buscar Ubicación';
	@override String get location => 'Ubicación';
	@override String get home => 'Inicio';
	@override String get night => 'Noche';
	@override String get arrive => 'Llegada';
	@override String get exit => 'Salida';
	@override String get clearnCOst => 'Tarifa de limpieza';
	@override String get payAndConfirm => 'Confirma y paga';
	@override String get info => 'Información de tu viaje';
	@override String get yourTotal => 'Tu total';
	@override String get confirm => 'Confirmar pago';
	@override String get totalCOP => 'Total (COP)';
	@override String get guest => 'Huéspedes';
}

// Path: serviciosDetails
class _TranslationsServiciosDetailsEs implements _TranslationsServiciosDetailsEn {
	_TranslationsServiciosDetailsEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String summery({required Object name}) => 'Mostrar los ${name} servicios';
	@override String get ofrece => 'Lo que este lugar ofrece';
}

// Path: showHuesped
class _TranslationsShowHuespedEs implements _TranslationsShowHuespedEn {
	_TranslationsShowHuespedEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get adults => 'Adultos';
	@override String get age => 'Edad 13 años o más';
	@override String get children => 'Niños';
	@override String get from => 'De 2 a 12 años';
	@override String get babys => 'Bebes';
	@override String get less => 'Menos de 12 años';
	@override String get pets => 'Mascotas';
	@override String get save => 'Guardar';
}

// Path: inferiorDetails
class _TranslationsInferiorDetailsEs implements _TranslationsInferiorDetailsEn {
	_TranslationsInferiorDetailsEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get rules => 'Reglas de la casa';
	@override String get securityAndPrivacy => 'Seguridad y privacidad';
	@override String get polices => 'Políticas de cancelación';
	@override String get reglasSitio => 'Reglas del sitio';
	@override String get seguridad => 'Seguridad y propiedad del sitio';
	@override String get cancelacion => 'Cancelación gratuita por 48 horas';
}

// Path: servicios
class _TranslationsServiciosEs implements _TranslationsServiciosEn {
	_TranslationsServiciosEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get wifi => 'Wifi';
	@override String get piscina => 'Piscina';
	@override late final _TranslationsServiciosKitchenEs kitchen = _TranslationsServiciosKitchenEs._(_root);
	@override String get jacuzzi => 'Un jacuzzi';
	@override String get bodySoap => 'Jabon corporal';
	@override String get shampoo => 'Shampoo';
	@override String get shocked_Refrigerator => 'Nevera surtida';
	@override String get assorted_Minibar => 'Minibar surtido';
	@override String get microwave => 'Microondas';
	@override String get grill => 'Parrilla';
	@override String get coffee_Maker => 'Cafetera';
	@override String get autonomous_Entry => 'Entrada Autónoma';
	@override String get hot_Water => 'Agua Caliente';
	@override String get air_conditioning => 'Aire Acondicionado';
	@override String get washer_Dryer => 'Lavadora secadora';
	@override String get television_or_cable => 'Televisión o cable';
	@override String get chimney => 'Chimenea';
	@override String get parking_lot => 'Estacionamiento';
	@override String get good_lighting => 'Buena iluminacion';
	@override late final _TranslationsServiciosOtroEs otro = _TranslationsServiciosOtroEs._(_root);
	@override String get office_supplies => 'Articulos de oficina';
	@override String get security_cameras => 'Cámaras de seguridad en la propiedad';
	@override String get luggage_storage => 'Se permite dejar el equipaje';
	@override String get towel_per_guest => 'Toalla por huésped';
	@override String get pillow_per_guest => 'Una almohada por huésped';
	@override String get bed_sheets => 'Sabanas para cada cama';
	@override String get cleaning_products => 'Productos de limpieza';
	@override String get bedding => 'Ropa de cama';
	@override String get equipped_kitchen => 'Cocina equipada';
	@override String get hair_dryer => 'Secador de pelo';
	@override String get iron_and_board => 'Plancha con tabla';
	@override String get smoke_detector => 'Detector de humo';
	@override String get carbon_monoxide_detector => 'Detector de monóxido de carbono';
	@override String get fire_extinguisher => 'Extintor de incendios';
	@override String get first_aid_kit => 'Botiquin primeros auxilios';
	@override String get child_seat => 'Asiento para niños';
	@override String get board_games => 'Juegos de mesa';
	@override String get free_bicycles => 'Bicicletas gratuitas';
	@override String get gym => 'Gimnasio';
	@override String get sauna => 'Sauna';
	@override String get patio_or_terrace => 'Patio o terraza';
	@override String get daily_cleaning_service => 'Servicio de limpieza diario';
	@override String get lake_view => 'Vista al lago';
	@override String get ocean_view => 'Vista al mar';
	@override String get safe_box => 'Caja de seguridad';
	@override String get concierge_service => 'Servicio de consejeria';
	@override late final _TranslationsServiciosTwoEs two = _TranslationsServiciosTwoEs._(_root);
	@override String get car_rental => 'Alquiler de coches';
	@override String get local_tour_guide => 'Guia turistica/local';
	@override String get babysitting_service => 'Servicio de niñera';
	@override String get musical_instruments => 'Instrumentos musicales';
	@override String get customized_tours => 'Tours personalizados';
	@override late final _TranslationsServiciosThreeEs three = _TranslationsServiciosThreeEs._(_root);
	@override String get crib => 'Cuna';
	@override String get catering_services => 'Servicios de catering';
	@override String get sound_system => 'Sistema de sonido';
	@override String get streaming_service => 'Servicio de streaming';
	@override String get welcome_kit => 'Kit de bienvenida';
	@override String get boat_service => 'Servicio de barco';
	@override String get restaurant_discounts => 'Descuentos en restaurantes';
}

// Path: from_habitacion
class _TranslationsFromHabitacionEs implements _TranslationsFromHabitacionEn {
	_TranslationsFromHabitacionEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Titúlo';
	@override String get required => 'Se requiere de este campo';
	@override String get description => 'Descripción';
	@override String get add => 'Agregar habitación';
	@override String get save => 'Guardar habitaciones';
}

// Path: serviciosScreen
class _TranslationsServiciosScreenEs implements _TranslationsServiciosScreenEn {
	_TranslationsServiciosScreenEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get select => 'Selecciona tus servicios';
	@override String get description => 'A continuación, usted encontrará varios servicios. Seleccione aquellos que ofrece su propiedad. En la parte inferior de este listado, encontrará un botón en el cual usted guardará en nuestro servidor los servicios seleccionados.';
	@override String get save => 'Guardar servicios';
}

// Path: formularioSitio
class _TranslationsFormularioSitioEs implements _TranslationsFormularioSitioEn {
	_TranslationsFormularioSitioEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get save => 'Guardar';
	@override String get Continue => 'Continuar';
	@override String get loading => 'Cargando';
}

// Path: pantallaUno
class _TranslationsPantallaUnoEs implements _TranslationsPantallaUnoEn {
	_TranslationsPantallaUnoEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get Agrega_tu_Sitio => 'Agrega tu Sitio';
	@override String get Categoria => 'Categoría';
	@override String get Titulo_del_sitio => 'Título del sitio';
	@override String get Se_requiere_de_este_campo => 'Se requiere de este campo';
	@override String get Numero_de_Huespedes => 'Número de huéspedes';
	@override String get Numero_de_Camas => 'Número de camas';
	@override String get Numero_de_Banos => 'Número de baños';
	@override String get Descripcion => 'Descripción';
}

// Path: pantallaDos
class _TranslationsPantallaDosEs implements _TranslationsPantallaDosEn {
	_TranslationsPantallaDosEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get america_del_sur => 'América del Sur';
	@override String get america_del_norte => 'América del Norte';
	@override String get centro_america => 'Centro América';
	@override String get europa => 'Europa';
	@override String get asia => 'Asia';
	@override String get africa => 'África';
	@override String get oceania => 'Oceanía';
	@override String get valor_noche => 'Valor noche';
	@override String get se_requiere_de_este_campo => 'Se requiere de este campo';
	@override String get lugar => 'Lugar';
	@override String get descripcion_del_lugar => 'Descripción del lugar';
	@override String get continente => 'Continente';
	@override String get text => 'Necesitamos la latitud y la longitud de su propiedad, ya que gestionamos un mapa que mostrará a sus futuros huéspedes la ubicación exacta. Puede encontrar estos datos en Google Maps o en su aplicación de localización preferida.';
	@override String get longitud => 'Longitud';
	@override String get latitud => 'Latitud';
}

// Path: pantallaTres
class _TranslationsPantallaTresEs implements _TranslationsPantallaTresEn {
	_TranslationsPantallaTresEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get valor_limpieza => 'Valor de limpieza';
	@override String get se_requiere_de_este_campo => 'Se requiere de este campo';
	@override String get texts1 => 'Al hacer clic en el campo de habitaciones, aparecerá un botón. Utilícelo para agregar el título y una descripción sobre la habitación que está por añadir.';
	@override String get habitaciones => 'Habitaciones';
	@override String get agregar => 'Agregar';
	@override String get aceptar_terminos_y_condiciones => 'Aceptar términos y condiciones';
	@override String get texts2 => 'Para acceder a nuestros términos y condiciones, por favor, haz clic en el siguiente botón';
	@override String get terminos_y_condiciones => 'Términos y Condiciones';
	@override String get anadir_imagenes => 'Añadir Imágenes';
	@override String get anadir_mas => 'Añadir Más';
	@override String get texts3 => 'Después de seleccionar sus imágenes, haga clic en el icono de \'subir\' para guardarlas en nuestro servidor. Este proceso puede demorar dependiendo de la cantidad de imágenes que esté subiendo.';
}

// Path: pantallaCuatro
class _TranslationsPantallaCuatroEs implements _TranslationsPantallaCuatroEn {
	_TranslationsPantallaCuatroEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get siteRules => 'Reglas del sitio';
	@override String get rules => 'Reglas';
	@override String get required => 'Se requiere de este campo';
	@override String get siteSecurity => 'Seguridad del sitio';
	@override String get security => 'Seguridad';
}

// Path: actualizacionUno
class _TranslationsActualizacionUnoEs implements _TranslationsActualizacionUnoEn {
	_TranslationsActualizacionUnoEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get actualiza_tu_sitio => 'Actualiza tu sitio';
	@override String get title => 'Título';
	@override String get descripcion_del_sitio => 'Descripción del sitio';
	@override String get numero_de_huespedes => 'Número de huéspedes';
	@override String get valor_noche => 'Valor noche';
	@override String get descripcion_del_lugar => 'Descripción del lugar';
	@override String get texts1 => 'Necesitamos la latitud y la longitud de su propiedad, ya que gestionamos un mapa que mostrará a sus futuros huéspedes la ubicación exacta. Puede encontrar estos datos en Google Maps o en su aplicación de localización preferida.';
	@override String get latitud => 'Latitud';
	@override String get longitud => 'Longitud';
	@override String get valor_de_la_limpieza => 'Valor de la limpieza';
	@override String get guardar => 'Guardar';
}

// Path: search
class _TranslationsSearchEs implements _TranslationsSearchEn {
	_TranslationsSearchEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get spanish => 'Español';
	@override String get english => 'Ingles';
	@override String get login => 'Iniciar Sesión';
	@override String get close => 'Cerrar';
}

// Path: identificacionClases
class _TranslationsIdentificacionClasesEs implements _TranslationsIdentificacionClasesEn {
	_TranslationsIdentificacionClasesEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get error_al_verificar_credenciales => 'Error al verificar credenciales.';
	@override String get cerrar => 'Cerrar';
	@override String get iniciar_sesion => 'Iniciar Sesión';
	@override String get viaja_con_estilo_destinos_de_ensueno_a_tu_alcance => 'Viaja con Estilo, Destinos de Ensueño a Tu Alcance';
	@override String get diga_la_siguiente_palabra => 'Diga la siguiente palabra:';
	@override String get texts1 => 'Descubre destinos inexplorados, vive experiencias únicas y crea recuerdos que durarán toda la vida. ¡Únete a la comunidad viajera y haz realidad tus sueños de viaje!';
	@override String get authentication => 'Autenticación';
	@override String get password => 'Cambio de contraseña';
	@override String get message => '¡Su contraseña fue cambiada exitosamente!';
	@override String get accept => 'Aceptar';
	@override String get email => 'E-mail';
	@override String get pass => 'Contraseña';
	@override String get forgot => '¿Olvido la contraseña?';
}

// Path: pruebaEdit
class _TranslationsPruebaEditEs implements _TranslationsPruebaEditEn {
	_TranslationsPruebaEditEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get actualizar_datos => 'Actualizar Datos';
	@override String get texts1 => '¡Actualiza tus datos y no te pierdas la oportunidad de disfrutar las mejores vacaciones de tu vida! ¡Hazlo ahora y vive la experiencia al máximo!';
	@override String get telefono => 'Teléfono';
	@override String get se_requiere_de_un_numero_de_telefono => 'Se requiere de un número de teléfono';
	@override String get idioma => 'Idioma';
	@override String get quieres_agregar_una_descripcion => '¿Quieres agregar una descripción?';
	@override String get descripcion => 'Descripción';
	@override String get nombre_completo => 'Nombre Completo';
	@override String get tipo_de_documento => 'Tipo de Documento';
	@override String get numero_de_documento => 'Número de Documento';
	@override String get texts2 => 'Usted se registrará como usuario y anfitrión. Solicitamos sus datos bancarios para realizar los respectivos pagos en caso de que ofrezca un sitio para alquilar. También, en caso de que cancele una reserva, estos datos nos ayudarán a hacer la respectiva devolución de su dinero.';
	@override String get bank => 'Banco';
	@override String get numero_de_daviplata => 'Numero de Daviplata';
	@override String get contrasena => 'Contraseña';
	@override String get confirmacion_de_contrasena => 'Confirmación de Contraseña';
	@override String get cambiar_contrasena => 'Cambiar Contraseña';
	@override String get telefono_celular => 'Télefono Celular';
	@override String get seleccionar_foto_de_perfil => 'Seleccionar foto de perfil';
	@override String get listo => 'Listo';
	@override String get cargando => 'Cargando';
	@override String get texts3 => 'Cuando seleccione su foto de perfil, por favor, espere un momento mientras se carga en nuestro servidor. Asegúrese de desplazarse hasta el final de este formulario y guardar los cambios para que la nueva foto de perfil se aplique correctamente. Si no completa este paso, la imagen seleccionada no será guardada como su nueva foto de perfil.';
}

// Path: clases
class _TranslationsClasesEs implements _TranslationsClasesEn {
	_TranslationsClasesEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get singnIn => 'Iniciar sesión';
	@override String get singUp => 'Registrarse';
}

// Path: lista
class _TranslationsListaEs implements _TranslationsListaEn {
	_TranslationsListaEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get cc => 'Cedula de Ciudadanía';
	@override String get ce => 'Cedula de Extranjería';
	@override String get pass => 'Pasaporte';
	@override String get nit => 'Número de identificación tributaria';
	@override late final _TranslationsListaBanksEs banks = _TranslationsListaBanksEs._(_root);
}

// Path: register
class _TranslationsRegisterEs implements _TranslationsRegisterEn {
	_TranslationsRegisterEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get register => 'Registrarse';
	@override String get text1 => 'Que esperas por regístrate, no te detengas de disfrutar de las mejores vacaciones de tu vida!!';
	@override String get tel => 'Teléfono';
	@override String get requiredPhone => 'Se requiere de un número de teléfono';
	@override String get lenguaje => 'Idioma';
}

// Path: pruebaTres
class _TranslationsPruebaTresEs implements _TranslationsPruebaTresEn {
	_TranslationsPruebaTresEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get sing_up => 'Regístrate';
	@override String get text1 => 'Usted se registrará como usuario y anfitrión. Solicitamos sus datos bancarios para realizar los respectivos pagos en caso de que ofrezca un sitio para alquilar. También, en caso de que cancele una reserva, estos datos nos ayudarán a hacer la respectiva devolución de su dinero.';
	@override String get bank => 'Banco';
	@override String get daviplata => 'Número de Daviplata';
	@override String get contrasena_incorrecta => 'Contraseña incorrecta';
}

// Path: menu_pdf
class _TranslationsMenuPdfEs implements _TranslationsMenuPdfEn {
	_TranslationsMenuPdfEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Documento impreso exitosamente';
	@override String get text2 => 'Documento compartido exitosamente';
}

// Path: pdf
class _TranslationsPdfEs implements _TranslationsPdfEn {
	_TranslationsPdfEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get factura => 'Factura StayAway';
	@override String get information => 'Información StayAway';
	@override String telefono({required Object name}) => 'Teléfono: ${name}';
	@override String nombre_del_sitio({required Object name}) => 'Nombre del sitio: ${name}';
	@override String nombre_del_cliente({required Object name}) => 'Nombre del Cliente: ${name}';
	@override String documento({required Object name}) => 'Documento: ${name}';
	@override String get informacion_reserva => 'Información de tu reserva';
}

// Path: splashScreen
class _TranslationsSplashScreenEs implements _TranslationsSplashScreenEn {
	_TranslationsSplashScreenEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSplashScreenExploraElMundoEs explora_el_Mundo = _TranslationsSplashScreenExploraElMundoEs._(_root);
	@override late final _TranslationsSplashScreenViajaConEstiloEs viaja_con_Estilo = _TranslationsSplashScreenViajaConEstiloEs._(_root);
	@override late final _TranslationsSplashScreenRutasSecretasEs rutas_Secretas = _TranslationsSplashScreenRutasSecretasEs._(_root);
	@override late final _TranslationsSplashScreenPlanificaTuEscapeEs planifica_Tu_Escape = _TranslationsSplashScreenPlanificaTuEscapeEs._(_root);
	@override late final _TranslationsSplashScreenViajarTransformaEs viajar_Transforma = _TranslationsSplashScreenViajarTransformaEs._(_root);
	@override String get skip => 'Omitir';
}

// Path: info_importante
class _TranslationsInfoImportanteEs implements _TranslationsInfoImportanteEn {
	_TranslationsInfoImportanteEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsInfoImportanteQuestionEs question = _TranslationsInfoImportanteQuestionEs._(_root);
	@override late final _TranslationsInfoImportanteQuestion2Es question2 = _TranslationsInfoImportanteQuestion2Es._(_root);
}

// Path: cosas_faltantes
class _TranslationsCosasFaltantesEs implements _TranslationsCosasFaltantesEn {
	_TranslationsCosasFaltantesEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get reset => 'Reiniciar';
	@override String get select => 'Seleccionar Icono';
	@override String get selectImage => 'Seleccionar Imagen';
	@override late final _TranslationsCosasFaltantesRolesEs roles = _TranslationsCosasFaltantesRolesEs._(_root);
	@override String info({required Object date1, required Object date2}) => 'Las siguientes fechas del ${date1} hasta el ${date2} están reservadas';
	@override late final _TranslationsCosasFaltantesAlertEs alert = _TranslationsCosasFaltantesAlertEs._(_root);
	@override String get all => 'Todos los usuarios';
	@override String get name => 'Nombre';
	@override String get mail => 'Correo';
	@override String get rol => 'Rol';
	@override String get update => 'Actualizar rol';
	@override String get number => 'Número de cuenta';
	@override String get date => 'Fecha de registro';
	@override late final _TranslationsCosasFaltantesQuestionsEs questions = _TranslationsCosasFaltantesQuestionsEs._(_root);
	@override late final _TranslationsCosasFaltantesDetailsEs details = _TranslationsCosasFaltantesDetailsEs._(_root);
	@override String get disponibilidad => 'Disponibilidad';
	@override String get summery => 'No hay comentarios disponibles';
	@override String get add => 'Añadir comentario';
	@override String get send => 'Enviar Comentario';
	@override String noche({required Object name}) => '${name} noches';
	@override String get modalText => 'Acerca de este espacio';
	@override String get showMore => 'Mostrar Más >';
}

// Path: modalInfor
class _TranslationsModalInforEs implements _TranslationsModalInforEn {
	_TranslationsModalInforEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get texts => 'Antes de continuar, revisa de que todos los campos estén correctamente.';
}

// Path: buscador.Step
class _TranslationsBuscadorStepEs implements _TranslationsBuscadorStepEn {
	_TranslationsBuscadorStepEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get Date => 'Fechas';
	@override String get ArrivalDate => 'Fecha de llegada';
	@override String get DepartureDate => 'Fecha de salida';
}

// Path: buscador.Step2
class _TranslationsBuscadorStep2Es implements _TranslationsBuscadorStep2En {
	_TranslationsBuscadorStep2Es._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get NumberOfGuests => 'Huéspedes';
	@override String get EnterNumberOfGuests => 'Ingrese el número de huéspedes';
	@override String get LookFor => 'Buscar';
	@override String get Following => 'Siguiente';
	@override String get Back => 'Atrás';
}

// Path: buscador.card
class _TranslationsBuscadorCardEs implements _TranslationsBuscadorCardEn {
	_TranslationsBuscadorCardEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get adults => 'Adultos';
	@override String get age => 'Edad de 13 años o más';
	@override String get children => 'Niños';
	@override String get from2 => 'De 2 a 12 años';
	@override String get babys => 'Bebes';
	@override String get less => 'Menos de 12 años';
	@override String get Pets => 'Mascotas';
	@override String get save => 'Guardar';
}

// Path: comments.question
class _TranslationsCommentsQuestionEs implements _TranslationsCommentsQuestionEn {
	_TranslationsCommentsQuestionEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question1 => '¿Quiere eliminar este comentario?';
	@override String get question2 => 'Si elimina este comentario no hay marcha atrás. ¿Está seguro de hacer esta operación?.';
}

// Path: comments.editComment
class _TranslationsCommentsEditCommentEs implements _TranslationsCommentsEditCommentEn {
	_TranslationsCommentsEditCommentEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsCommentsEditCommentOneEs one = _TranslationsCommentsEditCommentOneEs._(_root);
	@override late final _TranslationsCommentsEditCommentEleccionEs eleccion = _TranslationsCommentsEditCommentEleccionEs._(_root);
	@override late final _TranslationsCommentsEditCommentTwoEs two = _TranslationsCommentsEditCommentTwoEs._(_root);
	@override late final _TranslationsCommentsEditCommentThreeEs three = _TranslationsCommentsEditCommentThreeEs._(_root);
	@override late final _TranslationsCommentsEditCommentFourEs four = _TranslationsCommentsEditCommentFourEs._(_root);
	@override late final _TranslationsCommentsEditCommentFiveEs five = _TranslationsCommentsEditCommentFiveEs._(_root);
	@override late final _TranslationsCommentsEditCommentSixEs six = _TranslationsCommentsEditCommentSixEs._(_root);
	@override late final _TranslationsCommentsEditCommentSevenEs seven = _TranslationsCommentsEditCommentSevenEs._(_root);
	@override String get boton => 'Editar Comentario';
}

// Path: comments.commentPage
class _TranslationsCommentsCommentPageEs implements _TranslationsCommentsCommentPageEn {
	_TranslationsCommentsCommentPageEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get comments => 'Comentarios';
	@override String get myComments => 'Mis comentarios';
	@override String get comments2 => 'Comentarios en mis sitios';
	@override String get allComments => 'Todos los comentarios';
}

// Path: reserva.summery
class _TranslationsReservaSummeryEs implements _TranslationsReservaSummeryEn {
	_TranslationsReservaSummeryEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Recibiste un pago por una reserva con la siguiente información: \n';
	@override String nameSite({required Object name}) => 'Nombre del sitio: ${name}\n';
	@override String location({required Object name}) => 'Ubicación: ${name}\n';
	@override String checkInDate({required Object name}) => 'Fecha de entrada: ${name}\n';
	@override String checkOut({required Object name}) => 'Fecha de salida: ${name}';
	@override String paymentMethod({required Object name}) => 'Medios de pago: ${name}\n';
	@override String paymentDate({required Object name}) => 'Fecha de pago: ${name}\n';
	@override String total({required Object name}) => 'Número total de huéspedes: ${name}';
	@override String totalPrice({required Object name}) => 'Precio total de la estancia: ${name}';
}

// Path: reserva.reserva_activa
class _TranslationsReservaReservaActivaEs implements _TranslationsReservaReservaActivaEn {
	_TranslationsReservaReservaActivaEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Reservas activas de mis sitios';
	@override String get date => 'Fecha';
	@override String get fechaReserva => 'Fecha reserva';
	@override String get numeroAdultos => 'Número de adultos';
	@override String get numeroNinhos => 'Número de niños';
	@override String get fechallegada => 'fecha de llegada';
}

// Path: reserva.reserva_cancelada
class _TranslationsReservaReservaCanceladaEs implements _TranslationsReservaReservaCanceladaEn {
	_TranslationsReservaReservaCanceladaEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Reservas canceladas de mis sitios';
}

// Path: reserva.reserva_finalizada
class _TranslationsReservaReservaFinalizadaEs implements _TranslationsReservaReservaFinalizadaEn {
	_TranslationsReservaReservaFinalizadaEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Reservas finalizadas de mis sitios';
}

// Path: mySites.question
class _TranslationsMySitesQuestionEs implements _TranslationsMySitesQuestionEn {
	_TranslationsMySitesQuestionEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get one => '¿Hay reservas activas de este sitio?';
	@override String get contenedor => 'Existen reservas activas vinculadas a este sitio; será necesario esperar a que estas finalicen o se cancelen.';
}

// Path: mySites.question2
class _TranslationsMySitesQuestion2Es implements _TranslationsMySitesQuestion2En {
	_TranslationsMySitesQuestion2Es._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get one => '¿Quiere realizar esta acción?';
	@override String get contenedor => 'Para llevar a cabo esta acción, es necesario iniciar sesión primero.';
}

// Path: mySites.question3
class _TranslationsMySitesQuestion3Es implements _TranslationsMySitesQuestion3En {
	_TranslationsMySitesQuestion3Es._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get one => '¿Quiere eliminar este sitio?';
	@override String get contenedor => 'Si elimina este sitio no hay marcha atrás. ¿Está seguro de hacer esta operación?';
}

// Path: reservas_todo.reservas_canceladas
class _TranslationsReservasTodoReservasCanceladasEs implements _TranslationsReservasTodoReservasCanceladasEn {
	_TranslationsReservasTodoReservasCanceladasEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Todas las reservas canceladas';
	@override late final _TranslationsReservasTodoReservasCanceladasSummeryEs summery = _TranslationsReservasTodoReservasCanceladasSummeryEs._(_root);
}

// Path: reservas_todo.totalDevoluciones
class _TranslationsReservasTodoTotalDevolucionesEs implements _TranslationsReservasTodoTotalDevolucionesEn {
	_TranslationsReservasTodoTotalDevolucionesEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Devolución de Reservaciones';
	@override String get upload_status => 'Actualizar Estado';
	@override late final _TranslationsReservasTodoTotalDevolucionesSummeryEs summery = _TranslationsReservasTodoTotalDevolucionesSummeryEs._(_root);
}

// Path: reservas_todo.multas
class _TranslationsReservasTodoMultasEs implements _TranslationsReservasTodoMultasEn {
	_TranslationsReservasTodoMultasEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get fines => 'Multas';
	@override String get booking => 'Reserva';
	@override String get value => 'Valor';
	@override late final _TranslationsReservasTodoMultasSummeryEs summery = _TranslationsReservasTodoMultasSummeryEs._(_root);
	@override String get fineValue => 'Valor de la multa';
	@override String get returnValue => 'Valor a devolver';
}

// Path: reservas_todo.totalPagosAnf
class _TranslationsReservasTodoTotalPagosAnfEs implements _TranslationsReservasTodoTotalPagosAnfEn {
	_TranslationsReservasTodoTotalPagosAnfEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Todos los pagos hechos a los anfitriones';
}

// Path: reservas_todo.pagosTotalAnf
class _TranslationsReservasTodoPagosTotalAnfEs implements _TranslationsReservasTodoPagosTotalAnfEn {
	_TranslationsReservasTodoPagosTotalAnfEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Todos los pagos a anfitriones';
}

// Path: reservas_todo.usuarioTotalPago
class _TranslationsReservasTodoUsuarioTotalPagoEs implements _TranslationsReservasTodoUsuarioTotalPagoEn {
	_TranslationsReservasTodoUsuarioTotalPagoEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pagos de Reservaciones';
	@override late final _TranslationsReservasTodoUsuarioTotalPagoSummeryEs summery = _TranslationsReservasTodoUsuarioTotalPagoSummeryEs._(_root);
}

// Path: reservas_todo.cancelacionReserva
class _TranslationsReservasTodoCancelacionReservaEs implements _TranslationsReservasTodoCancelacionReservaEn {
	_TranslationsReservasTodoCancelacionReservaEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question1 => '¿Quiere cancelar esta reserva?';
	@override String get summery => 'Si decide cancelar esta reserva, es posible que se aplique una multa si la cancelación se realiza después de 48 horas. ¿Está seguro de hacer esta operación?';
}

// Path: reservas_todo.confirmacionPago2
class _TranslationsReservasTodoConfirmacionPago2Es implements _TranslationsReservasTodoConfirmacionPago2En {
	_TranslationsReservasTodoConfirmacionPago2Es._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Información de la reservación';
	@override String get summery1 => 'A continuación, observa la información del sitio al cual usted está ordenando antes de hacer el pago.';
	@override String get siteName => 'Nombre del sitio';
	@override String get location => 'Ubicación';
	@override String guest({required Object name}) => '${name} huésped';
	@override String get totalCost => 'Costo total';
	@override String get qrCode => 'Código QR';
	@override String get summery2 => 'En este momento, su reserva se encuentra en estado pendiente. Si desea que se active, por favor, realice el pago a través del código QR anterior en un lapso de 48 horas. Después de esto, cuando su reserva se active, aparecerá el contacto del anfitrión en nuestro chat en línea para ultimar detalles y asegurarse de que pueda disfrutar su estadía.';
}

// Path: reservas_todo.misMultas
class _TranslationsReservasTodoMisMultasEs implements _TranslationsReservasTodoMisMultasEn {
	_TranslationsReservasTodoMisMultasEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mis multas';
	@override late final _TranslationsReservasTodoMisMultasSummeryEs summery = _TranslationsReservasTodoMisMultasSummeryEs._(_root);
}

// Path: reservas_todo.misDevoluciones
class _TranslationsReservasTodoMisDevolucionesEs implements _TranslationsReservasTodoMisDevolucionesEn {
	_TranslationsReservasTodoMisDevolucionesEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mis Devoluciones';
}

// Path: reservas_todo.misPagos
class _TranslationsReservasTodoMisPagosEs implements _TranslationsReservasTodoMisPagosEn {
	_TranslationsReservasTodoMisPagosEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mis pagos';
}

// Path: reservas_todo.misReservasActivas
class _TranslationsReservasTodoMisReservasActivasEs implements _TranslationsReservasTodoMisReservasActivasEn {
	_TranslationsReservasTodoMisReservasActivasEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mis reservas activas';
	@override String get title2 => 'Todas las reservas activas';
	@override late final _TranslationsReservasTodoMisReservasActivasSummeryEs summery = _TranslationsReservasTodoMisReservasActivasSummeryEs._(_root);
}

// Path: reservas_todo.actualizacionDevoluciones
class _TranslationsReservasTodoActualizacionDevolucionesEs implements _TranslationsReservasTodoActualizacionDevolucionesEn {
	_TranslationsReservasTodoActualizacionDevolucionesEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Actualización de las Devoluciones';
	@override String get status => 'Estado: ';
	@override String get cancel => 'Cancelar';
	@override String get save => 'Guardar';
}

// Path: reservas_todo.actualizacionPago
class _TranslationsReservasTodoActualizacionPagoEs implements _TranslationsReservasTodoActualizacionPagoEn {
	_TranslationsReservasTodoActualizacionPagoEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Actualización pago de Anfitriones';
}

// Path: reservas_todo.reservas_finalizadas
class _TranslationsReservasTodoReservasFinalizadasEs implements _TranslationsReservasTodoReservasFinalizadasEn {
	_TranslationsReservasTodoReservasFinalizadasEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Todas las reservas finalizadas';
	@override late final _TranslationsReservasTodoReservasFinalizadasSummeryEs summery = _TranslationsReservasTodoReservasFinalizadasSummeryEs._(_root);
}

// Path: reservas_todo.reservas_pendientes
class _TranslationsReservasTodoReservasPendientesEs implements _TranslationsReservasTodoReservasPendientesEn {
	_TranslationsReservasTodoReservasPendientesEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Todas las reservas pendientes';
	@override String get activate => 'Activar';
	@override String get delete => 'Eliminar';
	@override late final _TranslationsReservasTodoReservasPendientesSummeryEs summery = _TranslationsReservasTodoReservasPendientesSummeryEs._(_root);
}

// Path: reservas_todo.questions
class _TranslationsReservasTodoQuestionsEs implements _TranslationsReservasTodoQuestionsEn {
	_TranslationsReservasTodoQuestionsEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get one => '¿Quiere eliminar esta reserva?';
	@override String get comment => 'Si elimina esta reserva no hay marcha atrás. ¿Está seguro de hacer esta operación?';
}

// Path: reservas_todo.misReservasCanceladas
class _TranslationsReservasTodoMisReservasCanceladasEs implements _TranslationsReservasTodoMisReservasCanceladasEn {
	_TranslationsReservasTodoMisReservasCanceladasEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mis reservas canceladas';
	@override late final _TranslationsReservasTodoMisReservasCanceladasSummeryEs summery = _TranslationsReservasTodoMisReservasCanceladasSummeryEs._(_root);
}

// Path: reservas_todo.misReservasFinalizadas
class _TranslationsReservasTodoMisReservasFinalizadasEs implements _TranslationsReservasTodoMisReservasFinalizadasEn {
	_TranslationsReservasTodoMisReservasFinalizadasEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mis reservas finalizadas';
	@override late final _TranslationsReservasTodoMisReservasFinalizadasSummeryEs summery = _TranslationsReservasTodoMisReservasFinalizadasSummeryEs._(_root);
}

// Path: reservas_todo.misReservasPendientes
class _TranslationsReservasTodoMisReservasPendientesEs implements _TranslationsReservasTodoMisReservasPendientesEn {
	_TranslationsReservasTodoMisReservasPendientesEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Mis reservas pendientes';
	@override late final _TranslationsReservasTodoMisReservasPendientesSummeryEs summery = _TranslationsReservasTodoMisReservasPendientesSummeryEs._(_root);
	@override String get pay => 'Pagar';
	@override String get delete => 'Eliminar';
}

// Path: otros.cards
class _TranslationsOtrosCardsEs implements _TranslationsOtrosCardsEn {
	_TranslationsOtrosCardsEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Panel Usuario';
	@override String get misReservas => 'Mis reservas';
	@override String get reservasActivas => 'Reservas activas';
	@override String get reservasCancelas => 'Reservas canceladas';
	@override String get reservasFinalizadas => 'Reservas finalizadas';
	@override String get total => 'Total';
}

// Path: otros.favorite
class _TranslationsOtrosFavoriteEs implements _TranslationsOtrosFavoriteEn {
	_TranslationsOtrosFavoriteEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Sitios favoritos';
}

// Path: complementos.question
class _TranslationsComplementosQuestionEs implements _TranslationsComplementosQuestionEn {
	_TranslationsComplementosQuestionEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get one => '¿Quiere realizar esta acción?';
	@override String get summery => 'Para llevar a cabo esta acción, es necesario iniciar sesión primero.';
}

// Path: complementos.question2
class _TranslationsComplementosQuestion2Es implements _TranslationsComplementosQuestion2En {
	_TranslationsComplementosQuestion2Es._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get one => '¿Quieres compartir información acerca del sitio?';
	@override String get summery => 'A continuación puedes digitar el número de WhatsApp de la persona a la cual usted desea compartir la información del sito.';
}

// Path: complementos.summery
class _TranslationsComplementosSummeryEs implements _TranslationsComplementosSummeryEn {
	_TranslationsComplementosSummeryEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String one({required Object name}) => 'El sitio se llama ${name}\n';
	@override String two({required Object name}) => 'tiene una excelente ubicación en ${name} \n';
	@override String three({required Object name}) => 'tiene una capacidad de ${name} ';
	@override String four({required Object name}) => 'huéspedes y su precio es muy accesible con un costo de ${name} la noche. ¡Que esperas para reservarlo!';
}

// Path: servicios.kitchen
class _TranslationsServiciosKitchenEs implements _TranslationsServiciosKitchenEn {
	_TranslationsServiciosKitchenEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Cocina';
	@override String get text => 'Los huespedes pueden cocinar en este espacio';
}

// Path: servicios.otro
class _TranslationsServiciosOtroEs implements _TranslationsServiciosOtroEn {
	_TranslationsServiciosOtroEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get area_to_work => 'Area para trabajar';
	@override String get text => 'En un area compartido';
}

// Path: servicios.two
class _TranslationsServiciosTwoEs implements _TranslationsServiciosTwoEn {
	_TranslationsServiciosTwoEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get pets_allowed => 'Mascotas permitidas';
	@override String get no_assistance_animal_restrictions => 'No hay restricciones respecto los animales de asistencia';
}

// Path: servicios.three
class _TranslationsServiciosThreeEs implements _TranslationsServiciosThreeEn {
	_TranslationsServiciosThreeEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get private_garden => 'Jardin privado';
	@override String get open_space => 'Un espacio abierto en la propiedad generalmente cubierto de pasto';
}

// Path: lista.banks
class _TranslationsListaBanksEs implements _TranslationsListaBanksEn {
	_TranslationsListaBanksEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get one => 'BANCOLOMBIA';
	@override String get two => 'Banco de Bogotá';
	@override String get three => 'Banco caja social';
	@override String get four => 'Av Villas';
	@override String get five => 'Banco de occidente';
	@override String get six => 'Banco popular';
	@override String get seven => 'Banco agrario';
	@override String get eight => 'Davivienda';
	@override String get nine => 'Colpatria';
}

// Path: splashScreen.explora_el_Mundo
class _TranslationsSplashScreenExploraElMundoEs implements _TranslationsSplashScreenExploraElMundoEn {
	_TranslationsSplashScreenExploraElMundoEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Explora el Mundo';
	@override String get description => 'Descubre destinos inexplorados, vive experiencias únicas y crea recuerdos que durarán toda la vida. ¡Únete a la comunidad viajera y haz realidad tus sueños de viaje!';
}

// Path: splashScreen.viaja_con_Estilo
class _TranslationsSplashScreenViajaConEstiloEs implements _TranslationsSplashScreenViajaConEstiloEn {
	_TranslationsSplashScreenViajaConEstiloEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Viaja con Estilo';
	@override String get description => 'Desde playas paradisíacas hasta metrópolis emocionantes, encuentra inspiración para tu próximo viaje y descubre ofertas exclusivas que harán que tu viaje sea inolvidable.';
}

// Path: splashScreen.rutas_Secretas
class _TranslationsSplashScreenRutasSecretasEs implements _TranslationsSplashScreenRutasSecretasEn {
	_TranslationsSplashScreenRutasSecretasEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Rutas Secretas';
	@override String get description => '¿Buscas aventuras auténticas? Navega por nuestras rutas secretas y desentraña los tesoros ocultos que solo los viajeros más intrépidos conocen.';
}

// Path: splashScreen.planifica_Tu_Escape
class _TranslationsSplashScreenPlanificaTuEscapeEs implements _TranslationsSplashScreenPlanificaTuEscapeEn {
	_TranslationsSplashScreenPlanificaTuEscapeEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Planifica Tu Escape';
	@override String get description => 'Ya sea una escapada de fin de semana o un viaje de ensueño, nuestra app te ayudará a planificar el escape perfecto. ¡Deja que la aventura comience!';
}

// Path: splashScreen.viajar_Transforma
class _TranslationsSplashScreenViajarTransformaEs implements _TranslationsSplashScreenViajarTransformaEn {
	_TranslationsSplashScreenViajarTransformaEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Viajar Transforma';
	@override String get description => 'El viaje no solo cambia tus destinos, también cambia tu perspectiva. Únete a nuestra comunidad global de viajeros y descubre cómo viajar puede transformar tu vida.';
}

// Path: info_importante.question
class _TranslationsInfoImportanteQuestionEs implements _TranslationsInfoImportanteQuestionEn {
	_TranslationsInfoImportanteQuestionEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Información importante a tener en cuenta';
	@override String text({required Object name}) => 'Antes de continuar con tu reserva, debes seleccionar el número de huéspedes. Recuerda que no deben ser más que el número de huéspedes permitidos por el anfitrión del sitio. En este caso, el máximo de huéspedes es ${name}';
}

// Path: info_importante.question2
class _TranslationsInfoImportanteQuestion2Es implements _TranslationsInfoImportanteQuestion2En {
	_TranslationsInfoImportanteQuestion2Es._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String text({required Object name, required Object name2}) => 'Antes de continuar con tu reserva, por favor selecciona las fechas de entrada y salida. Las fechas registradas actualmente son desde ${name} hasta ${name2}. Para continuar, debes cambiar esas fechas por las que deseas registrar para tu viaje.';
}

// Path: cosas_faltantes.roles
class _TranslationsCosasFaltantesRolesEs implements _TranslationsCosasFaltantesRolesEn {
	_TranslationsCosasFaltantesRolesEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get text => 'Cambió de rol en el aplicativo';
	@override String get user => 'Usuario';
	@override String get admin => 'Administrador';
}

// Path: cosas_faltantes.alert
class _TranslationsCosasFaltantesAlertEs implements _TranslationsCosasFaltantesAlertEn {
	_TranslationsCosasFaltantesAlertEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get title => 'Recuperación de contraseña';
	@override String text({required Object email}) => 'Un email fue enviado a la cuenta ${email}';
	@override String get text2 => 'Ingrese su email para el restablecimiento de contraseña';
	@override String get text3 => 'Restablecer contraseña';
}

// Path: cosas_faltantes.questions
class _TranslationsCosasFaltantesQuestionsEs implements _TranslationsCosasFaltantesQuestionsEn {
	_TranslationsCosasFaltantesQuestionsEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get one => '¿Quieres eliminar este usuario?';
	@override String get summery => 'Si elimina este usuario no hay marcha atrás. ¿Está seguro de hacer esta operación?';
}

// Path: cosas_faltantes.details
class _TranslationsCosasFaltantesDetailsEs implements _TranslationsCosasFaltantesDetailsEn {
	_TranslationsCosasFaltantesDetailsEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String guests({required Object name}) => '${name} Huéspedes';
	@override String rooms({required Object name}) => '${name} Habitaciones';
	@override String beds({required Object name}) => '${name} Camas';
	@override String Bathrooms({required Object name}) => '${name} Baños';
	@override String text({required Object fecha}) => 'Se registro el: ${fecha}';
	@override String get info => 'Ver información';
	@override String get info2 => 'Información del Anfitrión';
	@override String anfi({required Object name}) => 'Anfitrión: ${name}';
	@override String get contact => 'Contacto';
	@override String get tel => 'Teléfono fijo';
}

// Path: comments.editComment.one
class _TranslationsCommentsEditCommentOneEs implements _TranslationsCommentsEditCommentOneEn {
	_TranslationsCommentsEditCommentOneEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question1 => '¿Qué tal estuvo la limpieza del lugar?';
	@override String get question2 => '¿Tuviste algún problema?';
	@override String get comment => 'Cuéntanos tu problema';
}

// Path: comments.editComment.eleccion
class _TranslationsCommentsEditCommentEleccionEs implements _TranslationsCommentsEditCommentEleccionEn {
	_TranslationsCommentsEditCommentEleccionEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get veryBad => 'Muy Mala';
	@override String get bad => 'Mala';
	@override String get basic => 'Básica';
	@override String get good => 'Buena';
	@override String get Excellent => 'Excelente';
}

// Path: comments.editComment.two
class _TranslationsCommentsEditCommentTwoEs implements _TranslationsCommentsEditCommentTwoEn {
	_TranslationsCommentsEditCommentTwoEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question1 => '¿Como estuvo tu comunicación con el anfitrión del lugar?';
}

// Path: comments.editComment.three
class _TranslationsCommentsEditCommentThreeEs implements _TranslationsCommentsEditCommentThreeEn {
	_TranslationsCommentsEditCommentThreeEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question1 => '¿Califica tu llegada al lugar?';
	@override String get question2 => '¿Qué te sucedió? ¡cuéntanos!';
}

// Path: comments.editComment.four
class _TranslationsCommentsEditCommentFourEs implements _TranslationsCommentsEditCommentFourEn {
	_TranslationsCommentsEditCommentFourEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question1 => '¿Cumplía con tus expectativas?';
	@override String get question2 => '¿Por qué no cumplió con tus expectativas?';
}

// Path: comments.editComment.five
class _TranslationsCommentsEditCommentFiveEs implements _TranslationsCommentsEditCommentFiveEn {
	_TranslationsCommentsEditCommentFiveEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question1 => '¿cuéntanos sobre la ubicación del lugar? \n ¿Te gusto?';
	@override String get question2 => '¿Qué te disgusto? ¡cuéntanos!';
}

// Path: comments.editComment.six
class _TranslationsCommentsEditCommentSixEs implements _TranslationsCommentsEditCommentSixEn {
	_TranslationsCommentsEditCommentSixEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get question1 => '¿Qué tal el precio?';
	@override String get question2 => '¿No se adapta al lugar?';
}

// Path: comments.editComment.seven
class _TranslationsCommentsEditCommentSevenEs implements _TranslationsCommentsEditCommentSevenEn {
	_TranslationsCommentsEditCommentSevenEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get comment => 'Comenta sobre nuestro lugar, recuerda que tu opinión es muy valiosa para nosotros.';
	@override String get comment2 => 'Deja tu comentario';
}

// Path: reservas_todo.reservas_canceladas.summery
class _TranslationsReservasTodoReservasCanceladasSummeryEs implements _TranslationsReservasTodoReservasCanceladasSummeryEn {
	_TranslationsReservasTodoReservasCanceladasSummeryEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Usted tiene una reserva cancelada con la siguiente información: \n';
	@override String nameSite({required Object name}) => 'Nombre del sitio: ${name}\n';
	@override String location({required Object name}) => 'Ubicación: ${name}\n';
	@override String checkInDate({required Object name}) => 'Fecha de entrada: ${name}\n';
	@override String checkOut({required Object name}) => 'Fecha de salida: ${name}';
	@override String paymentMethod({required Object name}) => 'Medios de pago: ${name}\n';
	@override String paymentDate({required Object name}) => 'Fecha de pago: ${name}\n';
	@override String total({required Object name}) => 'Número total de huéspedes:  ${name}';
	@override String totalPrice({required Object name}) => 'Precio total de la estancia: ${name}';
}

// Path: reservas_todo.totalDevoluciones.summery
class _TranslationsReservasTodoTotalDevolucionesSummeryEs implements _TranslationsReservasTodoTotalDevolucionesSummeryEn {
	_TranslationsReservasTodoTotalDevolucionesSummeryEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Usted tiene una devolución de una reserva con la siguiente información: \n';
	@override String nameSite({required Object name}) => 'Nombre del sitio: ${name}\n';
	@override String location({required Object name}) => 'Ubicación: ${name}\n';
	@override String filingDate({required Object name}) => 'Fecha de radicado: ${name}\n';
	@override String checkInDate({required Object name}) => 'Fecha de entrada: ${name}\n';
	@override String checkOut({required Object name}) => 'Fecha de salida: ${name}';
	@override String paymentMethod({required Object name}) => 'Medios de pago: ${name}\n';
	@override String paymentDate({required Object name}) => 'Fecha de pago: ${name}\n';
	@override String total({required Object name}) => 'Número total de huéspedes:  ${name}';
	@override String totalPrice({required Object name}) => 'Precio total de la estancia: ${name}';
}

// Path: reservas_todo.multas.summery
class _TranslationsReservasTodoMultasSummeryEs implements _TranslationsReservasTodoMultasSummeryEn {
	_TranslationsReservasTodoMultasSummeryEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Usted tiene una multa de una reserva con la siguiente información: \n';
	@override String nameSite({required Object name}) => 'Nombre del sitio: ${name}\n';
	@override String location({required Object name}) => 'Ubicación: ${name}\n';
	@override String filingDate({required Object name}) => 'Fecha de radicado: ${name}\n';
	@override String checkInDate({required Object name}) => 'Fecha de entrada: ${name}\n';
	@override String checkOut({required Object name}) => 'Fecha de salida: ${name}';
	@override String paymentMethod({required Object name}) => 'Medios de pago: ${name}\n';
	@override String paymentDate({required Object name}) => 'Fecha de pago: ${name}\n';
	@override String bookingValue({required Object name}) => 'Valor de la reserva: ${name}';
	@override String fineValue({required Object name}) => 'Valor de la multa: ${name}';
	@override String returnValue({required Object name}) => 'Valor a devolver: ${name}';
	@override String total({required Object name}) => 'Número total de huéspedes:  ${name}';
	@override String totalPrice({required Object name}) => 'Precio total de la estancia: ${name}';
}

// Path: reservas_todo.usuarioTotalPago.summery
class _TranslationsReservasTodoUsuarioTotalPagoSummeryEs implements _TranslationsReservasTodoUsuarioTotalPagoSummeryEn {
	_TranslationsReservasTodoUsuarioTotalPagoSummeryEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Usted hizo un pago de una reserva con la siguiente información: \n';
	@override String nameSite({required Object name}) => 'Nombre del sitio: ${name}\n';
	@override String location({required Object name}) => 'Ubicación: ${name}\n';
	@override String filingDate({required Object name}) => 'Fecha de radicado: ${name}\n';
	@override String checkInDate({required Object name}) => 'Fecha de entrada: ${name}\n';
	@override String checkOut({required Object name}) => 'Fecha de salida: ${name}';
	@override String paymentMethod({required Object name}) => 'Medios de pago: ${name}\n';
	@override String paymentDate({required Object name}) => 'Fecha de pago: ${name}\n';
	@override String total({required Object name}) => 'Número total de huéspedes:  ${name}';
	@override String totalPrice({required Object name}) => 'Precio total de la estancia: ${name}';
}

// Path: reservas_todo.misMultas.summery
class _TranslationsReservasTodoMisMultasSummeryEs implements _TranslationsReservasTodoMisMultasSummeryEn {
	_TranslationsReservasTodoMisMultasSummeryEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Usted tiene una multa con la siguiente información: \n';
	@override String nameSite({required Object name}) => 'Nombre del sitio: ${name}\n';
	@override String location({required Object name}) => 'Ubicación: ${name}\n';
	@override String checkInDate({required Object name}) => 'Fecha de entrada: ${name}\n';
	@override String checkOut({required Object name}) => 'Fecha de salida: ${name}';
	@override String bookingValue({required Object name}) => 'Valor de la reserva: ${name}';
	@override String fineValue({required Object name}) => 'Valor de la multa: ${name}';
	@override String returnValue({required Object name}) => 'Valor a devolver: ${name}';
}

// Path: reservas_todo.misReservasActivas.summery
class _TranslationsReservasTodoMisReservasActivasSummeryEs implements _TranslationsReservasTodoMisReservasActivasSummeryEn {
	_TranslationsReservasTodoMisReservasActivasSummeryEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Usted tiene una reserva activa con la siguiente información: \n';
	@override String nameSite({required Object name}) => 'Nombre del sitio: ${name}\n';
	@override String location({required Object name}) => 'Ubicación: ${name}\n';
	@override String checkInDate({required Object name}) => 'Fecha de entrada: ${name}\n';
	@override String checkOut({required Object name}) => 'Fecha de salida: ${name}';
	@override String total({required Object name}) => 'Número total de huéspedes:  ${name}';
	@override String totalPrice({required Object name}) => 'Precio total de la estancia: ${name}';
}

// Path: reservas_todo.reservas_finalizadas.summery
class _TranslationsReservasTodoReservasFinalizadasSummeryEs implements _TranslationsReservasTodoReservasFinalizadasSummeryEn {
	_TranslationsReservasTodoReservasFinalizadasSummeryEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Usted tiene una reserva finalizada con la siguiente información: \n';
	@override String nameSite({required Object name}) => 'Nombre del sitio: ${name}\n';
	@override String location({required Object name}) => 'Ubicación: ${name}\n';
	@override String checkInDate({required Object name}) => 'Fecha de entrada: ${name}\n';
	@override String checkOut({required Object name}) => 'Fecha de salida: ${name}';
	@override String total({required Object name}) => 'Número total de huéspedes:  ${name}';
	@override String totalPrice({required Object name}) => 'Precio total de la estancia: ${name}';
}

// Path: reservas_todo.reservas_pendientes.summery
class _TranslationsReservasTodoReservasPendientesSummeryEs implements _TranslationsReservasTodoReservasPendientesSummeryEn {
	_TranslationsReservasTodoReservasPendientesSummeryEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Usted tiene una reserva pendiente con la siguiente información: \n';
	@override String nameSite({required Object name}) => 'Nombre del sitio: ${name}\n';
	@override String location({required Object name}) => 'Ubicación: ${name}\n';
	@override String checkInDate({required Object name}) => 'Fecha de entrada: ${name}\n';
	@override String checkOut({required Object name}) => 'Fecha de salida: ${name}';
	@override String total({required Object name}) => 'Número total de huéspedes:  ${name}';
	@override String totalPrice({required Object name}) => 'Precio total de la estancia: ${name}';
}

// Path: reservas_todo.misReservasCanceladas.summery
class _TranslationsReservasTodoMisReservasCanceladasSummeryEs implements _TranslationsReservasTodoMisReservasCanceladasSummeryEn {
	_TranslationsReservasTodoMisReservasCanceladasSummeryEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Usted tiene una reserva cancelada con la siguiente información: \n';
	@override String nameSite({required Object name}) => 'Nombre del sitio: ${name}\n';
	@override String location({required Object name}) => 'Ubicación: ${name}\n';
	@override String checkInDate({required Object name}) => 'Fecha de entrada: ${name}\n';
	@override String checkOut({required Object name}) => 'Fecha de salida: ${name}';
	@override String total({required Object name}) => 'Número total de huéspedes:  ${name}';
	@override String totalPrice({required Object name}) => 'Precio total de la estancia: ${name}';
}

// Path: reservas_todo.misReservasFinalizadas.summery
class _TranslationsReservasTodoMisReservasFinalizadasSummeryEs implements _TranslationsReservasTodoMisReservasFinalizadasSummeryEn {
	_TranslationsReservasTodoMisReservasFinalizadasSummeryEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Usted tiene una reserva finalizada con la siguiente información: \n';
	@override String nameSite({required Object name}) => 'Nombre del sitio: ${name}\n';
	@override String location({required Object name}) => 'Ubicación: ${name}\n';
	@override String checkInDate({required Object name}) => 'Fecha de entrada: ${name}\n';
	@override String checkOut({required Object name}) => 'Fecha de salida: ${name}';
	@override String total({required Object name}) => 'Número total de huéspedes:  ${name}';
	@override String totalPrice({required Object name}) => 'Precio total de la estancia: ${name}';
}

// Path: reservas_todo.misReservasPendientes.summery
class _TranslationsReservasTodoMisReservasPendientesSummeryEs implements _TranslationsReservasTodoMisReservasPendientesSummeryEn {
	_TranslationsReservasTodoMisReservasPendientesSummeryEs._(this._root);

	@override final _TranslationsEs _root; // ignore: unused_field

	// Translations
	@override String get text1 => 'Usted tiene una reserva pendiente con la siguiente información: \n';
	@override String nameSite({required Object name}) => 'Nombre del sitio: ${name}\n';
	@override String location({required Object name}) => 'Ubicación: ${name}\n';
	@override String checkInDate({required Object name}) => 'Fecha de entrada: ${name}\n';
	@override String checkOut({required Object name}) => 'Fecha de salida: ${name}';
	@override String total({required Object name}) => 'Número total de huéspedes:  ${name}';
	@override String totalPrice({required Object name}) => 'Precio total de la estancia: ${name}';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'buscador.Searchbyregion': return 'Region';
			case 'buscador.SouthAmerica': return 'SOUTH AMERICA';
			case 'buscador.NorthAmerica': return 'NORTH AMERICA';
			case 'buscador.CentralAmerica': return 'CENTRAL AMERICA';
			case 'buscador.Europe': return 'EUROPE';
			case 'buscador.Asia': return 'ASIA';
			case 'buscador.Africa': return 'AFRICA';
			case 'buscador.Oceania': return 'OCEANIA';
			case 'buscador.Step.Date': return 'Dates';
			case 'buscador.Step.ArrivalDate': return 'Arrival date';
			case 'buscador.Step.DepartureDate': return 'Departure date';
			case 'buscador.Step2.NumberOfGuests': return 'Guests';
			case 'buscador.Step2.EnterNumberOfGuests': return 'Enter the number of guests';
			case 'buscador.Step2.LookFor': return 'Look for';
			case 'buscador.Step2.Following': return 'Following';
			case 'buscador.Step2.Back': return 'Back';
			case 'buscador.card.adults': return 'Adults';
			case 'buscador.card.age': return 'Age 13 years or older';
			case 'buscador.card.children': return 'Children';
			case 'buscador.card.from2': return 'From 2 to 12 years';
			case 'buscador.card.babys': return 'Babys';
			case 'buscador.card.less': return 'less than 2 years';
			case 'buscador.card.Pets': return 'Pets';
			case 'buscador.card.save': return 'Save';
			case 'categories.questionCategorie': return 'Do you want to delete this category?';
			case 'categories.questionCategorie2': return 'If you delete this category there is no going back. Are you sure about doing this operation?';
			case 'categories.cancel': return 'Cancel';
			case 'categories.delete': return 'Delete';
			case 'categories.categories': return 'Categories';
			case 'categories.addCategory': return 'Add Category';
			case 'categories.login': return 'Login';
			case 'From.category': return 'Category';
			case 'From.required': return 'This field is required';
			case 'From.loading': return 'Loading';
			case 'From.notIcon': return 'No icon has been selected';
			case 'From.summery': return 'When you select an icon, please wait a moment while it uploads to our server.';
			case 'From.save': return 'Save';
			case 'From.summery2': return 'When you select an image, please wait a moment while it uploads to our server. After successful upload, click the Save button located at the bottom of the form to make the changes.';
			case 'chat.write': return 'Write a message...';
			case 'chat.administrators': return 'Administrators';
			case 'chat.hosts': return 'Hosts';
			case 'chat.myGuests': return 'My Guests';
			case 'chat.users': return 'Users';
			case 'comments.site': return 'Site';
			case 'comments.cleaning': return 'Cleaning';
			case 'comments.communication': return 'Communication';
			case 'comments.arrival': return 'Arrival';
			case 'comments.reliability': return 'Reliability';
			case 'comments.location': return 'Location';
			case 'comments.price': return 'Price';
			case 'comments.comment': return 'Comment';
			case 'comments.question.question1': return 'Do you want to delete this comment?';
			case 'comments.question.question2': return 'If you delete this comment there is no going back. Are you sure about doing this operation?';
			case 'comments.editComment.one.question1': return 'How was the cleanliness of the place?';
			case 'comments.editComment.one.question2': return 'Did you have any problems?';
			case 'comments.editComment.one.comment': return 'Tell us your problem';
			case 'comments.editComment.eleccion.veryBad': return 'Very bad';
			case 'comments.editComment.eleccion.bad': return 'Bad';
			case 'comments.editComment.eleccion.basic': return 'Basic';
			case 'comments.editComment.eleccion.good': return 'Good';
			case 'comments.editComment.eleccion.Excellent': return 'Excellent';
			case 'comments.editComment.two.question1': return 'How was your communication with the host of the place?';
			case 'comments.editComment.three.question1': return 'Rate your arrival at the place?';
			case 'comments.editComment.three.question2': return 'What happened to you? !Tell us!';
			case 'comments.editComment.four.question1': return 'Did it meet your expectations?';
			case 'comments.editComment.four.question2': return 'Why didn\'t I meet your expectations?';
			case 'comments.editComment.five.question1': return 'Tell us about the location of the place? You like me?';
			case 'comments.editComment.five.question2': return 'What do you dislike? !Tell us!';
			case 'comments.editComment.six.question1': return 'How about the price?';
			case 'comments.editComment.six.question2': return 'Doesn\'t it fit the place?';
			case 'comments.editComment.seven.comment': return 'Comment about our place, remember that your opinion is very valuable to us.';
			case 'comments.editComment.seven.comment2': return 'Leave your comment';
			case 'comments.editComment.boton': return 'Edit Comment';
			case 'comments.commentPage.comments': return 'Comments';
			case 'comments.commentPage.myComments': return 'My comments';
			case 'comments.commentPage.comments2': return 'Comments on my sites';
			case 'comments.commentPage.allComments': return 'All comments';
			case 'reserva.payments': return 'Payments received';
			case 'reserva.site': return 'Site';
			case 'reserva.user': return 'User';
			case 'reserva.payDay': return 'Pay Day';
			case 'reserva.State': return 'State';
			case 'reserva.see': return 'See';
			case 'reserva.summery.text1': return 'You received a payment for a reservation with the following information: \n';
			case 'reserva.summery.nameSite': return ({required Object name}) => 'Site name: ${name}\n';
			case 'reserva.summery.location': return ({required Object name}) => 'Location: ${name}\n';
			case 'reserva.summery.checkInDate': return ({required Object name}) => 'Check in date: ${name}\n';
			case 'reserva.summery.checkOut': return ({required Object name}) => 'Check-out: ${name}';
			case 'reserva.summery.paymentMethod': return ({required Object name}) => 'Payment method: ${name}\n';
			case 'reserva.summery.paymentDate': return ({required Object name}) => 'Payment Date: ${name}\n';
			case 'reserva.summery.total': return ({required Object name}) => 'Total number of guests: ${name}';
			case 'reserva.summery.totalPrice': return ({required Object name}) => 'Total price of the stay: ${name}';
			case 'reserva.fullname': return 'Full name';
			case 'reserva.paymentDate': return 'Payment Date';
			case 'reserva.dateOfFiling': return 'Date of filing';
			case 'reserva.paymentMethod': return 'Payment method';
			case 'reserva.paymentStatus': return 'Payment Status';
			case 'reserva.entryDate': return 'Entry Date';
			case 'reserva.departureeDate': return 'Departure Date';
			case 'reserva.NumberOfGuests': return 'Number of guests';
			case 'reserva.NumberOfBabys': return 'Number of Babys';
			case 'reserva.NumberOfPets': return 'Number of Pets';
			case 'reserva.ReserveValue': return 'Reserve Value';
			case 'reserva.ValueGain': return 'Value Gain';
			case 'reserva.valueToReturn': return 'Value to return';
			case 'reserva.cerrar': return 'Close';
			case 'reserva.reserva_activa.title': return 'Active reservations for my sites';
			case 'reserva.reserva_activa.date': return 'Date';
			case 'reserva.reserva_activa.fechaReserva': return 'Reservation date';
			case 'reserva.reserva_activa.numeroAdultos': return 'Number of Adults';
			case 'reserva.reserva_activa.numeroNinhos': return 'Number of Children';
			case 'reserva.reserva_activa.fechallegada': return 'arrival date';
			case 'reserva.reserva_cancelada.title': return 'Canceled reservations from my sites';
			case 'reserva.reserva_finalizada.title': return 'Completed reservations for my sites';
			case 'mySites.title2': return 'All sites';
			case 'mySites.title': return 'My sites';
			case 'mySites.categoria': return ({required Object name}) => 'Category ${name}';
			case 'mySites.huespedes': return ({required Object name}) => 'Guests ${name}';
			case 'mySites.noche': return ({required Object name}) => '${name} nigth';
			case 'mySites.question.one': return 'Are there active reservations for this site?';
			case 'mySites.question.contenedor': return 'There are active reservations linked to this site; It will be necessary to wait for them to finish or be cancelled.';
			case 'mySites.question2.one': return 'Do you want to perform this action?';
			case 'mySites.question2.contenedor': return 'To carry out this action, you must log in first.';
			case 'mySites.question3.one': return 'Do you want to delete this site?';
			case 'mySites.question3.contenedor': return 'If you delete this site there is no going back. Are you sure about doing this operation?';
			case 'mySites.accept': return 'Accept';
			case 'reservas_todo.reservas_canceladas.title': return 'All reservations canceled';
			case 'reservas_todo.reservas_canceladas.summery.text1': return 'You have a canceled reservation with the following information: \n';
			case 'reservas_todo.reservas_canceladas.summery.nameSite': return ({required Object name}) => 'Site name: ${name}\n';
			case 'reservas_todo.reservas_canceladas.summery.location': return ({required Object name}) => 'Location: ${name}\n';
			case 'reservas_todo.reservas_canceladas.summery.checkInDate': return ({required Object name}) => 'Check in date: ${name}\n';
			case 'reservas_todo.reservas_canceladas.summery.checkOut': return ({required Object name}) => 'Check-out: ${name}';
			case 'reservas_todo.reservas_canceladas.summery.paymentMethod': return ({required Object name}) => 'Payment method: ${name}\n';
			case 'reservas_todo.reservas_canceladas.summery.paymentDate': return ({required Object name}) => 'Payment Date: ${name}\n';
			case 'reservas_todo.reservas_canceladas.summery.total': return ({required Object name}) => 'Total number of guests: ${name}';
			case 'reservas_todo.reservas_canceladas.summery.totalPrice': return ({required Object name}) => 'Total price of the stay: ${name}';
			case 'reservas_todo.totalDevoluciones.title': return 'Reservation Return';
			case 'reservas_todo.totalDevoluciones.upload_status': return 'State upload';
			case 'reservas_todo.totalDevoluciones.summery.text1': return 'You have a return for a reservation with the following information: \n';
			case 'reservas_todo.totalDevoluciones.summery.nameSite': return ({required Object name}) => 'Site name: ${name}\n';
			case 'reservas_todo.totalDevoluciones.summery.location': return ({required Object name}) => 'Location: ${name}\n';
			case 'reservas_todo.totalDevoluciones.summery.filingDate': return ({required Object name}) => 'Filing Date:: ${name}\n';
			case 'reservas_todo.totalDevoluciones.summery.checkInDate': return ({required Object name}) => 'Check in date: ${name}\n';
			case 'reservas_todo.totalDevoluciones.summery.checkOut': return ({required Object name}) => 'Check-out: ${name}';
			case 'reservas_todo.totalDevoluciones.summery.paymentMethod': return ({required Object name}) => 'Payment method: ${name}\n';
			case 'reservas_todo.totalDevoluciones.summery.paymentDate': return ({required Object name}) => 'Payment Date: ${name}\n';
			case 'reservas_todo.totalDevoluciones.summery.total': return ({required Object name}) => 'Total number of guests: ${name}';
			case 'reservas_todo.totalDevoluciones.summery.totalPrice': return ({required Object name}) => 'Total price of the stay: ${name}';
			case 'reservas_todo.multas.fines': return 'Fines';
			case 'reservas_todo.multas.booking': return 'Booking';
			case 'reservas_todo.multas.value': return 'Value';
			case 'reservas_todo.multas.summery.text1': return 'You have a fine reservation with the following information: \n';
			case 'reservas_todo.multas.summery.nameSite': return ({required Object name}) => 'Site name: ${name}\n';
			case 'reservas_todo.multas.summery.location': return ({required Object name}) => 'Location: ${name}\n';
			case 'reservas_todo.multas.summery.filingDate': return ({required Object name}) => 'Filing Date:: ${name}\n';
			case 'reservas_todo.multas.summery.checkInDate': return ({required Object name}) => 'Check in date: ${name}\n';
			case 'reservas_todo.multas.summery.checkOut': return ({required Object name}) => 'Check-out: ${name}';
			case 'reservas_todo.multas.summery.paymentMethod': return ({required Object name}) => 'Payment method: ${name}\n';
			case 'reservas_todo.multas.summery.paymentDate': return ({required Object name}) => 'Payment Date: ${name}\n';
			case 'reservas_todo.multas.summery.bookingValue': return ({required Object name}) => 'Booking value: ${name}';
			case 'reservas_todo.multas.summery.fineValue': return ({required Object name}) => 'Fine value: ${name}';
			case 'reservas_todo.multas.summery.returnValue': return ({required Object name}) => 'Return value: ${name}';
			case 'reservas_todo.multas.summery.total': return ({required Object name}) => 'Total number of guests: ${name}';
			case 'reservas_todo.multas.summery.totalPrice': return ({required Object name}) => 'Total price of the stay: ${name}';
			case 'reservas_todo.multas.fineValue': return 'Fine value';
			case 'reservas_todo.multas.returnValue': return 'Return value';
			case 'reservas_todo.totalPagosAnf.title': return 'All payments made to hosts';
			case 'reservas_todo.pagosTotalAnf.title': return 'All payments made to hosts';
			case 'reservas_todo.usuarioTotalPago.title': return 'Reservation Payments';
			case 'reservas_todo.usuarioTotalPago.summery.text1': return 'You made a payment for a reservation with the following information: \n';
			case 'reservas_todo.usuarioTotalPago.summery.nameSite': return ({required Object name}) => 'Site name: ${name}\n';
			case 'reservas_todo.usuarioTotalPago.summery.location': return ({required Object name}) => 'Location: ${name}\n';
			case 'reservas_todo.usuarioTotalPago.summery.filingDate': return ({required Object name}) => 'Filing Date:: ${name}\n';
			case 'reservas_todo.usuarioTotalPago.summery.checkInDate': return ({required Object name}) => 'Check in date: ${name}\n';
			case 'reservas_todo.usuarioTotalPago.summery.checkOut': return ({required Object name}) => 'Check-out: ${name}';
			case 'reservas_todo.usuarioTotalPago.summery.paymentMethod': return ({required Object name}) => 'Payment method: ${name}\n';
			case 'reservas_todo.usuarioTotalPago.summery.paymentDate': return ({required Object name}) => 'Payment Date: ${name}\n';
			case 'reservas_todo.usuarioTotalPago.summery.total': return ({required Object name}) => 'Total number of guests: ${name}';
			case 'reservas_todo.usuarioTotalPago.summery.totalPrice': return ({required Object name}) => 'Total price of the stay: ${name}';
			case 'reservas_todo.cancelacionReserva.question1': return 'Do you want to cancel this reservation?';
			case 'reservas_todo.cancelacionReserva.summery': return 'If you decide to cancel this reservation, a penalty may apply if cancellation is made after 48 hours. Are you sure about doing this operation?';
			case 'reservas_todo.confirmacionPago2.title': return 'Reservation information';
			case 'reservas_todo.confirmacionPago2.summery1': return 'Next, look at the information of the site you are ordering from before making payment.';
			case 'reservas_todo.confirmacionPago2.siteName': return 'Name of the site';
			case 'reservas_todo.confirmacionPago2.location': return 'Location';
			case 'reservas_todo.confirmacionPago2.guest': return ({required Object name}) => '${name} Guest';
			case 'reservas_todo.confirmacionPago2.totalCost': return 'Total cost';
			case 'reservas_todo.confirmacionPago2.qrCode': return 'QR Code';
			case 'reservas_todo.confirmacionPago2.summery2': return 'At this time, your reservation is in pending status. If you want it to be activated, please make payment via the QR code above within 48 hours. After this, when your reservation is activated, the host\'s contact will appear in our online chat to finalize details and ensure you can enjoy your stay.';
			case 'reservas_todo.misMultas.title': return 'My fines';
			case 'reservas_todo.misMultas.summery.text1': return 'You have a fine with the following information: \n';
			case 'reservas_todo.misMultas.summery.nameSite': return ({required Object name}) => 'Site name: ${name}\n';
			case 'reservas_todo.misMultas.summery.location': return ({required Object name}) => 'Location: ${name}\n';
			case 'reservas_todo.misMultas.summery.checkInDate': return ({required Object name}) => 'Check in date: ${name}\n';
			case 'reservas_todo.misMultas.summery.checkOut': return ({required Object name}) => 'Check-out: ${name}';
			case 'reservas_todo.misMultas.summery.bookingValue': return ({required Object name}) => 'Booking value: ${name}';
			case 'reservas_todo.misMultas.summery.fineValue': return ({required Object name}) => 'Fine value: ${name}';
			case 'reservas_todo.misMultas.summery.returnValue': return ({required Object name}) => 'Return value: ${name}';
			case 'reservas_todo.misDevoluciones.title': return 'My returns';
			case 'reservas_todo.misPagos.title': return 'My payments';
			case 'reservas_todo.misReservasActivas.title': return 'My active reservations';
			case 'reservas_todo.misReservasActivas.title2': return 'All active reservations';
			case 'reservas_todo.misReservasActivas.summery.text1': return 'You have a active reservation with the following information: \n';
			case 'reservas_todo.misReservasActivas.summery.nameSite': return ({required Object name}) => 'Site name: ${name}\n';
			case 'reservas_todo.misReservasActivas.summery.location': return ({required Object name}) => 'Location: ${name}\n';
			case 'reservas_todo.misReservasActivas.summery.checkInDate': return ({required Object name}) => 'Check in date: ${name}\n';
			case 'reservas_todo.misReservasActivas.summery.checkOut': return ({required Object name}) => 'Check-out: ${name}';
			case 'reservas_todo.misReservasActivas.summery.total': return ({required Object name}) => 'Total number of guests: ${name}';
			case 'reservas_todo.misReservasActivas.summery.totalPrice': return ({required Object name}) => 'Total price of the stay: ${name}';
			case 'reservas_todo.actualizacionDevoluciones.title': return 'Returns update';
			case 'reservas_todo.actualizacionDevoluciones.status': return 'Status: ';
			case 'reservas_todo.actualizacionDevoluciones.cancel': return 'Cancel';
			case 'reservas_todo.actualizacionDevoluciones.save': return 'Save';
			case 'reservas_todo.actualizacionPago.title': return 'Host Payment Update';
			case 'reservas_todo.reservas_finalizadas.title': return 'All reservations finalized';
			case 'reservas_todo.reservas_finalizadas.summery.text1': return 'You have a finalized reservation with the following information: \n';
			case 'reservas_todo.reservas_finalizadas.summery.nameSite': return ({required Object name}) => 'Site name: ${name}\n';
			case 'reservas_todo.reservas_finalizadas.summery.location': return ({required Object name}) => 'Location: ${name}\n';
			case 'reservas_todo.reservas_finalizadas.summery.checkInDate': return ({required Object name}) => 'Check in date: ${name}\n';
			case 'reservas_todo.reservas_finalizadas.summery.checkOut': return ({required Object name}) => 'Check-out: ${name}';
			case 'reservas_todo.reservas_finalizadas.summery.total': return ({required Object name}) => 'Total number of guests: ${name}';
			case 'reservas_todo.reservas_finalizadas.summery.totalPrice': return ({required Object name}) => 'Total price of the stay: ${name}';
			case 'reservas_todo.reservas_pendientes.title': return 'All pending reservations';
			case 'reservas_todo.reservas_pendientes.activate': return 'Activate';
			case 'reservas_todo.reservas_pendientes.delete': return 'Delete';
			case 'reservas_todo.reservas_pendientes.summery.text1': return 'You have a pendig reservation with the following information: \n';
			case 'reservas_todo.reservas_pendientes.summery.nameSite': return ({required Object name}) => 'Site name: ${name}\n';
			case 'reservas_todo.reservas_pendientes.summery.location': return ({required Object name}) => 'Location: ${name}\n';
			case 'reservas_todo.reservas_pendientes.summery.checkInDate': return ({required Object name}) => 'Check in date: ${name}\n';
			case 'reservas_todo.reservas_pendientes.summery.checkOut': return ({required Object name}) => 'Check-out: ${name}';
			case 'reservas_todo.reservas_pendientes.summery.total': return ({required Object name}) => 'Total number of guests: ${name}';
			case 'reservas_todo.reservas_pendientes.summery.totalPrice': return ({required Object name}) => 'Total price of the stay: ${name}';
			case 'reservas_todo.questions.one': return 'Do you want to delete this reservation?';
			case 'reservas_todo.questions.comment': return 'If you delete this reservation there is no going back. Are you sure about doing this operation?';
			case 'reservas_todo.misReservasCanceladas.title': return 'My canceled reservations';
			case 'reservas_todo.misReservasCanceladas.summery.text1': return 'You have a canceled reservation with the following information: \n';
			case 'reservas_todo.misReservasCanceladas.summery.nameSite': return ({required Object name}) => 'Site name: ${name}\n';
			case 'reservas_todo.misReservasCanceladas.summery.location': return ({required Object name}) => 'Location: ${name}\n';
			case 'reservas_todo.misReservasCanceladas.summery.checkInDate': return ({required Object name}) => 'Check in date: ${name}\n';
			case 'reservas_todo.misReservasCanceladas.summery.checkOut': return ({required Object name}) => 'Check-out: ${name}';
			case 'reservas_todo.misReservasCanceladas.summery.total': return ({required Object name}) => 'Total number of guests: ${name}';
			case 'reservas_todo.misReservasCanceladas.summery.totalPrice': return ({required Object name}) => 'Total price of the stay: ${name}';
			case 'reservas_todo.misReservasFinalizadas.title': return 'My finalized reservations';
			case 'reservas_todo.misReservasFinalizadas.summery.text1': return 'You have a finalized reservation with the following information: \n';
			case 'reservas_todo.misReservasFinalizadas.summery.nameSite': return ({required Object name}) => 'Site name: ${name}\n';
			case 'reservas_todo.misReservasFinalizadas.summery.location': return ({required Object name}) => 'Location: ${name}\n';
			case 'reservas_todo.misReservasFinalizadas.summery.checkInDate': return ({required Object name}) => 'Check in date: ${name}\n';
			case 'reservas_todo.misReservasFinalizadas.summery.checkOut': return ({required Object name}) => 'Check-out: ${name}';
			case 'reservas_todo.misReservasFinalizadas.summery.total': return ({required Object name}) => 'Total number of guests: ${name}';
			case 'reservas_todo.misReservasFinalizadas.summery.totalPrice': return ({required Object name}) => 'Total price of the stay: ${name}';
			case 'reservas_todo.misReservasPendientes.title': return 'My pending reservations';
			case 'reservas_todo.misReservasPendientes.summery.text1': return 'You have a pendig reservation with the following information: \n';
			case 'reservas_todo.misReservasPendientes.summery.nameSite': return ({required Object name}) => 'Site name: ${name}\n';
			case 'reservas_todo.misReservasPendientes.summery.location': return ({required Object name}) => 'Location: ${name}\n';
			case 'reservas_todo.misReservasPendientes.summery.checkInDate': return ({required Object name}) => 'Check in date: ${name}\n';
			case 'reservas_todo.misReservasPendientes.summery.checkOut': return ({required Object name}) => 'Check-out: ${name}';
			case 'reservas_todo.misReservasPendientes.summery.total': return ({required Object name}) => 'Total number of guests: ${name}';
			case 'reservas_todo.misReservasPendientes.summery.totalPrice': return ({required Object name}) => 'Total price of the stay: ${name}';
			case 'reservas_todo.misReservasPendientes.pay': return 'pay';
			case 'reservas_todo.misReservasPendientes.delete': return 'Delete';
			case 'otros.cards.title': return 'User panel';
			case 'otros.cards.misReservas': return 'My reservations';
			case 'otros.cards.reservasActivas': return 'Active reservations';
			case 'otros.cards.reservasCancelas': return 'Canceled reservations';
			case 'otros.cards.reservasFinalizadas': return 'Reservations completed';
			case 'otros.cards.total': return 'Total';
			case 'otros.favorite.title': return 'Favorite sites';
			case 'sitioVisitado.title': return 'Visited Sites';
			case 'dScreen.pAnfitrion': return 'Host Panel';
			case 'dScreen.pAdmin': return 'Administrator Panel';
			case 'dashboard.inicio': return 'Home';
			case 'dashboard.perfil': return 'Update Data';
			case 'dashboard.categorias': return 'Categories';
			case 'dashboard.comentario': return 'Comments';
			case 'dashboard.chats': return 'My Chats';
			case 'dashboard.sitio': return 'New Site';
			case 'dashboard.claro': return 'Light Mode';
			case 'dashboard.oscuro': return 'Dark Mode';
			case 'dashboard.sesion': return 'Logout';
			case 'habitacionDetails.title': return 'Where are you going to sleep?';
			case 'complementos.share': return 'share';
			case 'complementos.favorites': return 'Favorites';
			case 'complementos.question.one': return 'Do you want to perform this action?';
			case 'complementos.question.summery': return 'To carry out this action, you must log in first.';
			case 'complementos.question2.one': return 'Do you want to share information about the site?';
			case 'complementos.question2.summery': return 'Next you can enter the WhatsApp number of the person to whom you want to share the information on the site.';
			case 'complementos.telefono': return 'Enter the phone number';
			case 'complementos.required': return 'This field is required';
			case 'complementos.summery.one': return ({required Object name}) => 'The site is called ${name}\n';
			case 'complementos.summery.two': return ({required Object name}) => 'It has an excellent location in ${name} \n';
			case 'complementos.summery.three': return ({required Object name}) => 'it has a capacity for ${name} ';
			case 'complementos.summery.four': return ({required Object name}) => 'guests and its price is very affordable with a cost of ${name} per night. What are you waiting for to book it!';
			case 'complementos.send': return 'Send';
			case 'complementos.seeAllPhotos': return 'See all Photographies';
			case 'complementos.goTo': return 'Where you go';
			case 'complementos.searchLocation': return 'Search location';
			case 'complementos.location': return 'Location';
			case 'complementos.home': return 'Home';
			case 'complementos.night': return 'Night';
			case 'complementos.arrive': return 'Arrived';
			case 'complementos.exit': return 'Exit';
			case 'complementos.clearnCOst': return 'Cleaning fee';
			case 'complementos.payAndConfirm': return 'Confirm and pay';
			case 'complementos.info': return 'Information about your trip';
			case 'complementos.yourTotal': return 'Your total';
			case 'complementos.confirm': return 'Confirm payment';
			case 'complementos.totalCOP': return 'Total (COP)';
			case 'complementos.guest': return 'Guests';
			case 'serviciosDetails.summery': return ({required Object name}) => 'Show ${name} services';
			case 'serviciosDetails.ofrece': return 'What this place offers';
			case 'showHuesped.adults': return 'Adults';
			case 'showHuesped.age': return 'Age 13 years or older';
			case 'showHuesped.children': return 'Children';
			case 'showHuesped.from': return 'From 2 to 12 years';
			case 'showHuesped.babys': return 'Babys';
			case 'showHuesped.less': return 'less than 2 years';
			case 'showHuesped.pets': return 'Pets';
			case 'showHuesped.save': return 'Save';
			case 'inferiorDetails.rules': return 'House Rules';
			case 'inferiorDetails.securityAndPrivacy': return 'Security and privacy';
			case 'inferiorDetails.polices': return 'Cancellation policies';
			case 'inferiorDetails.reglasSitio': return 'Site rules';
			case 'inferiorDetails.seguridad': return 'Security and site ownership';
			case 'inferiorDetails.cancelacion': return 'Free cancellation for 48 hours';
			case 'servicios.wifi': return 'Wifi';
			case 'servicios.piscina': return 'Piscina';
			case 'servicios.kitchen.title': return 'Kitchen';
			case 'servicios.kitchen.text': return 'Guests can cook in this space';
			case 'servicios.jacuzzi': return 'Jacuzzi';
			case 'servicios.bodySoap': return 'Body soap';
			case 'servicios.shampoo': return 'Shampoo';
			case 'servicios.shocked_Refrigerator': return 'Assorted refrigerator';
			case 'servicios.assorted_Minibar': return 'Assorted minibar';
			case 'servicios.microwave': return 'Microwave';
			case 'servicios.grill': return 'Grill';
			case 'servicios.coffee_Maker': return 'Coffee maker';
			case 'servicios.autonomous_Entry': return 'Autonomous entry';
			case 'servicios.hot_Water': return 'Hot water';
			case 'servicios.air_conditioning': return 'Air conditioning';
			case 'servicios.washer_Dryer': return 'Washer dryer';
			case 'servicios.television_or_cable': return 'Television or cable';
			case 'servicios.chimney': return 'Chimney';
			case 'servicios.parking_lot': return 'Parking lot';
			case 'servicios.good_lighting': return 'Good lighting';
			case 'servicios.otro.area_to_work': return 'Area para trabajar';
			case 'servicios.otro.text': return 'in a shared area';
			case 'servicios.office_supplies': return 'Office supplies';
			case 'servicios.security_cameras': return 'Security cameras on the property';
			case 'servicios.luggage_storage': return 'Luggage storage';
			case 'servicios.towel_per_guest': return 'Towel per guest';
			case 'servicios.pillow_per_guest': return 'Pillow per guest';
			case 'servicios.bed_sheets': return 'Bed sheets for each bed';
			case 'servicios.cleaning_products': return 'Cleaning products';
			case 'servicios.bedding': return 'Bedding';
			case 'servicios.equipped_kitchen': return 'Equipped kitchen';
			case 'servicios.hair_dryer': return 'Hair dryer';
			case 'servicios.iron_and_board': return 'Iron and board';
			case 'servicios.smoke_detector': return 'Smoke detector';
			case 'servicios.carbon_monoxide_detector': return 'Carbon monoxide detector';
			case 'servicios.fire_extinguisher': return 'Fire extinguisher';
			case 'servicios.first_aid_kit': return 'First aid kit';
			case 'servicios.child_seat': return 'Child seat';
			case 'servicios.board_games': return 'Board games';
			case 'servicios.free_bicycles': return 'Free bicycles';
			case 'servicios.gym': return 'Gym';
			case 'servicios.sauna': return 'Sauna';
			case 'servicios.patio_or_terrace': return 'Patio or terrace';
			case 'servicios.daily_cleaning_service': return 'Daily cleaning service';
			case 'servicios.lake_view': return 'Lake view';
			case 'servicios.ocean_view': return 'Ocean view';
			case 'servicios.safe_box': return 'Safe box';
			case 'servicios.concierge_service': return 'Concierge service';
			case 'servicios.two.pets_allowed': return 'Pets allowed';
			case 'servicios.two.no_assistance_animal_restrictions': return 'No restrictions regarding assistance animals';
			case 'servicios.car_rental': return 'Car rental';
			case 'servicios.local_tour_guide': return 'Local tour guide';
			case 'servicios.babysitting_service': return 'Babysitting service';
			case 'servicios.musical_instruments': return 'Musical instruments';
			case 'servicios.customized_tours': return 'Customized tours';
			case 'servicios.three.private_garden': return 'Private garden';
			case 'servicios.three.open_space': return 'Open space generally covered in grass';
			case 'servicios.crib': return 'Crib';
			case 'servicios.catering_services': return 'Catering services';
			case 'servicios.sound_system': return 'Sound system';
			case 'servicios.streaming_service': return 'Streaming service';
			case 'servicios.welcome_kit': return 'Welcome kit';
			case 'servicios.boat_service': return 'Boat service';
			case 'servicios.restaurant_discounts': return 'Restaurant discounts';
			case 'from_habitacion.title': return 'Title';
			case 'from_habitacion.required': return 'This field is required';
			case 'from_habitacion.description': return 'Description';
			case 'from_habitacion.add': return 'Add room';
			case 'from_habitacion.save': return 'Save Rooms';
			case 'serviciosScreen.select': return 'Select your services';
			case 'serviciosScreen.description': return 'Below, you will find several services. Select those that your property offers. At the bottom of this list, you will find a button in which you will save the selected services to our server.';
			case 'serviciosScreen.save': return 'Save Services';
			case 'formularioSitio.save': return 'Save';
			case 'formularioSitio.Continue': return 'Continue';
			case 'formularioSitio.loading': return 'Loading';
			case 'pantallaUno.Agrega_tu_Sitio': return 'Add Your Site';
			case 'pantallaUno.Categoria': return 'Category';
			case 'pantallaUno.Titulo_del_sitio': return 'Site Title';
			case 'pantallaUno.Se_requiere_de_este_campo': return 'This Field is Required';
			case 'pantallaUno.Numero_de_Huespedes': return 'Number of Guests';
			case 'pantallaUno.Numero_de_Camas': return 'Number of Beds';
			case 'pantallaUno.Numero_de_Banos': return 'Number of Bathrooms';
			case 'pantallaUno.Descripcion': return 'Description';
			case 'pantallaDos.america_del_sur': return 'South America';
			case 'pantallaDos.america_del_norte': return 'North America';
			case 'pantallaDos.centro_america': return 'Central America';
			case 'pantallaDos.europa': return 'Europe';
			case 'pantallaDos.asia': return 'Asia';
			case 'pantallaDos.africa': return 'Africa';
			case 'pantallaDos.oceania': return 'Oceania';
			case 'pantallaDos.valor_noche': return 'Nightly Rate';
			case 'pantallaDos.se_requiere_de_este_campo': return 'This field is required';
			case 'pantallaDos.lugar': return 'Location';
			case 'pantallaDos.descripcion_del_lugar': return 'Location Description';
			case 'pantallaDos.continente': return 'Continent';
			case 'pantallaDos.text': return 'We need the latitude and longitude of your property as we manage a map that will show your future guests the exact location. You can find this data on Google Maps or on your preferred location app.';
			case 'pantallaDos.longitud': return 'Longitude';
			case 'pantallaDos.latitud': return 'Latitude';
			case 'pantallaTres.valor_limpieza': return 'Cleaning value';
			case 'pantallaTres.se_requiere_de_este_campo': return 'This field is required';
			case 'pantallaTres.texts1': return 'Clicking on the rooms field will display a button. Use it to add the title and a description about the room you\'re about to add.';
			case 'pantallaTres.habitaciones': return 'Rooms';
			case 'pantallaTres.agregar': return 'Add';
			case 'pantallaTres.aceptar_terminos_y_condiciones': return 'Accept Terms and Conditions';
			case 'pantallaTres.texts2': return 'To access our terms and conditions, please click on the following button';
			case 'pantallaTres.terminos_y_condiciones': return 'Terms and Conditions';
			case 'pantallaTres.anadir_imagenes': return 'Add Images';
			case 'pantallaTres.anadir_mas': return 'Add More';
			case 'pantallaTres.texts3': return 'After selecting your images, click on the upload icon to save them to our server. This process may take time depending on the number of images you\'re uploading.';
			case 'pantallaCuatro.siteRules': return 'Site rules';
			case 'pantallaCuatro.rules': return 'Rules';
			case 'pantallaCuatro.required': return 'This field is required';
			case 'pantallaCuatro.siteSecurity': return 'Site security';
			case 'pantallaCuatro.security': return 'Security';
			case 'actualizacionUno.actualiza_tu_sitio': return 'Update Your Site';
			case 'actualizacionUno.title': return 'Title';
			case 'actualizacionUno.descripcion_del_sitio': return 'Site Description';
			case 'actualizacionUno.numero_de_huespedes': return 'Number of Guests';
			case 'actualizacionUno.valor_noche': return 'Nightly Rate';
			case 'actualizacionUno.descripcion_del_lugar': return 'Location Description';
			case 'actualizacionUno.texts1': return 'We need the latitude and longitude of your property as we manage a map that will show your future guests the exact location. You can find this data on Google Maps or on your preferred location app.';
			case 'actualizacionUno.latitud': return 'Latitude';
			case 'actualizacionUno.longitud': return 'Longitude';
			case 'actualizacionUno.valor_de_la_limpieza': return 'Cleaning Fee';
			case 'actualizacionUno.guardar': return 'Save';
			case 'search.spanish': return 'Spanish';
			case 'search.english': return 'English';
			case 'search.login': return 'Login';
			case 'search.close': return 'Close';
			case 'identificacionClases.error_al_verificar_credenciales': return 'Error verifying credentials.';
			case 'identificacionClases.cerrar': return 'Close';
			case 'identificacionClases.iniciar_sesion': return 'Log in';
			case 'identificacionClases.viaja_con_estilo_destinos_de_ensueno_a_tu_alcance': return 'Travel in Style, Dream Destinations Within Your Reach';
			case 'identificacionClases.diga_la_siguiente_palabra': return 'Say the following word:';
			case 'identificacionClases.texts1': return 'Discover unexplored destinations, live unique experiences, and create memories that will last a lifetime. Join the traveler community and make your travel dreams come true!';
			case 'identificacionClases.authentication': return 'Authentication';
			case 'identificacionClases.password': return 'Change of password';
			case 'identificacionClases.message': return 'Your password has been changed successfully!';
			case 'identificacionClases.accept': return 'Accept';
			case 'identificacionClases.email': return 'E-mail';
			case 'identificacionClases.pass': return 'Password';
			case 'identificacionClases.forgot': return 'Forgot password?';
			case 'pruebaEdit.actualizar_datos': return 'Update Data';
			case 'pruebaEdit.texts1': return 'Update your data and don\'t miss the opportunity to enjoy the best vacation of your life! Do it now and live the experience to the fullest!';
			case 'pruebaEdit.telefono': return 'Phone';
			case 'pruebaEdit.se_requiere_de_un_numero_de_telefono': return 'A phone number is required';
			case 'pruebaEdit.idioma': return 'Language';
			case 'pruebaEdit.quieres_agregar_una_descripcion': return 'Would you like to add a description?';
			case 'pruebaEdit.descripcion': return 'Description';
			case 'pruebaEdit.nombre_completo': return 'Full Name';
			case 'pruebaEdit.tipo_de_documento': return 'Document Type';
			case 'pruebaEdit.numero_de_documento': return 'Document Number';
			case 'pruebaEdit.texts2': return 'You will register as a user and host. We request your bank details to make the respective payments in case you offer a rental site. Also, in case of canceling a reservation, this information will help us make the respective refund of your money.';
			case 'pruebaEdit.bank': return 'Bank';
			case 'pruebaEdit.numero_de_daviplata': return 'Daviplata Number';
			case 'pruebaEdit.contrasena': return 'Password';
			case 'pruebaEdit.confirmacion_de_contrasena': return 'Password Confirmation';
			case 'pruebaEdit.cambiar_contrasena': return 'Change Password';
			case 'pruebaEdit.telefono_celular': return 'Cell Phone';
			case 'pruebaEdit.seleccionar_foto_de_perfil': return 'Select Profile Picture';
			case 'pruebaEdit.listo': return 'Done';
			case 'pruebaEdit.cargando': return 'Loading';
			case 'pruebaEdit.texts3': return 'When you select your profile picture, please wait a moment while it loads on our server. Be sure to scroll to the bottom of this form and save the changes for the new profile picture to be applied correctly. If you do not complete this step, the selected image will not be saved as your new profile picture.';
			case 'clases.singnIn': return 'Sign In';
			case 'clases.singUp': return 'Sign Up';
			case 'lista.cc': return 'Citizenship card';
			case 'lista.ce': return 'Foreigner ID';
			case 'lista.pass': return 'Passport';
			case 'lista.nit': return 'Tax identification number';
			case 'lista.banks.one': return 'BANCOLOMBIA';
			case 'lista.banks.two': return 'Bank of Bogota';
			case 'lista.banks.three': return 'Social housing Bank';
			case 'lista.banks.four': return 'Av Villas';
			case 'lista.banks.five': return 'Western Bank';
			case 'lista.banks.six': return 'Popular Bank';
			case 'lista.banks.seven': return 'Agrarian Bank';
			case 'lista.banks.eight': return 'Davivienda';
			case 'lista.banks.nine': return 'Colpatria';
			case 'register.register': return 'Register';
			case 'register.text1': return 'What are you waiting for to register? Don\'t hold back from enjoying the best vacation of your life!';
			case 'register.tel': return 'Phone';
			case 'register.requiredPhone': return 'A phone number is required';
			case 'register.lenguaje': return 'Language';
			case 'pruebaTres.sing_up': return 'Sign Up';
			case 'pruebaTres.text1': return 'You will register as a user and host. We request your bank details to make the respective payments in case you offer a rental site. Also, in case of canceling a reservation, this information will help us make the respective refund of your money.';
			case 'pruebaTres.bank': return 'Bank';
			case 'pruebaTres.daviplata': return 'Daviplata Number';
			case 'pruebaTres.contrasena_incorrecta': return 'Incorrect password';
			case 'menu_pdf.text1': return 'Document printed successfully';
			case 'menu_pdf.text2': return 'Document shared successfully';
			case 'pdf.factura': return 'StayAway invoice';
			case 'pdf.information': return 'StayAway Information';
			case 'pdf.telefono': return ({required Object name}) => 'Phone: ${name}';
			case 'pdf.nombre_del_sitio': return ({required Object name}) => 'Site name: ${name}';
			case 'pdf.nombre_del_cliente': return ({required Object name}) => 'Client name: ${name}';
			case 'pdf.documento': return ({required Object name}) => 'Document: ${name}';
			case 'pdf.informacion_reserva': return 'Information about your reservation';
			case 'splashScreen.explora_el_Mundo.title': return 'Explore the World';
			case 'splashScreen.explora_el_Mundo.description': return 'Discover unexplored destinations, live unique experiences, and create memories that will last a lifetime. Join the travel community and make your travel dreams come true!';
			case 'splashScreen.viaja_con_Estilo.title': return 'Travel in Style';
			case 'splashScreen.viaja_con_Estilo.description': return 'From paradisiacal beaches to exciting metropolises, find inspiration for your next trip and discover exclusive deals that will make your journey unforgettable.';
			case 'splashScreen.rutas_Secretas.title': return 'Secret Routes';
			case 'splashScreen.rutas_Secretas.description': return 'Are you looking for authentic adventures? Navigate through our secret routes and uncover the hidden treasures that only the most intrepid travelers know.';
			case 'splashScreen.planifica_Tu_Escape.title': return 'Plan Your Escape';
			case 'splashScreen.planifica_Tu_Escape.description': return 'Whether it\'s a weekend getaway or a dream trip, our app will help you plan the perfect escape. Let the adventure begin!';
			case 'splashScreen.viajar_Transforma.title': return 'Travel Transforms';
			case 'splashScreen.viajar_Transforma.description': return 'Travel not only changes your destinations, it also changes your perspective. Join our global community of travelers and discover how travel can transform your life.';
			case 'splashScreen.skip': return 'Skip';
			case 'info_importante.question.title': return 'Important Information to Consider';
			case 'info_importante.question.text': return ({required Object name}) => 'Before proceeding with your reservation, you must select the number of guests. Remember that they must not exceed the number of guests allowed by the site host. In this case, the maximum number of guests is ${name}';
			case 'info_importante.question2.text': return ({required Object name, required Object name2}) => 'Before continuing with your reservation, please select the check-in and check-out dates. The currently registered dates are from ${name} to ${name2}. To continue, you must change these dates to the ones you wish to book for your trip.';
			case 'cosas_faltantes.reset': return 'Reiniciar';
			case 'cosas_faltantes.select': return 'Select Icon';
			case 'cosas_faltantes.selectImage': return 'Select Image';
			case 'cosas_faltantes.roles.text': return 'Change of role in the application';
			case 'cosas_faltantes.roles.user': return 'User';
			case 'cosas_faltantes.roles.admin': return 'Admin';
			case 'cosas_faltantes.info': return ({required Object date1, required Object date2}) => 'The following dates from ${date1} to ${date2} are reserved';
			case 'cosas_faltantes.alert.title': return 'Password recovery';
			case 'cosas_faltantes.alert.text': return ({required Object email}) => 'An email was sent to the account ${email}';
			case 'cosas_faltantes.alert.text2': return 'Enter your email to reset your password';
			case 'cosas_faltantes.alert.text3': return 'Restore password';
			case 'cosas_faltantes.all': return 'All users';
			case 'cosas_faltantes.name': return 'Name';
			case 'cosas_faltantes.mail': return 'Mail';
			case 'cosas_faltantes.rol': return 'Role';
			case 'cosas_faltantes.update': return 'Update rol';
			case 'cosas_faltantes.number': return 'Account number';
			case 'cosas_faltantes.date': return 'Registration date';
			case 'cosas_faltantes.questions.one': return 'Do you want to delete this user?';
			case 'cosas_faltantes.questions.summery': return 'If you delete this user there is no going back. Are you sure about doing this operation?';
			case 'cosas_faltantes.details.guests': return ({required Object name}) => '${name} guests';
			case 'cosas_faltantes.details.rooms': return ({required Object name}) => '${name} Rooms';
			case 'cosas_faltantes.details.beds': return ({required Object name}) => '${name} Bads';
			case 'cosas_faltantes.details.Bathrooms': return ({required Object name}) => '${name} Bathrooms';
			case 'cosas_faltantes.details.text': return ({required Object fecha}) => 'Registration on: ${fecha}';
			case 'cosas_faltantes.details.info': return 'See information';
			case 'cosas_faltantes.details.info2': return 'Host Information';
			case 'cosas_faltantes.details.anfi': return ({required Object name}) => 'Host: ${name}';
			case 'cosas_faltantes.details.contact': return 'Contact';
			case 'cosas_faltantes.details.tel': return 'Landline';
			case 'cosas_faltantes.disponibilidad': return 'Availability';
			case 'cosas_faltantes.summery': return 'There are no comments available';
			case 'cosas_faltantes.add': return 'Add comments';
			case 'cosas_faltantes.send': return 'Send comment';
			case 'cosas_faltantes.noche': return ({required Object name}) => '${name} nigths';
			case 'cosas_faltantes.modalText': return 'About this space';
			case 'cosas_faltantes.showMore': return 'Show More >';
			case 'modalInfor.texts': return 'Before continuing, check that all fields are correct.';
			case 'texts1': return 'Hello, in case you still don\'t know how to generate a reservation in our app, you can watch a video that we have generated for you so that you know more about our features.';
			case 'textS': return 'If you are registering a site for the first time, we invite you to watch the following video.';
			case 'botonS': return 'Watch the video';
			case 'botonV': return 'Go now to the video';
			case 'administradorE': return 'Administrator';
			case 'usuarioE': return 'User';
			case 'pendienteE': return 'Earring';
			case 'finalizadoE': return 'Finalized';
			case 'huella1': return 'Please scan your fingerprint to confirm your reservation';
			case 'huella2': return 'Please scan your fingerprint to access';
			case 'voz1': return 'Please keep the button pressed while speaking. Once you\'ve finished, release it and press it again to log in';
			case 'voz2': return 'Please hold down the button while speaking. Once you\'ve finished speaking, release it and press it again to make the reservation';
			default: return null;
		}
	}
}

extension on _TranslationsEs {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'buscador.Searchbyregion': return 'Región';
			case 'buscador.SouthAmerica': return 'AMÉRICA DEL SUR';
			case 'buscador.NorthAmerica': return 'AMÉRICA DEL NORTE';
			case 'buscador.CentralAmerica': return 'CENTROAMÉRICA';
			case 'buscador.Europe': return 'EUROPA';
			case 'buscador.Asia': return 'ASIA';
			case 'buscador.Africa': return 'ÁFRICA';
			case 'buscador.Oceania': return 'OCEANIA';
			case 'buscador.Step.Date': return 'Fechas';
			case 'buscador.Step.ArrivalDate': return 'Fecha de llegada';
			case 'buscador.Step.DepartureDate': return 'Fecha de salida';
			case 'buscador.Step2.NumberOfGuests': return 'Huéspedes';
			case 'buscador.Step2.EnterNumberOfGuests': return 'Ingrese el número de huéspedes';
			case 'buscador.Step2.LookFor': return 'Buscar';
			case 'buscador.Step2.Following': return 'Siguiente';
			case 'buscador.Step2.Back': return 'Atrás';
			case 'buscador.card.adults': return 'Adultos';
			case 'buscador.card.age': return 'Edad de 13 años o más';
			case 'buscador.card.children': return 'Niños';
			case 'buscador.card.from2': return 'De 2 a 12 años';
			case 'buscador.card.babys': return 'Bebes';
			case 'buscador.card.less': return 'Menos de 12 años';
			case 'buscador.card.Pets': return 'Mascotas';
			case 'buscador.card.save': return 'Guardar';
			case 'categories.questionCategorie': return '¿Quiere eliminar esta categoría?';
			case 'categories.questionCategorie2': return 'Si elimina esta categoría no hay marcha atras. ¿Esta seguro de hacer esta operación?';
			case 'categories.cancel': return 'Cancelar';
			case 'categories.delete': return 'Eliminar';
			case 'categories.categories': return 'Categorías';
			case 'categories.addCategory': return 'Añadir Categoría';
			case 'categories.login': return 'Iniciar Sesión';
			case 'From.category': return 'Categoría';
			case 'From.required': return 'Se requiere este campo';
			case 'From.loading': return 'Cargando';
			case 'From.notIcon': return 'No se ha seleccionado ningún icono';
			case 'From.summery': return 'Cuando seleccione un icono, por favor, espere un momento mientras se carga en nuestro servidor.';
			case 'From.save': return 'Guardar';
			case 'From.summery2': return 'Cuando seleccione una imagen, por favor, espere un momento mientras se carga en nuestro servidor. Después de la carga exitosa, haga clic en el botón Guardar ubicado al final del formulario para efectuar los cambios.';
			case 'chat.write': return 'Escribir mensaje';
			case 'chat.administrators': return 'Administradores';
			case 'chat.hosts': return 'Anfitriones';
			case 'chat.myGuests': return 'Mis huéspedes';
			case 'chat.users': return 'Usuarios';
			case 'comments.site': return 'Sitio';
			case 'comments.cleaning': return 'Limpieza';
			case 'comments.communication': return 'Comunicación';
			case 'comments.arrival': return 'Llegada';
			case 'comments.reliability': return 'Fiabilidad';
			case 'comments.location': return 'Ubicación';
			case 'comments.price': return 'Precio';
			case 'comments.comment': return 'Comentario';
			case 'comments.question.question1': return '¿Quiere eliminar este comentario?';
			case 'comments.question.question2': return 'Si elimina este comentario no hay marcha atrás. ¿Está seguro de hacer esta operación?.';
			case 'comments.editComment.one.question1': return '¿Qué tal estuvo la limpieza del lugar?';
			case 'comments.editComment.one.question2': return '¿Tuviste algún problema?';
			case 'comments.editComment.one.comment': return 'Cuéntanos tu problema';
			case 'comments.editComment.eleccion.veryBad': return 'Muy Mala';
			case 'comments.editComment.eleccion.bad': return 'Mala';
			case 'comments.editComment.eleccion.basic': return 'Básica';
			case 'comments.editComment.eleccion.good': return 'Buena';
			case 'comments.editComment.eleccion.Excellent': return 'Excelente';
			case 'comments.editComment.two.question1': return '¿Como estuvo tu comunicación con el anfitrión del lugar?';
			case 'comments.editComment.three.question1': return '¿Califica tu llegada al lugar?';
			case 'comments.editComment.three.question2': return '¿Qué te sucedió? ¡cuéntanos!';
			case 'comments.editComment.four.question1': return '¿Cumplía con tus expectativas?';
			case 'comments.editComment.four.question2': return '¿Por qué no cumplió con tus expectativas?';
			case 'comments.editComment.five.question1': return '¿cuéntanos sobre la ubicación del lugar? \n ¿Te gusto?';
			case 'comments.editComment.five.question2': return '¿Qué te disgusto? ¡cuéntanos!';
			case 'comments.editComment.six.question1': return '¿Qué tal el precio?';
			case 'comments.editComment.six.question2': return '¿No se adapta al lugar?';
			case 'comments.editComment.seven.comment': return 'Comenta sobre nuestro lugar, recuerda que tu opinión es muy valiosa para nosotros.';
			case 'comments.editComment.seven.comment2': return 'Deja tu comentario';
			case 'comments.editComment.boton': return 'Editar Comentario';
			case 'comments.commentPage.comments': return 'Comentarios';
			case 'comments.commentPage.myComments': return 'Mis comentarios';
			case 'comments.commentPage.comments2': return 'Comentarios en mis sitios';
			case 'comments.commentPage.allComments': return 'Todos los comentarios';
			case 'reserva.payments': return 'Pagos Recibidos';
			case 'reserva.site': return 'Sitio';
			case 'reserva.user': return 'Usuario';
			case 'reserva.payDay': return 'Fecha Pago';
			case 'reserva.State': return 'Estado';
			case 'reserva.see': return 'Ver';
			case 'reserva.summery.text1': return 'Recibiste un pago por una reserva con la siguiente información: \n';
			case 'reserva.summery.nameSite': return ({required Object name}) => 'Nombre del sitio: ${name}\n';
			case 'reserva.summery.location': return ({required Object name}) => 'Ubicación: ${name}\n';
			case 'reserva.summery.checkInDate': return ({required Object name}) => 'Fecha de entrada: ${name}\n';
			case 'reserva.summery.checkOut': return ({required Object name}) => 'Fecha de salida: ${name}';
			case 'reserva.summery.paymentMethod': return ({required Object name}) => 'Medios de pago: ${name}\n';
			case 'reserva.summery.paymentDate': return ({required Object name}) => 'Fecha de pago: ${name}\n';
			case 'reserva.summery.total': return ({required Object name}) => 'Número total de huéspedes: ${name}';
			case 'reserva.summery.totalPrice': return ({required Object name}) => 'Precio total de la estancia: ${name}';
			case 'reserva.fullname': return 'Nombre Completo';
			case 'reserva.paymentDate': return 'Fecha de pago';
			case 'reserva.dateOfFiling': return 'Fecha del radicado';
			case 'reserva.paymentMethod': return 'Medio de Pago';
			case 'reserva.paymentStatus': return 'Estado de pago';
			case 'reserva.entryDate': return 'Fecha de entrada';
			case 'reserva.departureeDate': return 'Fecha de salida';
			case 'reserva.NumberOfGuests': return 'Número de huéspedes';
			case 'reserva.NumberOfBabys': return 'Número de Bebes';
			case 'reserva.NumberOfPets': return 'Número de Mascotas';
			case 'reserva.ReserveValue': return 'Valor Reserva';
			case 'reserva.ValueGain': return 'Valor Ganancia';
			case 'reserva.valueToReturn': return 'Valor a devolver';
			case 'reserva.cerrar': return 'Cerrar';
			case 'reserva.reserva_activa.title': return 'Reservas activas de mis sitios';
			case 'reserva.reserva_activa.date': return 'Fecha';
			case 'reserva.reserva_activa.fechaReserva': return 'Fecha reserva';
			case 'reserva.reserva_activa.numeroAdultos': return 'Número de adultos';
			case 'reserva.reserva_activa.numeroNinhos': return 'Número de niños';
			case 'reserva.reserva_activa.fechallegada': return 'fecha de llegada';
			case 'reserva.reserva_cancelada.title': return 'Reservas canceladas de mis sitios';
			case 'reserva.reserva_finalizada.title': return 'Reservas finalizadas de mis sitios';
			case 'mySites.title2': return 'Todos los sitios';
			case 'mySites.title': return 'Mis sitios';
			case 'mySites.categoria': return ({required Object name}) => 'Categoría ${name}';
			case 'mySites.huespedes': return ({required Object name}) => 'Huéspedes ${name}';
			case 'mySites.noche': return ({required Object name}) => '${name} noche';
			case 'mySites.question.one': return '¿Hay reservas activas de este sitio?';
			case 'mySites.question.contenedor': return 'Existen reservas activas vinculadas a este sitio; será necesario esperar a que estas finalicen o se cancelen.';
			case 'mySites.question2.one': return '¿Quiere realizar esta acción?';
			case 'mySites.question2.contenedor': return 'Para llevar a cabo esta acción, es necesario iniciar sesión primero.';
			case 'mySites.question3.one': return '¿Quiere eliminar este sitio?';
			case 'mySites.question3.contenedor': return 'Si elimina este sitio no hay marcha atrás. ¿Está seguro de hacer esta operación?';
			case 'mySites.accept': return 'Aceptar';
			case 'reservas_todo.reservas_canceladas.title': return 'Todas las reservas canceladas';
			case 'reservas_todo.reservas_canceladas.summery.text1': return 'Usted tiene una reserva cancelada con la siguiente información: \n';
			case 'reservas_todo.reservas_canceladas.summery.nameSite': return ({required Object name}) => 'Nombre del sitio: ${name}\n';
			case 'reservas_todo.reservas_canceladas.summery.location': return ({required Object name}) => 'Ubicación: ${name}\n';
			case 'reservas_todo.reservas_canceladas.summery.checkInDate': return ({required Object name}) => 'Fecha de entrada: ${name}\n';
			case 'reservas_todo.reservas_canceladas.summery.checkOut': return ({required Object name}) => 'Fecha de salida: ${name}';
			case 'reservas_todo.reservas_canceladas.summery.paymentMethod': return ({required Object name}) => 'Medios de pago: ${name}\n';
			case 'reservas_todo.reservas_canceladas.summery.paymentDate': return ({required Object name}) => 'Fecha de pago: ${name}\n';
			case 'reservas_todo.reservas_canceladas.summery.total': return ({required Object name}) => 'Número total de huéspedes:  ${name}';
			case 'reservas_todo.reservas_canceladas.summery.totalPrice': return ({required Object name}) => 'Precio total de la estancia: ${name}';
			case 'reservas_todo.totalDevoluciones.title': return 'Devolución de Reservaciones';
			case 'reservas_todo.totalDevoluciones.upload_status': return 'Actualizar Estado';
			case 'reservas_todo.totalDevoluciones.summery.text1': return 'Usted tiene una devolución de una reserva con la siguiente información: \n';
			case 'reservas_todo.totalDevoluciones.summery.nameSite': return ({required Object name}) => 'Nombre del sitio: ${name}\n';
			case 'reservas_todo.totalDevoluciones.summery.location': return ({required Object name}) => 'Ubicación: ${name}\n';
			case 'reservas_todo.totalDevoluciones.summery.filingDate': return ({required Object name}) => 'Fecha de radicado: ${name}\n';
			case 'reservas_todo.totalDevoluciones.summery.checkInDate': return ({required Object name}) => 'Fecha de entrada: ${name}\n';
			case 'reservas_todo.totalDevoluciones.summery.checkOut': return ({required Object name}) => 'Fecha de salida: ${name}';
			case 'reservas_todo.totalDevoluciones.summery.paymentMethod': return ({required Object name}) => 'Medios de pago: ${name}\n';
			case 'reservas_todo.totalDevoluciones.summery.paymentDate': return ({required Object name}) => 'Fecha de pago: ${name}\n';
			case 'reservas_todo.totalDevoluciones.summery.total': return ({required Object name}) => 'Número total de huéspedes:  ${name}';
			case 'reservas_todo.totalDevoluciones.summery.totalPrice': return ({required Object name}) => 'Precio total de la estancia: ${name}';
			case 'reservas_todo.multas.fines': return 'Multas';
			case 'reservas_todo.multas.booking': return 'Reserva';
			case 'reservas_todo.multas.value': return 'Valor';
			case 'reservas_todo.multas.summery.text1': return 'Usted tiene una multa de una reserva con la siguiente información: \n';
			case 'reservas_todo.multas.summery.nameSite': return ({required Object name}) => 'Nombre del sitio: ${name}\n';
			case 'reservas_todo.multas.summery.location': return ({required Object name}) => 'Ubicación: ${name}\n';
			case 'reservas_todo.multas.summery.filingDate': return ({required Object name}) => 'Fecha de radicado: ${name}\n';
			case 'reservas_todo.multas.summery.checkInDate': return ({required Object name}) => 'Fecha de entrada: ${name}\n';
			case 'reservas_todo.multas.summery.checkOut': return ({required Object name}) => 'Fecha de salida: ${name}';
			case 'reservas_todo.multas.summery.paymentMethod': return ({required Object name}) => 'Medios de pago: ${name}\n';
			case 'reservas_todo.multas.summery.paymentDate': return ({required Object name}) => 'Fecha de pago: ${name}\n';
			case 'reservas_todo.multas.summery.bookingValue': return ({required Object name}) => 'Valor de la reserva: ${name}';
			case 'reservas_todo.multas.summery.fineValue': return ({required Object name}) => 'Valor de la multa: ${name}';
			case 'reservas_todo.multas.summery.returnValue': return ({required Object name}) => 'Valor a devolver: ${name}';
			case 'reservas_todo.multas.summery.total': return ({required Object name}) => 'Número total de huéspedes:  ${name}';
			case 'reservas_todo.multas.summery.totalPrice': return ({required Object name}) => 'Precio total de la estancia: ${name}';
			case 'reservas_todo.multas.fineValue': return 'Valor de la multa';
			case 'reservas_todo.multas.returnValue': return 'Valor a devolver';
			case 'reservas_todo.totalPagosAnf.title': return 'Todos los pagos hechos a los anfitriones';
			case 'reservas_todo.pagosTotalAnf.title': return 'Todos los pagos a anfitriones';
			case 'reservas_todo.usuarioTotalPago.title': return 'Pagos de Reservaciones';
			case 'reservas_todo.usuarioTotalPago.summery.text1': return 'Usted hizo un pago de una reserva con la siguiente información: \n';
			case 'reservas_todo.usuarioTotalPago.summery.nameSite': return ({required Object name}) => 'Nombre del sitio: ${name}\n';
			case 'reservas_todo.usuarioTotalPago.summery.location': return ({required Object name}) => 'Ubicación: ${name}\n';
			case 'reservas_todo.usuarioTotalPago.summery.filingDate': return ({required Object name}) => 'Fecha de radicado: ${name}\n';
			case 'reservas_todo.usuarioTotalPago.summery.checkInDate': return ({required Object name}) => 'Fecha de entrada: ${name}\n';
			case 'reservas_todo.usuarioTotalPago.summery.checkOut': return ({required Object name}) => 'Fecha de salida: ${name}';
			case 'reservas_todo.usuarioTotalPago.summery.paymentMethod': return ({required Object name}) => 'Medios de pago: ${name}\n';
			case 'reservas_todo.usuarioTotalPago.summery.paymentDate': return ({required Object name}) => 'Fecha de pago: ${name}\n';
			case 'reservas_todo.usuarioTotalPago.summery.total': return ({required Object name}) => 'Número total de huéspedes:  ${name}';
			case 'reservas_todo.usuarioTotalPago.summery.totalPrice': return ({required Object name}) => 'Precio total de la estancia: ${name}';
			case 'reservas_todo.cancelacionReserva.question1': return '¿Quiere cancelar esta reserva?';
			case 'reservas_todo.cancelacionReserva.summery': return 'Si decide cancelar esta reserva, es posible que se aplique una multa si la cancelación se realiza después de 48 horas. ¿Está seguro de hacer esta operación?';
			case 'reservas_todo.confirmacionPago2.title': return 'Información de la reservación';
			case 'reservas_todo.confirmacionPago2.summery1': return 'A continuación, observa la información del sitio al cual usted está ordenando antes de hacer el pago.';
			case 'reservas_todo.confirmacionPago2.siteName': return 'Nombre del sitio';
			case 'reservas_todo.confirmacionPago2.location': return 'Ubicación';
			case 'reservas_todo.confirmacionPago2.guest': return ({required Object name}) => '${name} huésped';
			case 'reservas_todo.confirmacionPago2.totalCost': return 'Costo total';
			case 'reservas_todo.confirmacionPago2.qrCode': return 'Código QR';
			case 'reservas_todo.confirmacionPago2.summery2': return 'En este momento, su reserva se encuentra en estado pendiente. Si desea que se active, por favor, realice el pago a través del código QR anterior en un lapso de 48 horas. Después de esto, cuando su reserva se active, aparecerá el contacto del anfitrión en nuestro chat en línea para ultimar detalles y asegurarse de que pueda disfrutar su estadía.';
			case 'reservas_todo.misMultas.title': return 'Mis multas';
			case 'reservas_todo.misMultas.summery.text1': return 'Usted tiene una multa con la siguiente información: \n';
			case 'reservas_todo.misMultas.summery.nameSite': return ({required Object name}) => 'Nombre del sitio: ${name}\n';
			case 'reservas_todo.misMultas.summery.location': return ({required Object name}) => 'Ubicación: ${name}\n';
			case 'reservas_todo.misMultas.summery.checkInDate': return ({required Object name}) => 'Fecha de entrada: ${name}\n';
			case 'reservas_todo.misMultas.summery.checkOut': return ({required Object name}) => 'Fecha de salida: ${name}';
			case 'reservas_todo.misMultas.summery.bookingValue': return ({required Object name}) => 'Valor de la reserva: ${name}';
			case 'reservas_todo.misMultas.summery.fineValue': return ({required Object name}) => 'Valor de la multa: ${name}';
			case 'reservas_todo.misMultas.summery.returnValue': return ({required Object name}) => 'Valor a devolver: ${name}';
			case 'reservas_todo.misDevoluciones.title': return 'Mis Devoluciones';
			case 'reservas_todo.misPagos.title': return 'Mis pagos';
			case 'reservas_todo.misReservasActivas.title': return 'Mis reservas activas';
			case 'reservas_todo.misReservasActivas.title2': return 'Todas las reservas activas';
			case 'reservas_todo.misReservasActivas.summery.text1': return 'Usted tiene una reserva activa con la siguiente información: \n';
			case 'reservas_todo.misReservasActivas.summery.nameSite': return ({required Object name}) => 'Nombre del sitio: ${name}\n';
			case 'reservas_todo.misReservasActivas.summery.location': return ({required Object name}) => 'Ubicación: ${name}\n';
			case 'reservas_todo.misReservasActivas.summery.checkInDate': return ({required Object name}) => 'Fecha de entrada: ${name}\n';
			case 'reservas_todo.misReservasActivas.summery.checkOut': return ({required Object name}) => 'Fecha de salida: ${name}';
			case 'reservas_todo.misReservasActivas.summery.total': return ({required Object name}) => 'Número total de huéspedes:  ${name}';
			case 'reservas_todo.misReservasActivas.summery.totalPrice': return ({required Object name}) => 'Precio total de la estancia: ${name}';
			case 'reservas_todo.actualizacionDevoluciones.title': return 'Actualización de las Devoluciones';
			case 'reservas_todo.actualizacionDevoluciones.status': return 'Estado: ';
			case 'reservas_todo.actualizacionDevoluciones.cancel': return 'Cancelar';
			case 'reservas_todo.actualizacionDevoluciones.save': return 'Guardar';
			case 'reservas_todo.actualizacionPago.title': return 'Actualización pago de Anfitriones';
			case 'reservas_todo.reservas_finalizadas.title': return 'Todas las reservas finalizadas';
			case 'reservas_todo.reservas_finalizadas.summery.text1': return 'Usted tiene una reserva finalizada con la siguiente información: \n';
			case 'reservas_todo.reservas_finalizadas.summery.nameSite': return ({required Object name}) => 'Nombre del sitio: ${name}\n';
			case 'reservas_todo.reservas_finalizadas.summery.location': return ({required Object name}) => 'Ubicación: ${name}\n';
			case 'reservas_todo.reservas_finalizadas.summery.checkInDate': return ({required Object name}) => 'Fecha de entrada: ${name}\n';
			case 'reservas_todo.reservas_finalizadas.summery.checkOut': return ({required Object name}) => 'Fecha de salida: ${name}';
			case 'reservas_todo.reservas_finalizadas.summery.total': return ({required Object name}) => 'Número total de huéspedes:  ${name}';
			case 'reservas_todo.reservas_finalizadas.summery.totalPrice': return ({required Object name}) => 'Precio total de la estancia: ${name}';
			case 'reservas_todo.reservas_pendientes.title': return 'Todas las reservas pendientes';
			case 'reservas_todo.reservas_pendientes.activate': return 'Activar';
			case 'reservas_todo.reservas_pendientes.delete': return 'Eliminar';
			case 'reservas_todo.reservas_pendientes.summery.text1': return 'Usted tiene una reserva pendiente con la siguiente información: \n';
			case 'reservas_todo.reservas_pendientes.summery.nameSite': return ({required Object name}) => 'Nombre del sitio: ${name}\n';
			case 'reservas_todo.reservas_pendientes.summery.location': return ({required Object name}) => 'Ubicación: ${name}\n';
			case 'reservas_todo.reservas_pendientes.summery.checkInDate': return ({required Object name}) => 'Fecha de entrada: ${name}\n';
			case 'reservas_todo.reservas_pendientes.summery.checkOut': return ({required Object name}) => 'Fecha de salida: ${name}';
			case 'reservas_todo.reservas_pendientes.summery.total': return ({required Object name}) => 'Número total de huéspedes:  ${name}';
			case 'reservas_todo.reservas_pendientes.summery.totalPrice': return ({required Object name}) => 'Precio total de la estancia: ${name}';
			case 'reservas_todo.questions.one': return '¿Quiere eliminar esta reserva?';
			case 'reservas_todo.questions.comment': return 'Si elimina esta reserva no hay marcha atrás. ¿Está seguro de hacer esta operación?';
			case 'reservas_todo.misReservasCanceladas.title': return 'Mis reservas canceladas';
			case 'reservas_todo.misReservasCanceladas.summery.text1': return 'Usted tiene una reserva cancelada con la siguiente información: \n';
			case 'reservas_todo.misReservasCanceladas.summery.nameSite': return ({required Object name}) => 'Nombre del sitio: ${name}\n';
			case 'reservas_todo.misReservasCanceladas.summery.location': return ({required Object name}) => 'Ubicación: ${name}\n';
			case 'reservas_todo.misReservasCanceladas.summery.checkInDate': return ({required Object name}) => 'Fecha de entrada: ${name}\n';
			case 'reservas_todo.misReservasCanceladas.summery.checkOut': return ({required Object name}) => 'Fecha de salida: ${name}';
			case 'reservas_todo.misReservasCanceladas.summery.total': return ({required Object name}) => 'Número total de huéspedes:  ${name}';
			case 'reservas_todo.misReservasCanceladas.summery.totalPrice': return ({required Object name}) => 'Precio total de la estancia: ${name}';
			case 'reservas_todo.misReservasFinalizadas.title': return 'Mis reservas finalizadas';
			case 'reservas_todo.misReservasFinalizadas.summery.text1': return 'Usted tiene una reserva finalizada con la siguiente información: \n';
			case 'reservas_todo.misReservasFinalizadas.summery.nameSite': return ({required Object name}) => 'Nombre del sitio: ${name}\n';
			case 'reservas_todo.misReservasFinalizadas.summery.location': return ({required Object name}) => 'Ubicación: ${name}\n';
			case 'reservas_todo.misReservasFinalizadas.summery.checkInDate': return ({required Object name}) => 'Fecha de entrada: ${name}\n';
			case 'reservas_todo.misReservasFinalizadas.summery.checkOut': return ({required Object name}) => 'Fecha de salida: ${name}';
			case 'reservas_todo.misReservasFinalizadas.summery.total': return ({required Object name}) => 'Número total de huéspedes:  ${name}';
			case 'reservas_todo.misReservasFinalizadas.summery.totalPrice': return ({required Object name}) => 'Precio total de la estancia: ${name}';
			case 'reservas_todo.misReservasPendientes.title': return 'Mis reservas pendientes';
			case 'reservas_todo.misReservasPendientes.summery.text1': return 'Usted tiene una reserva pendiente con la siguiente información: \n';
			case 'reservas_todo.misReservasPendientes.summery.nameSite': return ({required Object name}) => 'Nombre del sitio: ${name}\n';
			case 'reservas_todo.misReservasPendientes.summery.location': return ({required Object name}) => 'Ubicación: ${name}\n';
			case 'reservas_todo.misReservasPendientes.summery.checkInDate': return ({required Object name}) => 'Fecha de entrada: ${name}\n';
			case 'reservas_todo.misReservasPendientes.summery.checkOut': return ({required Object name}) => 'Fecha de salida: ${name}';
			case 'reservas_todo.misReservasPendientes.summery.total': return ({required Object name}) => 'Número total de huéspedes:  ${name}';
			case 'reservas_todo.misReservasPendientes.summery.totalPrice': return ({required Object name}) => 'Precio total de la estancia: ${name}';
			case 'reservas_todo.misReservasPendientes.pay': return 'Pagar';
			case 'reservas_todo.misReservasPendientes.delete': return 'Eliminar';
			case 'otros.cards.title': return 'Panel Usuario';
			case 'otros.cards.misReservas': return 'Mis reservas';
			case 'otros.cards.reservasActivas': return 'Reservas activas';
			case 'otros.cards.reservasCancelas': return 'Reservas canceladas';
			case 'otros.cards.reservasFinalizadas': return 'Reservas finalizadas';
			case 'otros.cards.total': return 'Total';
			case 'otros.favorite.title': return 'Sitios favoritos';
			case 'sitioVisitado.title': return 'Sitios visitados';
			case 'dScreen.pAnfitrion': return 'Panel anfitrión';
			case 'dScreen.pAdmin': return 'Panel Administrador';
			case 'dashboard.inicio': return 'Inicio';
			case 'dashboard.perfil': return 'Actualizar Datos';
			case 'dashboard.categorias': return 'Categorías';
			case 'dashboard.comentario': return 'Comentarios';
			case 'dashboard.chats': return 'Mis Chats';
			case 'dashboard.sitio': return 'Nuevo Sitio';
			case 'dashboard.claro': return 'Modo Claro';
			case 'dashboard.oscuro': return 'Modo Oscuro';
			case 'dashboard.sesion': return 'Cerrar Sesión';
			case 'habitacionDetails.title': return '¿Dónde vas a dormir?';
			case 'complementos.share': return 'Compartir';
			case 'complementos.favorites': return 'Favoritos';
			case 'complementos.question.one': return '¿Quiere realizar esta acción?';
			case 'complementos.question.summery': return 'Para llevar a cabo esta acción, es necesario iniciar sesión primero.';
			case 'complementos.question2.one': return '¿Quieres compartir información acerca del sitio?';
			case 'complementos.question2.summery': return 'A continuación puedes digitar el número de WhatsApp de la persona a la cual usted desea compartir la información del sito.';
			case 'complementos.telefono': return 'Ingrese el número de telefono';
			case 'complementos.required': return 'Se requiere de este campo';
			case 'complementos.summery.one': return ({required Object name}) => 'El sitio se llama ${name}\n';
			case 'complementos.summery.two': return ({required Object name}) => 'tiene una excelente ubicación en ${name} \n';
			case 'complementos.summery.three': return ({required Object name}) => 'tiene una capacidad de ${name} ';
			case 'complementos.summery.four': return ({required Object name}) => 'huéspedes y su precio es muy accesible con un costo de ${name} la noche. ¡Que esperas para reservarlo!';
			case 'complementos.send': return 'Enviar';
			case 'complementos.seeAllPhotos': return 'Ver todas las fotos';
			case 'complementos.goTo': return 'A dónde irás';
			case 'complementos.searchLocation': return 'Buscar Ubicación';
			case 'complementos.location': return 'Ubicación';
			case 'complementos.home': return 'Inicio';
			case 'complementos.night': return 'Noche';
			case 'complementos.arrive': return 'Llegada';
			case 'complementos.exit': return 'Salida';
			case 'complementos.clearnCOst': return 'Tarifa de limpieza';
			case 'complementos.payAndConfirm': return 'Confirma y paga';
			case 'complementos.info': return 'Información de tu viaje';
			case 'complementos.yourTotal': return 'Tu total';
			case 'complementos.confirm': return 'Confirmar pago';
			case 'complementos.totalCOP': return 'Total (COP)';
			case 'complementos.guest': return 'Huéspedes';
			case 'serviciosDetails.summery': return ({required Object name}) => 'Mostrar los ${name} servicios';
			case 'serviciosDetails.ofrece': return 'Lo que este lugar ofrece';
			case 'showHuesped.adults': return 'Adultos';
			case 'showHuesped.age': return 'Edad 13 años o más';
			case 'showHuesped.children': return 'Niños';
			case 'showHuesped.from': return 'De 2 a 12 años';
			case 'showHuesped.babys': return 'Bebes';
			case 'showHuesped.less': return 'Menos de 12 años';
			case 'showHuesped.pets': return 'Mascotas';
			case 'showHuesped.save': return 'Guardar';
			case 'inferiorDetails.rules': return 'Reglas de la casa';
			case 'inferiorDetails.securityAndPrivacy': return 'Seguridad y privacidad';
			case 'inferiorDetails.polices': return 'Políticas de cancelación';
			case 'inferiorDetails.reglasSitio': return 'Reglas del sitio';
			case 'inferiorDetails.seguridad': return 'Seguridad y propiedad del sitio';
			case 'inferiorDetails.cancelacion': return 'Cancelación gratuita por 48 horas';
			case 'servicios.wifi': return 'Wifi';
			case 'servicios.piscina': return 'Piscina';
			case 'servicios.kitchen.title': return 'Cocina';
			case 'servicios.kitchen.text': return 'Los huespedes pueden cocinar en este espacio';
			case 'servicios.jacuzzi': return 'Un jacuzzi';
			case 'servicios.bodySoap': return 'Jabon corporal';
			case 'servicios.shampoo': return 'Shampoo';
			case 'servicios.shocked_Refrigerator': return 'Nevera surtida';
			case 'servicios.assorted_Minibar': return 'Minibar surtido';
			case 'servicios.microwave': return 'Microondas';
			case 'servicios.grill': return 'Parrilla';
			case 'servicios.coffee_Maker': return 'Cafetera';
			case 'servicios.autonomous_Entry': return 'Entrada Autónoma';
			case 'servicios.hot_Water': return 'Agua Caliente';
			case 'servicios.air_conditioning': return 'Aire Acondicionado';
			case 'servicios.washer_Dryer': return 'Lavadora secadora';
			case 'servicios.television_or_cable': return 'Televisión o cable';
			case 'servicios.chimney': return 'Chimenea';
			case 'servicios.parking_lot': return 'Estacionamiento';
			case 'servicios.good_lighting': return 'Buena iluminacion';
			case 'servicios.otro.area_to_work': return 'Area para trabajar';
			case 'servicios.otro.text': return 'En un area compartido';
			case 'servicios.office_supplies': return 'Articulos de oficina';
			case 'servicios.security_cameras': return 'Cámaras de seguridad en la propiedad';
			case 'servicios.luggage_storage': return 'Se permite dejar el equipaje';
			case 'servicios.towel_per_guest': return 'Toalla por huésped';
			case 'servicios.pillow_per_guest': return 'Una almohada por huésped';
			case 'servicios.bed_sheets': return 'Sabanas para cada cama';
			case 'servicios.cleaning_products': return 'Productos de limpieza';
			case 'servicios.bedding': return 'Ropa de cama';
			case 'servicios.equipped_kitchen': return 'Cocina equipada';
			case 'servicios.hair_dryer': return 'Secador de pelo';
			case 'servicios.iron_and_board': return 'Plancha con tabla';
			case 'servicios.smoke_detector': return 'Detector de humo';
			case 'servicios.carbon_monoxide_detector': return 'Detector de monóxido de carbono';
			case 'servicios.fire_extinguisher': return 'Extintor de incendios';
			case 'servicios.first_aid_kit': return 'Botiquin primeros auxilios';
			case 'servicios.child_seat': return 'Asiento para niños';
			case 'servicios.board_games': return 'Juegos de mesa';
			case 'servicios.free_bicycles': return 'Bicicletas gratuitas';
			case 'servicios.gym': return 'Gimnasio';
			case 'servicios.sauna': return 'Sauna';
			case 'servicios.patio_or_terrace': return 'Patio o terraza';
			case 'servicios.daily_cleaning_service': return 'Servicio de limpieza diario';
			case 'servicios.lake_view': return 'Vista al lago';
			case 'servicios.ocean_view': return 'Vista al mar';
			case 'servicios.safe_box': return 'Caja de seguridad';
			case 'servicios.concierge_service': return 'Servicio de consejeria';
			case 'servicios.two.pets_allowed': return 'Mascotas permitidas';
			case 'servicios.two.no_assistance_animal_restrictions': return 'No hay restricciones respecto los animales de asistencia';
			case 'servicios.car_rental': return 'Alquiler de coches';
			case 'servicios.local_tour_guide': return 'Guia turistica/local';
			case 'servicios.babysitting_service': return 'Servicio de niñera';
			case 'servicios.musical_instruments': return 'Instrumentos musicales';
			case 'servicios.customized_tours': return 'Tours personalizados';
			case 'servicios.three.private_garden': return 'Jardin privado';
			case 'servicios.three.open_space': return 'Un espacio abierto en la propiedad generalmente cubierto de pasto';
			case 'servicios.crib': return 'Cuna';
			case 'servicios.catering_services': return 'Servicios de catering';
			case 'servicios.sound_system': return 'Sistema de sonido';
			case 'servicios.streaming_service': return 'Servicio de streaming';
			case 'servicios.welcome_kit': return 'Kit de bienvenida';
			case 'servicios.boat_service': return 'Servicio de barco';
			case 'servicios.restaurant_discounts': return 'Descuentos en restaurantes';
			case 'from_habitacion.title': return 'Titúlo';
			case 'from_habitacion.required': return 'Se requiere de este campo';
			case 'from_habitacion.description': return 'Descripción';
			case 'from_habitacion.add': return 'Agregar habitación';
			case 'from_habitacion.save': return 'Guardar habitaciones';
			case 'serviciosScreen.select': return 'Selecciona tus servicios';
			case 'serviciosScreen.description': return 'A continuación, usted encontrará varios servicios. Seleccione aquellos que ofrece su propiedad. En la parte inferior de este listado, encontrará un botón en el cual usted guardará en nuestro servidor los servicios seleccionados.';
			case 'serviciosScreen.save': return 'Guardar servicios';
			case 'formularioSitio.save': return 'Guardar';
			case 'formularioSitio.Continue': return 'Continuar';
			case 'formularioSitio.loading': return 'Cargando';
			case 'pantallaUno.Agrega_tu_Sitio': return 'Agrega tu Sitio';
			case 'pantallaUno.Categoria': return 'Categoría';
			case 'pantallaUno.Titulo_del_sitio': return 'Título del sitio';
			case 'pantallaUno.Se_requiere_de_este_campo': return 'Se requiere de este campo';
			case 'pantallaUno.Numero_de_Huespedes': return 'Número de huéspedes';
			case 'pantallaUno.Numero_de_Camas': return 'Número de camas';
			case 'pantallaUno.Numero_de_Banos': return 'Número de baños';
			case 'pantallaUno.Descripcion': return 'Descripción';
			case 'pantallaDos.america_del_sur': return 'América del Sur';
			case 'pantallaDos.america_del_norte': return 'América del Norte';
			case 'pantallaDos.centro_america': return 'Centro América';
			case 'pantallaDos.europa': return 'Europa';
			case 'pantallaDos.asia': return 'Asia';
			case 'pantallaDos.africa': return 'África';
			case 'pantallaDos.oceania': return 'Oceanía';
			case 'pantallaDos.valor_noche': return 'Valor noche';
			case 'pantallaDos.se_requiere_de_este_campo': return 'Se requiere de este campo';
			case 'pantallaDos.lugar': return 'Lugar';
			case 'pantallaDos.descripcion_del_lugar': return 'Descripción del lugar';
			case 'pantallaDos.continente': return 'Continente';
			case 'pantallaDos.text': return 'Necesitamos la latitud y la longitud de su propiedad, ya que gestionamos un mapa que mostrará a sus futuros huéspedes la ubicación exacta. Puede encontrar estos datos en Google Maps o en su aplicación de localización preferida.';
			case 'pantallaDos.longitud': return 'Longitud';
			case 'pantallaDos.latitud': return 'Latitud';
			case 'pantallaTres.valor_limpieza': return 'Valor de limpieza';
			case 'pantallaTres.se_requiere_de_este_campo': return 'Se requiere de este campo';
			case 'pantallaTres.texts1': return 'Al hacer clic en el campo de habitaciones, aparecerá un botón. Utilícelo para agregar el título y una descripción sobre la habitación que está por añadir.';
			case 'pantallaTres.habitaciones': return 'Habitaciones';
			case 'pantallaTres.agregar': return 'Agregar';
			case 'pantallaTres.aceptar_terminos_y_condiciones': return 'Aceptar términos y condiciones';
			case 'pantallaTres.texts2': return 'Para acceder a nuestros términos y condiciones, por favor, haz clic en el siguiente botón';
			case 'pantallaTres.terminos_y_condiciones': return 'Términos y Condiciones';
			case 'pantallaTres.anadir_imagenes': return 'Añadir Imágenes';
			case 'pantallaTres.anadir_mas': return 'Añadir Más';
			case 'pantallaTres.texts3': return 'Después de seleccionar sus imágenes, haga clic en el icono de \'subir\' para guardarlas en nuestro servidor. Este proceso puede demorar dependiendo de la cantidad de imágenes que esté subiendo.';
			case 'pantallaCuatro.siteRules': return 'Reglas del sitio';
			case 'pantallaCuatro.rules': return 'Reglas';
			case 'pantallaCuatro.required': return 'Se requiere de este campo';
			case 'pantallaCuatro.siteSecurity': return 'Seguridad del sitio';
			case 'pantallaCuatro.security': return 'Seguridad';
			case 'actualizacionUno.actualiza_tu_sitio': return 'Actualiza tu sitio';
			case 'actualizacionUno.title': return 'Título';
			case 'actualizacionUno.descripcion_del_sitio': return 'Descripción del sitio';
			case 'actualizacionUno.numero_de_huespedes': return 'Número de huéspedes';
			case 'actualizacionUno.valor_noche': return 'Valor noche';
			case 'actualizacionUno.descripcion_del_lugar': return 'Descripción del lugar';
			case 'actualizacionUno.texts1': return 'Necesitamos la latitud y la longitud de su propiedad, ya que gestionamos un mapa que mostrará a sus futuros huéspedes la ubicación exacta. Puede encontrar estos datos en Google Maps o en su aplicación de localización preferida.';
			case 'actualizacionUno.latitud': return 'Latitud';
			case 'actualizacionUno.longitud': return 'Longitud';
			case 'actualizacionUno.valor_de_la_limpieza': return 'Valor de la limpieza';
			case 'actualizacionUno.guardar': return 'Guardar';
			case 'search.spanish': return 'Español';
			case 'search.english': return 'Ingles';
			case 'search.login': return 'Iniciar Sesión';
			case 'search.close': return 'Cerrar';
			case 'identificacionClases.error_al_verificar_credenciales': return 'Error al verificar credenciales.';
			case 'identificacionClases.cerrar': return 'Cerrar';
			case 'identificacionClases.iniciar_sesion': return 'Iniciar Sesión';
			case 'identificacionClases.viaja_con_estilo_destinos_de_ensueno_a_tu_alcance': return 'Viaja con Estilo, Destinos de Ensueño a Tu Alcance';
			case 'identificacionClases.diga_la_siguiente_palabra': return 'Diga la siguiente palabra:';
			case 'identificacionClases.texts1': return 'Descubre destinos inexplorados, vive experiencias únicas y crea recuerdos que durarán toda la vida. ¡Únete a la comunidad viajera y haz realidad tus sueños de viaje!';
			case 'identificacionClases.authentication': return 'Autenticación';
			case 'identificacionClases.password': return 'Cambio de contraseña';
			case 'identificacionClases.message': return '¡Su contraseña fue cambiada exitosamente!';
			case 'identificacionClases.accept': return 'Aceptar';
			case 'identificacionClases.email': return 'E-mail';
			case 'identificacionClases.pass': return 'Contraseña';
			case 'identificacionClases.forgot': return '¿Olvido la contraseña?';
			case 'pruebaEdit.actualizar_datos': return 'Actualizar Datos';
			case 'pruebaEdit.texts1': return '¡Actualiza tus datos y no te pierdas la oportunidad de disfrutar las mejores vacaciones de tu vida! ¡Hazlo ahora y vive la experiencia al máximo!';
			case 'pruebaEdit.telefono': return 'Teléfono';
			case 'pruebaEdit.se_requiere_de_un_numero_de_telefono': return 'Se requiere de un número de teléfono';
			case 'pruebaEdit.idioma': return 'Idioma';
			case 'pruebaEdit.quieres_agregar_una_descripcion': return '¿Quieres agregar una descripción?';
			case 'pruebaEdit.descripcion': return 'Descripción';
			case 'pruebaEdit.nombre_completo': return 'Nombre Completo';
			case 'pruebaEdit.tipo_de_documento': return 'Tipo de Documento';
			case 'pruebaEdit.numero_de_documento': return 'Número de Documento';
			case 'pruebaEdit.texts2': return 'Usted se registrará como usuario y anfitrión. Solicitamos sus datos bancarios para realizar los respectivos pagos en caso de que ofrezca un sitio para alquilar. También, en caso de que cancele una reserva, estos datos nos ayudarán a hacer la respectiva devolución de su dinero.';
			case 'pruebaEdit.bank': return 'Banco';
			case 'pruebaEdit.numero_de_daviplata': return 'Numero de Daviplata';
			case 'pruebaEdit.contrasena': return 'Contraseña';
			case 'pruebaEdit.confirmacion_de_contrasena': return 'Confirmación de Contraseña';
			case 'pruebaEdit.cambiar_contrasena': return 'Cambiar Contraseña';
			case 'pruebaEdit.telefono_celular': return 'Télefono Celular';
			case 'pruebaEdit.seleccionar_foto_de_perfil': return 'Seleccionar foto de perfil';
			case 'pruebaEdit.listo': return 'Listo';
			case 'pruebaEdit.cargando': return 'Cargando';
			case 'pruebaEdit.texts3': return 'Cuando seleccione su foto de perfil, por favor, espere un momento mientras se carga en nuestro servidor. Asegúrese de desplazarse hasta el final de este formulario y guardar los cambios para que la nueva foto de perfil se aplique correctamente. Si no completa este paso, la imagen seleccionada no será guardada como su nueva foto de perfil.';
			case 'clases.singnIn': return 'Iniciar sesión';
			case 'clases.singUp': return 'Registrarse';
			case 'lista.cc': return 'Cedula de Ciudadanía';
			case 'lista.ce': return 'Cedula de Extranjería';
			case 'lista.pass': return 'Pasaporte';
			case 'lista.nit': return 'Número de identificación tributaria';
			case 'lista.banks.one': return 'BANCOLOMBIA';
			case 'lista.banks.two': return 'Banco de Bogotá';
			case 'lista.banks.three': return 'Banco caja social';
			case 'lista.banks.four': return 'Av Villas';
			case 'lista.banks.five': return 'Banco de occidente';
			case 'lista.banks.six': return 'Banco popular';
			case 'lista.banks.seven': return 'Banco agrario';
			case 'lista.banks.eight': return 'Davivienda';
			case 'lista.banks.nine': return 'Colpatria';
			case 'register.register': return 'Registrarse';
			case 'register.text1': return 'Que esperas por regístrate, no te detengas de disfrutar de las mejores vacaciones de tu vida!!';
			case 'register.tel': return 'Teléfono';
			case 'register.requiredPhone': return 'Se requiere de un número de teléfono';
			case 'register.lenguaje': return 'Idioma';
			case 'pruebaTres.sing_up': return 'Regístrate';
			case 'pruebaTres.text1': return 'Usted se registrará como usuario y anfitrión. Solicitamos sus datos bancarios para realizar los respectivos pagos en caso de que ofrezca un sitio para alquilar. También, en caso de que cancele una reserva, estos datos nos ayudarán a hacer la respectiva devolución de su dinero.';
			case 'pruebaTres.bank': return 'Banco';
			case 'pruebaTres.daviplata': return 'Número de Daviplata';
			case 'pruebaTres.contrasena_incorrecta': return 'Contraseña incorrecta';
			case 'menu_pdf.text1': return 'Documento impreso exitosamente';
			case 'menu_pdf.text2': return 'Documento compartido exitosamente';
			case 'pdf.factura': return 'Factura StayAway';
			case 'pdf.information': return 'Información StayAway';
			case 'pdf.telefono': return ({required Object name}) => 'Teléfono: ${name}';
			case 'pdf.nombre_del_sitio': return ({required Object name}) => 'Nombre del sitio: ${name}';
			case 'pdf.nombre_del_cliente': return ({required Object name}) => 'Nombre del Cliente: ${name}';
			case 'pdf.documento': return ({required Object name}) => 'Documento: ${name}';
			case 'pdf.informacion_reserva': return 'Información de tu reserva';
			case 'splashScreen.explora_el_Mundo.title': return 'Explora el Mundo';
			case 'splashScreen.explora_el_Mundo.description': return 'Descubre destinos inexplorados, vive experiencias únicas y crea recuerdos que durarán toda la vida. ¡Únete a la comunidad viajera y haz realidad tus sueños de viaje!';
			case 'splashScreen.viaja_con_Estilo.title': return 'Viaja con Estilo';
			case 'splashScreen.viaja_con_Estilo.description': return 'Desde playas paradisíacas hasta metrópolis emocionantes, encuentra inspiración para tu próximo viaje y descubre ofertas exclusivas que harán que tu viaje sea inolvidable.';
			case 'splashScreen.rutas_Secretas.title': return 'Rutas Secretas';
			case 'splashScreen.rutas_Secretas.description': return '¿Buscas aventuras auténticas? Navega por nuestras rutas secretas y desentraña los tesoros ocultos que solo los viajeros más intrépidos conocen.';
			case 'splashScreen.planifica_Tu_Escape.title': return 'Planifica Tu Escape';
			case 'splashScreen.planifica_Tu_Escape.description': return 'Ya sea una escapada de fin de semana o un viaje de ensueño, nuestra app te ayudará a planificar el escape perfecto. ¡Deja que la aventura comience!';
			case 'splashScreen.viajar_Transforma.title': return 'Viajar Transforma';
			case 'splashScreen.viajar_Transforma.description': return 'El viaje no solo cambia tus destinos, también cambia tu perspectiva. Únete a nuestra comunidad global de viajeros y descubre cómo viajar puede transformar tu vida.';
			case 'splashScreen.skip': return 'Omitir';
			case 'info_importante.question.title': return 'Información importante a tener en cuenta';
			case 'info_importante.question.text': return ({required Object name}) => 'Antes de continuar con tu reserva, debes seleccionar el número de huéspedes. Recuerda que no deben ser más que el número de huéspedes permitidos por el anfitrión del sitio. En este caso, el máximo de huéspedes es ${name}';
			case 'info_importante.question2.text': return ({required Object name, required Object name2}) => 'Antes de continuar con tu reserva, por favor selecciona las fechas de entrada y salida. Las fechas registradas actualmente son desde ${name} hasta ${name2}. Para continuar, debes cambiar esas fechas por las que deseas registrar para tu viaje.';
			case 'cosas_faltantes.reset': return 'Reiniciar';
			case 'cosas_faltantes.select': return 'Seleccionar Icono';
			case 'cosas_faltantes.selectImage': return 'Seleccionar Imagen';
			case 'cosas_faltantes.roles.text': return 'Cambió de rol en el aplicativo';
			case 'cosas_faltantes.roles.user': return 'Usuario';
			case 'cosas_faltantes.roles.admin': return 'Administrador';
			case 'cosas_faltantes.info': return ({required Object date1, required Object date2}) => 'Las siguientes fechas del ${date1} hasta el ${date2} están reservadas';
			case 'cosas_faltantes.alert.title': return 'Recuperación de contraseña';
			case 'cosas_faltantes.alert.text': return ({required Object email}) => 'Un email fue enviado a la cuenta ${email}';
			case 'cosas_faltantes.alert.text2': return 'Ingrese su email para el restablecimiento de contraseña';
			case 'cosas_faltantes.alert.text3': return 'Restablecer contraseña';
			case 'cosas_faltantes.all': return 'Todos los usuarios';
			case 'cosas_faltantes.name': return 'Nombre';
			case 'cosas_faltantes.mail': return 'Correo';
			case 'cosas_faltantes.rol': return 'Rol';
			case 'cosas_faltantes.update': return 'Actualizar rol';
			case 'cosas_faltantes.number': return 'Número de cuenta';
			case 'cosas_faltantes.date': return 'Fecha de registro';
			case 'cosas_faltantes.questions.one': return '¿Quieres eliminar este usuario?';
			case 'cosas_faltantes.questions.summery': return 'Si elimina este usuario no hay marcha atrás. ¿Está seguro de hacer esta operación?';
			case 'cosas_faltantes.details.guests': return ({required Object name}) => '${name} Huéspedes';
			case 'cosas_faltantes.details.rooms': return ({required Object name}) => '${name} Habitaciones';
			case 'cosas_faltantes.details.beds': return ({required Object name}) => '${name} Camas';
			case 'cosas_faltantes.details.Bathrooms': return ({required Object name}) => '${name} Baños';
			case 'cosas_faltantes.details.text': return ({required Object fecha}) => 'Se registro el: ${fecha}';
			case 'cosas_faltantes.details.info': return 'Ver información';
			case 'cosas_faltantes.details.info2': return 'Información del Anfitrión';
			case 'cosas_faltantes.details.anfi': return ({required Object name}) => 'Anfitrión: ${name}';
			case 'cosas_faltantes.details.contact': return 'Contacto';
			case 'cosas_faltantes.details.tel': return 'Teléfono fijo';
			case 'cosas_faltantes.disponibilidad': return 'Disponibilidad';
			case 'cosas_faltantes.summery': return 'No hay comentarios disponibles';
			case 'cosas_faltantes.add': return 'Añadir comentario';
			case 'cosas_faltantes.send': return 'Enviar Comentario';
			case 'cosas_faltantes.noche': return ({required Object name}) => '${name} noches';
			case 'cosas_faltantes.modalText': return 'Acerca de este espacio';
			case 'cosas_faltantes.showMore': return 'Mostrar Más >';
			case 'modalInfor.texts': return 'Antes de continuar, revisa de que todos los campos estén correctamente.';
			case 'texts1': return 'Hola, por si no sabes aún como generar una reserva en nuestra app, puedes mirar un video que hemos generado para ti para que sepas más de nuestras funcionalidades.';
			case 'textS': return 'Si estás registrando un sitio por primera vez, te invitamos a ver el siguiente video.';
			case 'botonS': return 'Ver video';
			case 'botonV': return 'Ir ahora al video';
			case 'administradorE': return 'Administrador';
			case 'usuarioE': return 'Usuario';
			case 'pendienteE': return 'Pendiente';
			case 'finalizadoE': return 'Finalizado';
			case 'huella1': return 'Por favor, escanee su huella dactilar para confirmar su reserva';
			case 'huella2': return 'Por favor, escanee su huella dactilar para acceder';
			case 'voz1': return 'Por favor, mantenga presionado el botón mientras habla. Una vez haya terminado de hablar, suéltelo y vuelva a presionarlo para iniciar sesión';
			case 'voz2': return 'Por favor, mantenga presionado el botón mientras habla. Una vez haya terminado de hablar, suéltelo y vuelva a presionarlo para realizar la reserva';
			default: return null;
		}
	}
}
