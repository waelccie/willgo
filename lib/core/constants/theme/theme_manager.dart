import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors_manager.dart';
import '../../extensions/color.dart';
import 'font_manager.dart';
import 'sizes_manager.dart';
import 'styles_manager.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.standard,
    primarySwatch: ColorsManager.primary.getMaterialColorFromColor(),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: ColorsManager.primary.getMaterialColorFromColor(),
      accentColor: ColorsManager.accent,
      backgroundColor: ColorsManager.white,
      brightness: Brightness.light,
      cardColor: ColorsManager.white,
      errorColor: ColorsManager.error,
    ),
    
    scaffoldBackgroundColor: ColorsManager.white,
    primaryColor: ColorsManager.primary,
    dialogBackgroundColor: Colors.white,
    primaryColorLight: ColorsManager.primary,
    disabledColor: ColorsManager.lightGrey,
    fontFamily: GoogleFonts.dmSans().fontFamily,
    cardTheme: CardTheme(
      color: ColorsManager.white,
      shadowColor: ColorsManager.grey,
      elevation: Sizes.size4,
      margin: const EdgeInsets.all(Margins.xSmall),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        enableFeedback: true,
        backgroundColor: ColorsManager.primary,
        elevation: 8,
        shape: CircleBorder()),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: const IconThemeData(color: ColorsManager.black),
      backgroundColor: ColorsManager.white,
      shadowColor: ColorsManager.black,
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
      ),
      titleTextStyle: StylesManager.regular(
        color: ColorsManager.black,
        fontSize: FontSize.large,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorsManager.primary,
      disabledColor: ColorsManager.lightGrey,
      splashColor: ColorsManager.primary,
      textTheme: ButtonTextTheme.normal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primary,
        textStyle: StylesManager.bold(
          color: ColorsManager.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.primary,
      selectedItemColor: ColorsManager.accent,
      showSelectedLabels: true,
      unselectedItemColor: ColorsManager.grey,
      selectedLabelStyle: StylesManager.regular(
        color: ColorsManager.accent,
        fontSize: FontSize.xXSmall,
      ),
      unselectedLabelStyle: StylesManager.regular(
        color: ColorsManager.grey,
        fontSize: FontSize.xSmall,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: StylesManager.medium(
        color: ColorsManager.primary,
        fontSize: Sizes.size18,
      ),
      titleMedium: StylesManager.medium(
        color: ColorsManager.primary,
        fontSize: Sizes.size16,
      ),
      titleSmall: StylesManager.medium(
        color: ColorsManager.primary,
        fontSize: Sizes.size14,
      ),
      bodySmall: StylesManager.regular(
        color: ColorsManager.primary,
      ),
      bodyLarge: StylesManager.regular(color: ColorsManager.primary),
    ),
    badgeTheme: const BadgeThemeData(
      backgroundColor: ColorsManager.red,
    ),
    tabBarTheme: const TabBarTheme(
      indicatorColor: ColorsManager.primary,
      labelColor: ColorsManager.primary,
      unselectedLabelColor: ColorsManager.lightGrey,
    ),
    inputDecorationTheme: InputDecorationTheme(
      //border

      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(12.0),
        borderSide: const BorderSide(
          color: ColorsManager.primary,
        ),
      ),
      //hint text style
      hintStyle: StylesManager.regular(color: ColorsManager.primary),
      //focused ERROR border
      focusedBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: ColorsManager.primary,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: ColorsManager.red,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: ColorsManager.primary,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      suffixStyle: StylesManager.medium(color: ColorsManager.grey),
      focusColor: ColorsManager.success,
      //focused ERROR hint text style
      errorStyle: StylesManager.regular(color: ColorsManager.error),
      //focused Label text style
      labelStyle: StylesManager.medium(color: ColorsManager.primary),
      filled: true,
      fillColor: Colors.white,

      ///fill COLOR

      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: Paddings.xLarge,
        horizontal: Paddings.large,
      ),
    ),
  );

//==================================================================================================================
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.standard,
    primarySwatch: ColorsManager.primary.getMaterialColorFromColor(),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: ColorsManager.primary.getMaterialColorFromColor(),
      accentColor: ColorsManager.accent,
      backgroundColor: ColorsManager.black,
      brightness: Brightness.dark,
      cardColor: ColorsManager.black,
      errorColor: ColorsManager.error,
    ),
    scaffoldBackgroundColor: ColorsManager.black,
    dialogBackgroundColor: ColorsManager.darkGrey,
    primaryColorLight: ColorsManager.primary,
    disabledColor: ColorsManager.lightGrey,
    tabBarTheme: const TabBarTheme(
        indicatorColor: ColorsManager.white,
        labelColor: ColorsManager.white,
        unselectedLabelColor: ColorsManager.darkGrey),
    splashColor: Colors.transparent,
    fontFamily: GoogleFonts.dmSans().fontFamily,
    cardTheme: CardTheme(
      color: ColorsManager.black,
      shadowColor: ColorsManager.grey,
      elevation: Sizes.size4,
      margin: const EdgeInsets.all(Margins.xSmall),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      enableFeedback: true,
      backgroundColor: ColorsManager.primary,
      elevation: 8,
      shape: CircleBorder(),
    ),
    appBarTheme: AppBarTheme(
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: const IconThemeData(color: ColorsManager.white),
      backgroundColor: ColorsManager.charcoal,
      shadowColor: ColorsManager.charcoal,
      centerTitle: true,
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
      ),
      titleTextStyle: StylesManager.regular(
          color: ColorsManager.white, fontSize: FontSize.large),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: ColorsManager.primary,
      disabledColor: ColorsManager.lightGrey,
      splashColor: ColorsManager.primary,
      textTheme: ButtonTextTheme.normal,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primary,
        textStyle: StylesManager.bold(
          color: ColorsManager.white,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.primary,
      selectedItemColor: ColorsManager.accent,
      showSelectedLabels: true,
      unselectedItemColor: ColorsManager.grey,
      selectedLabelStyle: StylesManager.regular(
          color: ColorsManager.accent, fontSize: FontSize.xXSmall),
      unselectedLabelStyle: StylesManager.regular(
        color: ColorsManager.grey,
        fontSize: FontSize.xSmall,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: StylesManager.medium(
        color: Colors.white,
        fontSize: Sizes.size18,
      ),
      titleMedium: StylesManager.medium(
        color: Colors.white,
        fontSize: Sizes.size16,
      ),
      titleSmall: StylesManager.medium(
        color: Colors.white,
        fontSize: Sizes.size14,
      ),
      bodySmall: StylesManager.regular(
        color: ColorsManager.lightGrey,
      ),
      bodyLarge: StylesManager.regular(
        color: Colors.white,
      ),
    ),
    badgeTheme: const BadgeThemeData(
      backgroundColor: ColorsManager.red,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.white),
      ),
      hintStyle: StylesManager.regular(color: ColorsManager.white),
      focusedBorder: UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(8.0),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: ColorsManager.red,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: const BorderSide(
          color: ColorsManager.white,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      suffixStyle: StylesManager.medium(color: Colors.white),
      focusColor: ColorsManager.success,
      errorStyle: StylesManager.regular(color: Colors.white),
      labelStyle: StylesManager.medium(color: ColorsManager.white),
      filled: true,
      fillColor: ColorsManager.darkGrey,
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: Paddings.xLarge,
        horizontal: Paddings.large,
      ),
    ),
  );
}
