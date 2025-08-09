import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'pl'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? plText = '',
  }) =>
      [enText, plText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // home
  {
    's728av8u': {
      'en': 'Herbarium',
      'pl': 'Zielnik',
    },
    '87r9nyp1': {
      'en': 'Fact sheet',
      'pl': 'Informacje',
    },
    'odtyy6um': {
      'en': 'Latin name',
      'pl': 'Łacińska nazwa',
    },
    'zzvi1n2l': {
      'en': 'Family',
      'pl': 'Rodzina',
    },
    'rhtj38tn': {
      'en': 'Habitat',
      'pl': 'Występowanie',
    },
    'ysm3kkak': {
      'en': 'Habitat',
      'pl': 'Występowanie',
    },
    '199fh0qh': {
      'en': 'Appearance',
      'pl': 'Wygląd',
    },
    'furjaccp': {
      'en': 'Meaning',
      'pl': 'Znaczenie',
    },
    's29cskpp': {
      'en': 'Add a new plant',
      'pl': 'Dodaj nową roślinę',
    },
    'novk5vl5': {
      'en': 'Change order',
      'pl': 'Zmień kolejność',
    },
    '9pbycgaz': {
      'en': 'Home',
      'pl': 'Główna',
    },
  },
  // settings
  {
    'fifjjvhh': {
      'en': 'Settings',
      'pl': 'Ustawienia',
    },
    '0l6fw75z': {
      'en': 'User interface',
      'pl': 'Interfejs użytkownika',
    },
    '3p1u9vhx': {
      'en': 'Primary plant name language',
      'pl': 'Główny język nazw roślin',
    },
    'lrplrugk': {
      'en': 'Floating new plant button',
      'pl': 'Pływający przycisk dodawania roślin',
    },
    'xgxd0h6h': {
      'en': 'Green plant card titles',
      'pl': 'Zielone nazwy roślin',
    },
    'x55zbsgw': {
      'en': '',
      'pl': '',
    },
    'naf7fm80': {
      'en': 'Functionality',
      'pl': 'Funkcjonalność',
    },
    'b3ya6rws': {
      'en': 'Map-based habitat',
      'pl': 'Występowanie na bazie mapy',
    },
    'zz3tenwo': {
      'en': 'Are you sure you want to log out?',
      'pl': 'Czy jesteś pewien, że chcesz się wylogować?',
    },
    '21cc4zh3': {
      'en': 'Settings',
      'pl': 'Ustawienia',
    },
  },
  // add
  {
    '0xcrek4m': {
      'en': 'Add a plant',
      'pl': 'Dodaj roślinę',
    },
    't630vz7d': {
      'en': 'Names',
      'pl': 'Nazwy',
    },
    '8iw40ers': {
      'en': 'Latin',
      'pl': 'Łacińska',
    },
    'x0lcvgzg': {
      'en': '',
      'pl': '',
    },
    'q9hx9ryu': {
      'en': 'Enter the plant\'s Latin name here',
      'pl': 'Wprowadź tu łacińską nazwę rośliny',
    },
    'h4oyer3w': {
      'en': 'English',
      'pl': 'Angielska',
    },
    'qqv071mr': {
      'en': '',
      'pl': '',
    },
    '9hryh8o3': {
      'en': 'Enter the plant\'s English common name here',
      'pl': 'Wprowadź tu angielską powszechną nazwę rośliny',
    },
    'f1w14ee4': {
      'en': 'Polish',
      'pl': 'Polska',
    },
    'ljxpzrwm': {
      'en': '',
      'pl': '',
    },
    'lhab3rud': {
      'en': 'Enter the plant\'s Polish common name here',
      'pl': 'Wprowadź tu polską powszechną nazwę rośliny',
    },
    'gnw7i5wc': {
      'en': 'Plant family',
      'pl': 'Rodzina rośliny',
    },
    '50srverl': {
      'en': '',
      'pl': '',
    },
    'hjajt05z': {
      'en': 'Enter the plant\'s Latin family name here',
      'pl': 'Wprowadź tu łacińską nazwę rodziny rośliny',
    },
    'p12vat3v': {
      'en': 'Images',
      'pl': 'Obrazy',
    },
    'hz2orhak': {
      'en': 'Hold the image to delete it',
      'pl': 'Przytrzymaj obraz, aby go usunąć',
    },
    'ju7fja8u': {
      'en': 'Add images',
      'pl': 'Dodaj zdjęcia',
    },
    'rzotjoj5': {
      'en': 'Add images',
      'pl': 'Dodaj zdjęcia',
    },
    '6bhjegxp': {
      'en': 'Clear all images',
      'pl': 'Usuń wszystkie zdjęcia',
    },
    'dqwlbzzc': {
      'en': 'Are you sure you want to delete all images of this plant?',
      'pl': 'Czy jesteś pewien że chcesz usunąć wszystkie zdjęcia tej rośliny?',
    },
    'gbap0hx7': {
      'en': 'Appearance',
      'pl': 'Wygląd',
    },
    'xpq13kd8': {
      'en': '',
      'pl': '',
    },
    '5ruhtdww': {
      'en': 'Describe the plant\'s appearance here',
      'pl': 'Opisz tu wygląd rośliny',
    },
    'v2923r8k': {
      'en': 'Meaning',
      'pl': 'Znaczenie',
    },
    '6b7u4i96': {
      'en': '',
      'pl': '',
    },
    'k4pa9xme': {
      'en': 'Describe the plant\'s meaning here',
      'pl': 'Opisz tu znaczenie rośliny',
    },
    'bk5n0dq0': {
      'en': 'Habitat',
      'pl': 'Występowanie',
    },
    '4oz6k3xm': {
      'en': 'Select the plant\'s habitat',
      'pl': 'Wybierz występowanie rośliny',
    },
    'aes6rlmc': {
      'en': 'Search for a region',
      'pl': 'Wyszukaj region',
    },
    '7abncc2y': {
      'en': 'Entire Poland',
      'pl': 'Cała Polska',
    },
    '798wju6w': {
      'en': 'Zachodniopomorskie',
      'pl': 'Zachodniopomorskie',
    },
    '4l4j4cji': {
      'en': 'Pomorskie',
      'pl': 'Pomorskie',
    },
    'zozhkima': {
      'en': 'Warmińsko-Mazurskie',
      'pl': 'Warmińsko-Mazurskie',
    },
    'oj5sz799': {
      'en': 'Podlaskie',
      'pl': 'Podlaskie',
    },
    '035tvxw9': {
      'en': 'Lubuskie',
      'pl': 'Lubuskie',
    },
    '1nyuwo5c': {
      'en': 'Wielkopolskie',
      'pl': 'Wielkopolskie',
    },
    '6nxal778': {
      'en': 'Kujawsko-Pomorskie',
      'pl': 'Kujawsko-Pomorskie',
    },
    'ut1whdn4': {
      'en': 'Łódzkie',
      'pl': 'Łódzkie',
    },
    'xeylanxa': {
      'en': 'Mazowieckie',
      'pl': 'Mazowieckie',
    },
    '30e5t9z6': {
      'en': 'Lubelskie',
      'pl': 'Lubelskie',
    },
    'txtkie4v': {
      'en': 'Dolnośląskie',
      'pl': 'Dolnośląskie',
    },
    'vplxzvth': {
      'en': 'Opolskie',
      'pl': 'Opolskie',
    },
    'm5m1f4gi': {
      'en': 'Śląskie',
      'pl': 'Śląskie',
    },
    'afie9bg8': {
      'en': 'Małopolskie',
      'pl': 'Małopolskie',
    },
    'vweicue7': {
      'en': 'Świętokrzyskie',
      'pl': 'Świętokrzyskie',
    },
    '1ee0lhvq': {
      'en': 'Podkarpackie',
      'pl': 'Podkarpackie',
    },
    'sdqkaw47': {
      'en': '',
      'pl': '',
    },
    'thxa7mfu': {
      'en': 'Describe the plant\'s habitat here',
      'pl': 'Opisz tu występowanie rośliny',
    },
    'shsuidlh': {
      'en': 'Additional description',
      'pl': 'Dodatkowe uwagi',
    },
    'symhg3f5': {
      'en': '',
      'pl': '',
    },
    '28o7uc2u': {
      'en': 'Enter any additional notes here',
      'pl': 'Wprowadź tu jakiekolwiek pozostałe uwagi',
    },
    '3hta497z': {
      'en': 'Save',
      'pl': 'Zapisz',
    },
    '0b4zv1si': {
      'en': 'Home',
      'pl': 'Główna',
    },
  },
  // edit
  {
    'pi2izcgk': {
      'en': 'Edit details',
      'pl': 'Edytuj szczegóły',
    },
    'sg10sreb': {
      'en': 'Names',
      'pl': 'Nazwy',
    },
    '3c16avdl': {
      'en': 'Latin',
      'pl': 'Łacińska',
    },
    'qa7uoeak': {
      'en': '',
      'pl': '',
    },
    '94hbesw3': {
      'en': 'Enter the plant\'s Latin name here',
      'pl': 'Wprowadź tu łacińską nazwę rośliny',
    },
    '6aob4076': {
      'en': 'English',
      'pl': 'Angielska',
    },
    '4d8czw9u': {
      'en': '',
      'pl': '',
    },
    'z3ww71ks': {
      'en': 'Enter the plant\'s English common name here',
      'pl': 'Wprowadź tu angielską powszechną nazwę rośliny',
    },
    'c3hgtz41': {
      'en': 'Polish',
      'pl': 'Polski',
    },
    'ug92l8ra': {
      'en': '',
      'pl': '',
    },
    'sr6z9wd6': {
      'en': 'Enter the plant\'s Polish common name here',
      'pl': 'Wprowadź tu polską powszechną nazwę rośliny',
    },
    '7iknllp3': {
      'en': 'Plant family',
      'pl': 'Rodzina rośliny',
    },
    '50jc0625': {
      'en': '',
      'pl': '',
    },
    'qs3ubaty': {
      'en': 'Enter the plant\'s Latin family name here',
      'pl': 'Wprowadź tu łacińską nazwę rodziny rośliny',
    },
    '1hsl7nbg': {
      'en': 'Images',
      'pl': 'Obrazy',
    },
    'd1turxh1': {
      'en': 'Hold the image to delete it',
      'pl': 'Przytrzymaj obraz, aby go usunąć',
    },
    '4bx7lpjq': {
      'en': 'Add images',
      'pl': 'Dodaj zdjęcia',
    },
    'udthekpu': {
      'en': 'Add images',
      'pl': 'Dodaj zdjęcia',
    },
    'z4hvr7bg': {
      'en': 'Clear all images',
      'pl': 'Usuń wszystkie zdjęcia',
    },
    'ih3qaspl': {
      'en': 'Are you sure you want to delete all images of this plant?',
      'pl': '',
    },
    '9chnkxj2': {
      'en': 'Habitat',
      'pl': 'Występowanie',
    },
    'ri21hhp8': {
      'en': 'Select the plant\'s habitat',
      'pl': 'Wybierz występowanie rośliny',
    },
    'ubetn1bx': {
      'en': 'Search for a region',
      'pl': 'Wyszukaj region',
    },
    'c0szwtfs': {
      'en': 'Entire Poland',
      'pl': 'Cała Polska',
    },
    'l2hmoa1z': {
      'en': 'Zachodniopomorskie',
      'pl': 'Zachodniopomorskie',
    },
    'otijdrb2': {
      'en': 'Pomorskie',
      'pl': 'Pomorskie',
    },
    'tzvfm45b': {
      'en': 'Warmińsko-Mazurskie',
      'pl': 'Warmińsko-Mazurskie',
    },
    'gcq2yvs7': {
      'en': 'Podlaskie',
      'pl': 'Podlaskie',
    },
    'p9q9iepx': {
      'en': 'Lubuskie',
      'pl': 'Lubuskie',
    },
    'ph17jhy1': {
      'en': 'Wielkopolskie',
      'pl': 'Wielkopolskie',
    },
    '824mdhc3': {
      'en': 'Kujawsko-Pomorskie',
      'pl': 'Kujawsko-Pomorskie',
    },
    'ggh1oz53': {
      'en': 'Łódzkie',
      'pl': 'Łódzkie',
    },
    '80cqhy4x': {
      'en': 'Mazowieckie',
      'pl': 'Mazowieckie',
    },
    'dn64zfjf': {
      'en': 'Lubelskie',
      'pl': 'Lubelskie',
    },
    'ddveqx36': {
      'en': 'Dolnośląskie',
      'pl': 'Dolnośląskie',
    },
    'og8fovsr': {
      'en': 'Opolskie',
      'pl': 'Opolskie',
    },
    'ivu5o11k': {
      'en': 'Śląskie',
      'pl': 'Śląskie',
    },
    '6rgshtxe': {
      'en': 'Małopolskie',
      'pl': 'Małopolskie',
    },
    'ena1dbj3': {
      'en': 'Świętokrzyskie',
      'pl': 'Świętokrzyskie',
    },
    'adf1hi8i': {
      'en': 'Podkarpackie',
      'pl': 'Podkarpackie',
    },
    'u4ygu3ni': {
      'en': '',
      'pl': '',
    },
    'nozzith1': {
      'en': 'Describe the plant\'s habitat here',
      'pl': 'Opisz tu występowanie rośliny',
    },
    'jjf48ju3': {
      'en': 'Appearance',
      'pl': 'Wygląd',
    },
    'm9xuy2bv': {
      'en': '',
      'pl': '',
    },
    'xg9an855': {
      'en': 'Describe the plant\'s appearance here',
      'pl': 'Opisz tu wygląd rośliny',
    },
    'pj06oek5': {
      'en': 'Meaning',
      'pl': 'Znaczenie',
    },
    'yav9wwmt': {
      'en': '',
      'pl': '',
    },
    '03ttjwrq': {
      'en': 'Describe the plant\'s meaning here',
      'pl': 'Opisz tu znaczenie rośliny',
    },
    'uxt09z19': {
      'en': 'Additional description',
      'pl': 'Dodatkowe uwagi',
    },
    '27lfvx6e': {
      'en': '',
      'pl': '',
    },
    'og9mm1z5': {
      'en': 'Enter any additional notes here',
      'pl': 'Wprowadź tu jakiekolwiek pozostałe uwagi',
    },
    'l7i7xs3e': {
      'en': 'Save',
      'pl': 'Zapisz',
    },
    'lpb92jfr': {
      'en': 'Delete',
      'pl': 'Usuń',
    },
    '5k1jqpdd': {
      'en': 'Are you sure you want to delete this plant?',
      'pl': 'Czy napewno chcesz usunąć tę roślinę?',
    },
    'nhpx5q20': {
      'en': 'Home',
      'pl': 'Główna',
    },
  },
  // login
  {
    '1e0txdt9': {
      'en': 'Herbarium',
      'pl': 'Zielnik',
    },
    'ttdm1c35': {
      'en': 'Create account',
      'pl': 'Stwórz konto',
    },
    '5bvb9ftq': {
      'en': 'Create account',
      'pl': 'Stwórz konto',
    },
    '44yymcl3': {
      'en': 'Let\'s get started by filling out\nthe form below.',
      'pl': 'Zacznijmy od wypełnienia poniższego formularza.',
    },
    'rcu3lg4i': {
      'en': 'Email',
      'pl': 'Email',
    },
    'tzoe5elr': {
      'en': 'Password',
      'pl': 'Hasło',
    },
    'vxdewkq7': {
      'en': 'Password',
      'pl': 'Hasło',
    },
    '98w0x5tu': {
      'en': 'Get started',
      'pl': 'Rozpocznij',
    },
    'nmn1zy4n': {
      'en': 'Log in',
      'pl': 'Zaloguj się',
    },
    's3419cxs': {
      'en': 'Welcome back',
      'pl': 'Witaj ponownie',
    },
    'rqdyhy2l': {
      'en': 'Fill out the information below in order to access your account.',
      'pl':
          'Wypełnij poniższe informacje, aby uzyskać dostęp do swojego konta.',
    },
    'zkgpfgnp': {
      'en': 'Email',
      'pl': 'Email',
    },
    '9ss4i28d': {
      'en': 'Password',
      'pl': 'Hasło',
    },
    'yswkzspt': {
      'en': 'Sign in',
      'pl': 'Zaloguj się',
    },
    '215oqgcc': {
      'en': 'Home',
      'pl': '',
    },
  },
  // reorder
  {
    'vdyqvkq2': {
      'en': 'Change order',
      'pl': 'Zmień kolejność',
    },
    '7cldnv30': {
      'en': 'Hold and drag to move places',
      'pl': 'Przytrzymaj i przeciągnij, by zmienić miejsca',
    },
    'vhuyx1sd': {
      'en': 'Home',
      'pl': 'Główna',
    },
  },
  // dialog
  {
    '5d2avkrg': {
      'en': 'Cancel',
      'pl': 'Anuluj',
    },
    'kjlrjkz4': {
      'en': 'Confirm',
      'pl': 'Potwierdź',
    },
  },
  // egg
  {
    'mmgf3mgs': {
      'en': 'z dedykacją dla siorki',
      'pl': 'z dedykacją dla siorki',
    },
    'in3svi1u': {
      'en': '^_^',
      'pl': '^_^',
    },
  },
  // Miscellaneous
  {
    'dh7fqu8z': {
      'en': '',
      'pl':
          'Aby zrobić zdjęcie lub nakręcić film, ta aplikacja potrzebuje zgody na dostęp do aparatu.',
    },
    '2nnxge0d': {
      'en': '',
      'pl':
          'Aby wysyłać pliki, ta aplikacja potrzebuje zgody na dostęp do galerii.',
    },
    'sigecxza': {
      'en': '',
      'pl': 'Błąd: [error]',
    },
    '8mc6pxn1': {
      'en': '',
      'pl': 'Email do resetowania hasła została wysłany!',
    },
    'fnfpef2p': {
      'en': '',
      'pl': 'Email jest wymagany',
    },
    'vwl5qn4q': {
      'en': '',
      'pl': 'Numer telefonu jest wymagany i musi się zaczynać od +',
    },
    'tz0gy3ao': {
      'en': '',
      'pl': 'Hasła do siebie nie pasują',
    },
    'y5qfd2tx': {
      'en': '',
      'pl': 'Wpisz kod weryfikacyjny z SMS',
    },
    '1crtvfhd': {
      'en': '',
      'pl':
          'Minęło zbyt dużo czasu od ostatniego logowania. Zaloguj się jeszcze raz przed usunięciem swojego konta.',
    },
    '9z4lqqdk': {
      'en': '',
      'pl':
          'Minęło zbyt dużo czasu od ostatniego logowania. Zaloguj się jeszcze raz przed zaktualizowaniem swojego adresu email.',
    },
    '40jlmppb': {
      'en': '',
      'pl':
          'Wiadomość z potwierdzeniem zmiany przypisanego adresu email została wysłana',
    },
    '873wgrsd': {
      'en': '',
      'pl': 'Ten email jest już w użytku',
    },
    '2atk01h8': {
      'en': '',
      'pl': 'Podane dane logowania są nieprawidłowe bądź wygasły',
    },
    '5b0ya613': {
      'en': '',
      'pl': 'Niepoprawny format pliku',
    },
    'xw5oafnl': {
      'en': '',
      'pl': 'Przesyłanie pliku...',
    },
    'dii0lzun': {
      'en': '',
      'pl': 'Sukces!',
    },
    'cq2sqf6t': {
      'en': '',
      'pl': 'Błąd wysyłania pliku',
    },
    'yvdi17bh': {
      'en': '',
      'pl': '',
    },
    '6zw0y10k': {
      'en': '',
      'pl': 'Wybierz źródło',
    },
    '515bcc9l': {
      'en': '',
      'pl': 'Galeria',
    },
    'hbday5aa': {
      'en': '',
      'pl': 'Galeria (zdjęcia)',
    },
    'nk3tj3ih': {
      'en': '',
      'pl': 'Galeria (wideo)',
    },
    'b51vbd3c': {
      'en': '',
      'pl': 'Aparat',
    },
    'gwjrbhlx': {
      'en': '',
      'pl': '',
    },
    'c78xefhw': {
      'en': '',
      'pl': '',
    },
    'pi67fv57': {
      'en': '',
      'pl': '',
    },
    '4yiek1bn': {
      'en': '',
      'pl': '',
    },
  },
].reduce((a, b) => a..addAll(b));
