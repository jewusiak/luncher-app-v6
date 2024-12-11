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

  static List<String> languages() => ['pl', 'en'];

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
    String? plText = '',
    String? enText = '',
  }) =>
      [plText, enText][languageIndex] ?? '';

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
  // HomePage
  {
    'mzcm9bee': {
      'pl': 'Witaj w\nWarszawie',
      'en': '',
    },
    't6kgb2gt': {
      'pl': 'Polecane',
      'en': '',
    },
  },
  // MapPage
  {
    'zvdsxdbu': {
      'pl': 'Map',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'ty5eamqa': {
      'pl': '',
      'en': '',
    },
    'nz872bdy': {
      'pl': '',
      'en': '',
    },
    'axlf7r4f': {
      'pl': '',
      'en': '',
    },
    'at1dx2tj': {
      'pl': '',
      'en': '',
    },
    'hvrsv5qh': {
      'pl': '',
      'en': '',
    },
    '49mlv4or': {
      'pl': '',
      'en': '',
    },
    'qs4geqs3': {
      'pl': '',
      'en': '',
    },
    'dora0gco': {
      'pl': '',
      'en': '',
    },
    'ka3ikkv0': {
      'pl': '',
      'en': '',
    },
    'x1v22ed1': {
      'pl': '',
      'en': '',
    },
    'h3dig6l6': {
      'pl': '',
      'en': '',
    },
    'cfe5rfg8': {
      'pl': '',
      'en': '',
    },
    '2g5s0pyv': {
      'pl': '',
      'en': '',
    },
    '46mwi4dv': {
      'pl': '',
      'en': '',
    },
    '9veevg1p': {
      'pl': '',
      'en': '',
    },
    'yzdu5ove': {
      'pl': '',
      'en': '',
    },
    '0i6xscxu': {
      'pl': '',
      'en': '',
    },
    'ytbsdedf': {
      'pl': '',
      'en': '',
    },
    '294kqk27': {
      'pl': '',
      'en': '',
    },
    '61k1x54e': {
      'pl': '',
      'en': '',
    },
    '3cwg9znw': {
      'pl': '',
      'en': '',
    },
    'hsxa4w10': {
      'pl': '',
      'en': '',
    },
    'ik3vwm1z': {
      'pl': '',
      'en': '',
    },
    'a3cgbc6x': {
      'pl': '',
      'en': '',
    },
    'b1v67q3f': {
      'pl': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
