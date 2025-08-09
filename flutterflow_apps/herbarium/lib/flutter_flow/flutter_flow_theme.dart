// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';

SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color barrier;
  late Color newPlant1;
  late Color newPlant2;
  late Color accent5;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  bool get displayLargeIsCustom => typography.displayLargeIsCustom;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  bool get displayMediumIsCustom => typography.displayMediumIsCustom;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  bool get displaySmallIsCustom => typography.displaySmallIsCustom;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  bool get headlineLargeIsCustom => typography.headlineLargeIsCustom;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  bool get headlineMediumIsCustom => typography.headlineMediumIsCustom;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  bool get headlineSmallIsCustom => typography.headlineSmallIsCustom;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  bool get titleLargeIsCustom => typography.titleLargeIsCustom;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  bool get titleMediumIsCustom => typography.titleMediumIsCustom;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  bool get titleSmallIsCustom => typography.titleSmallIsCustom;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  bool get labelLargeIsCustom => typography.labelLargeIsCustom;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  bool get labelMediumIsCustom => typography.labelMediumIsCustom;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  bool get labelSmallIsCustom => typography.labelSmallIsCustom;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  bool get bodyLargeIsCustom => typography.bodyLargeIsCustom;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  bool get bodyMediumIsCustom => typography.bodyMediumIsCustom;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  bool get bodySmallIsCustom => typography.bodySmallIsCustom;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF009E47);
  late Color secondary = const Color(0xFF2A376C);
  late Color tertiary = const Color(0xFFBCC5CC);
  late Color alternate = const Color(0xFFE7EAED);
  late Color primaryText = const Color(0xFF0B0C0E);
  late Color secondaryText = const Color(0xFF57636C);
  late Color primaryBackground = const Color(0xFFD9DDE0);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0xFF143D26);
  late Color accent2 = const Color(0xFF1F2643);
  late Color accent3 = const Color(0xFF57636C);
  late Color accent4 = const Color(0xFFE7EAED);
  late Color success = const Color(0xFF249689);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFF5963);
  late Color info = const Color(0xFFFFFFFF);

  late Color barrier = const Color(0x7F000000);
  late Color newPlant1 = const Color(0xFFFFFFFF);
  late Color newPlant2 = const Color(0xFF009E47);
  late Color accent5 = const Color(0xFFFFFFFF);
}

abstract class Typography {
  String get displayLargeFamily;
  bool get displayLargeIsCustom;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  bool get displayMediumIsCustom;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  bool get displaySmallIsCustom;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  bool get headlineLargeIsCustom;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  bool get headlineMediumIsCustom;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  bool get headlineSmallIsCustom;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  bool get titleLargeIsCustom;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  bool get titleMediumIsCustom;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  bool get titleSmallIsCustom;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  bool get labelLargeIsCustom;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  bool get labelMediumIsCustom;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  bool get labelSmallIsCustom;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  bool get bodyLargeIsCustom;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  bool get bodyMediumIsCustom;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  bool get bodySmallIsCustom;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'Plus Jakarta Sans';
  bool get displayLargeIsCustom => false;
  TextStyle get displayLarge => GoogleFonts.plusJakartaSans(
        color: theme.primaryText,
        fontWeight: FontWeight.w900,
        fontSize: 64.0,
        fontStyle: FontStyle.normal,
      );
  String get displayMediumFamily => 'Plus Jakarta Sans';
  bool get displayMediumIsCustom => false;
  TextStyle get displayMedium => GoogleFonts.plusJakartaSans(
        color: theme.primaryText,
        fontWeight: FontWeight.w800,
        fontSize: 44.0,
        fontStyle: FontStyle.normal,
      );
  String get displaySmallFamily => 'Plus Jakarta Sans';
  bool get displaySmallIsCustom => false;
  TextStyle get displaySmall => GoogleFonts.plusJakartaSans(
        color: theme.primaryText,
        fontWeight: FontWeight.w800,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'Plus Jakarta Sans';
  bool get headlineLargeIsCustom => false;
  TextStyle get headlineLarge => GoogleFonts.plusJakartaSans(
        color: theme.primaryText,
        fontWeight: FontWeight.w800,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'Plus Jakarta Sans';
  bool get headlineMediumIsCustom => false;
  TextStyle get headlineMedium => GoogleFonts.plusJakartaSans(
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 28.0,
      );
  String get headlineSmallFamily => 'Plus Jakarta Sans';
  bool get headlineSmallIsCustom => false;
  TextStyle get headlineSmall => GoogleFonts.plusJakartaSans(
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      );
  String get titleLargeFamily => 'Plus Jakarta Sans';
  bool get titleLargeIsCustom => false;
  TextStyle get titleLarge => GoogleFonts.plusJakartaSans(
        color: theme.primaryText,
        fontWeight: FontWeight.w800,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'Roboto';
  bool get titleMediumIsCustom => false;
  TextStyle get titleMedium => GoogleFonts.roboto(
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'Roboto';
  bool get titleSmallIsCustom => false;
  TextStyle get titleSmall => GoogleFonts.roboto(
        color: theme.primaryText,
        fontWeight: FontWeight.bold,
        fontSize: 14.0,
      );
  String get labelLargeFamily => 'Roboto';
  bool get labelLargeIsCustom => false;
  TextStyle get labelLarge => GoogleFonts.roboto(
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'Roboto';
  bool get labelMediumIsCustom => false;
  TextStyle get labelMedium => GoogleFonts.roboto(
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
        fontStyle: FontStyle.italic,
      );
  String get labelSmallFamily => 'Roboto';
  bool get labelSmallIsCustom => false;
  TextStyle get labelSmall => GoogleFonts.roboto(
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
        fontStyle: FontStyle.normal,
      );
  String get bodyLargeFamily => 'Roboto';
  bool get bodyLargeIsCustom => false;
  TextStyle get bodyLarge => GoogleFonts.roboto(
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'Roboto';
  bool get bodyMediumIsCustom => false;
  TextStyle get bodyMedium => GoogleFonts.roboto(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'Roboto';
  bool get bodySmallIsCustom => false;
  TextStyle get bodySmall => GoogleFonts.roboto(
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 10.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF009E47);
  late Color secondary = const Color(0xFF2A376C);
  late Color tertiary = const Color(0xB25A6873);
  late Color alternate = const Color(0xFF262D34);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF95A1AC);
  late Color primaryBackground = const Color(0xFF111316);
  late Color secondaryBackground = const Color(0xFF1A1C21);
  late Color accent1 = const Color(0xFF71C493);
  late Color accent2 = const Color(0xFF697393);
  late Color accent3 = const Color(0xFFBCC5CC);
  late Color accent4 = const Color(0xFF111216);
  late Color success = const Color(0xFF249689);
  late Color warning = const Color(0xFFF9CF58);
  late Color error = const Color(0xFFFF5963);
  late Color info = const Color(0xFFFFFFFF);

  late Color barrier = const Color(0x7F000000);
  late Color newPlant1 = const Color(0xFF009E47);
  late Color newPlant2 = const Color(0xFF0B0C0E);
  late Color accent5 = const Color(0xFF262D34);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    TextStyle? font,
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = false,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
    String? package,
  }) {
    if (useGoogleFonts && fontFamily != null) {
      font = GoogleFonts.getFont(fontFamily,
          fontWeight: fontWeight ?? this.fontWeight,
          fontStyle: fontStyle ?? this.fontStyle);
    }

    return font != null
        ? font.copyWith(
            color: color ?? this.color,
            fontSize: fontSize ?? this.fontSize,
            letterSpacing: letterSpacing ?? this.letterSpacing,
            fontWeight: fontWeight ?? this.fontWeight,
            fontStyle: fontStyle ?? this.fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          )
        : copyWith(
            fontFamily: fontFamily,
            package: package,
            color: color,
            fontSize: fontSize,
            letterSpacing: letterSpacing,
            fontWeight: fontWeight,
            fontStyle: fontStyle,
            decoration: decoration,
            height: lineHeight,
            shadows: shadows,
          );
  }
}
