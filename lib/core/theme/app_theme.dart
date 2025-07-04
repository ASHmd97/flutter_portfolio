// core/theme/app_theme.dart

import 'package:flutter/material.dart';
import 'package:flutter_portfolio/core/responsive/responsive_design.dart';
import 'package:flutter_portfolio/core/theme/app_colors.dart';
import 'package:flutter_portfolio/core/theme/app_font_style.dart';
import 'package:flutter_portfolio/core/theme/app_styles.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppFontStyle.customAppFont.fontFamily,

    // Color Scheme
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.black,
      brightness: Brightness.light,
      primary: AppColors.black,
      secondary: AppColors.primaryBlue,
      surface: AppColors.white,
      error: AppColors.error,
      onPrimary: AppColors.black,
      onSecondary: AppColors.white,
      onSurface: AppColors.black,
      onError: AppColors.white,
    ),

    scaffoldBackgroundColor: AppColors.white,

    // =================== App Bar Theme ===================
    appBarTheme: AppBarTheme(
      centerTitle: false,
      toolbarHeight: 70,
      backgroundColor: Colors.transparent,
      foregroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: R.textXL,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        fontFamily: AppFontStyle.customAppFont.fontFamily, // Custom font
      ),
      iconTheme: IconThemeData(color: AppColors.white, size: R.iconLG),
    ),

    // =================== Elevated Button Theme===================
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.white,
        shadowColor: AppColors.backgroundDark.withOpacity(0.3),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(R.borderSMValue),
        ),
        textStyle: FigmaTextStyles().buttonTextSemiBold,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        minimumSize: Size(double.infinity, R.adaptiveButtonHeight),
      ),
    ),

    // =================== Outlined Button Theme===================
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.white,
        side: BorderSide(color: AppColors.white, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(R.borderButtonValue),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: R.paddingSMValue,
          vertical: R.paddingSMValue,
        ),
        textStyle: TextStyle(
          fontSize: R.textMD,
          fontFamily: AppFontStyle.customAppFont.fontFamily,
          fontWeight: FontWeight.w800,
        ),
        minimumSize: Size(double.infinity, R.adaptiveButtonHeight),
      ),
    ),

    // =================== Text Button Theme ===================
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        textStyle: TextStyle(
          fontSize: R.textSM,
          fontWeight: FontWeight.w600,
          fontFamily: AppFontStyle.customAppFont.fontFamily, // Custom font
          decoration: TextDecoration.none,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: R.paddingSMValue,
          vertical: R.paddingXSValue,
        ),
      ),
    ),

    // =================== Icon Button Theme===================
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(AppColors.white),
        padding: WidgetStateProperty.all(EdgeInsets.all(R.paddingSMValue)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        side: WidgetStateProperty.all(
          BorderSide(color: AppColors.black, width: 2),
        ),
        foregroundColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return AppColors.white;
          }
          return AppColors.black;
        }),
        overlayColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.hovered)) {
            return AppColors.black;
          }
          return null;
        }),
      ),
    ),

    // =================== Input Decoration Theme===================
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      contentPadding: EdgeInsets.symmetric(
        horizontal: R.paddingMDValue,
        vertical: R.paddingSMValue,
      ),

      // Border styles - Responsive
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(R.borderInputValue),
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(R.borderInputValue),
        borderSide: BorderSide(color: Colors.white, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(R.borderInputValue),
        borderSide: BorderSide(color: AppColors.primaryOrange, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(R.borderInputValue),
        borderSide: BorderSide(color: AppColors.error, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(R.borderInputValue),
        borderSide: BorderSide(color: AppColors.error, width: 2),
      ),

      // Text styles - Responsive
      hintStyle: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontSize: R.textBase,
        fontWeight: FontWeight.normal,
        fontFamily: AppFontStyle.customAppFont.fontFamily, // Custom font
      ),
      labelStyle: TextStyle(
        color: Colors.white.withOpacity(0.8),
        fontSize: R.textBase,
        fontWeight: FontWeight.w500,
        fontFamily: AppFontStyle.customAppFont.fontFamily, // Custom font
      ),
      errorStyle: TextStyle(
        color: AppColors.error,
        fontSize: R.textBase,
        fontWeight: FontWeight.w500,
        fontFamily: AppFontStyle.customAppFont.fontFamily, // Custom font
      ),

      // Icon styles - Responsive
      prefixIconColor: Colors.white.withOpacity(0.7),
      suffixIconColor: Colors.white.withOpacity(0.7),
    ),

    // =================== Dialog Theme - Responsive ===================
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.backgroundDark,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(R.borderLG),
      ),
      titleTextStyle: TextStyle(
        fontSize: R.textXL,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
        fontFamily: AppFontStyle.customAppFont.fontFamily, // Custom font
      ),
      contentTextStyle: TextStyle(
        fontSize: R.textMD,
        color: AppColors.textSecondary,
        fontFamily: AppFontStyle.customAppFont.fontFamily, // Custom font
      ),
    ),

    // =================== Bottom Sheet Theme - Responsive ===================
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.white,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(R.borderXL)),
      ),
    ),

    // =================== Card Theme - Responsive ===================
    cardTheme: CardThemeData(
      color: AppColors.white,
      surfaceTintColor: Colors.transparent,
      shadowColor: AppColors.black.withOpacity(0.1),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(R.borderLG),
      ),
      margin: EdgeInsets.all(R.marginSMValue),
    ),

    // =================== Progress Indicator Theme ===================
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.primaryOrange,
      circularTrackColor: AppColors.lightOrange,
    ),

    // =================== Checkbox Theme ===================
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryOrange;
        }
        return Colors.transparent;
      }),
      checkColor: const WidgetStatePropertyAll(AppColors.white),
      side: BorderSide(color: AppColors.white, width: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(R.borderSM),
      ),
    ),

    // =================== Switch Theme ===================
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.white;
        }
        return AppColors.textSecondary;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.primaryOrange;
        }
        return AppColors.lightOrange;
      }),
    ),

    // =================== Icon Theme - Responsive ===================
    iconTheme: IconThemeData(color: AppColors.white, size: R.iconBase),

    // =================== Divider Theme - Responsive ===================
    dividerTheme: DividerThemeData(
      color: Colors.white.withOpacity(0.2),
      thickness: 1,
      space: 1,
    ),
  );

  // =================== Dark Theme ===================
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryOrange,
      brightness: Brightness.dark,
      primary: AppColors.primaryOrange,
      secondary: AppColors.primaryBlue,
      surface: AppColors.backgroundDark,
      background: AppColors.backgroundDark,
      error: AppColors.error,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
      onSurface: AppColors.white,
      onBackground: AppColors.white,
      onError: AppColors.white,
    ),

    scaffoldBackgroundColor: AppColors.backgroundDark,
    primaryColor: AppColors.primaryOrange,

    // Copy themes from light theme with dark adaptations
    appBarTheme: lightTheme.appBarTheme.copyWith(
      backgroundColor: AppColors.backgroundDark,
    ),

    textTheme: lightTheme.textTheme,
    elevatedButtonTheme: lightTheme.elevatedButtonTheme,
    outlinedButtonTheme: lightTheme.outlinedButtonTheme,
    textButtonTheme: lightTheme.textButtonTheme,
    inputDecorationTheme: lightTheme.inputDecorationTheme,
    cardTheme: lightTheme.cardTheme.copyWith(color: AppColors.surfaceDark),
    dialogTheme: lightTheme.dialogTheme.copyWith(
      backgroundColor: AppColors.surfaceDark,
    ),
    checkboxTheme: lightTheme.checkboxTheme,
    switchTheme: lightTheme.switchTheme,
    iconTheme: lightTheme.iconTheme,
    dividerTheme: lightTheme.dividerTheme,
  );

  // =================== Helper Methods - Responsive ===================

  /// Get theme based on brightness
  static ThemeData getTheme(bool isDark) {
    return isDark ? darkTheme : lightTheme;
  }

  /// Get primary button style - Responsive
  static ButtonStyle getPrimaryButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: AppColors.primaryOrange,
      foregroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          R.borderButtonValue,
        ), // ✅ Responsive
      ),
      padding: EdgeInsets.symmetric(
        horizontal: R.paddingMDValue, // ✅ Responsive
        vertical: R.paddingSMValue, // ✅ Responsive
      ),
      minimumSize: Size(
        double.infinity,
        R.adaptiveButtonHeight,
      ), // ✅ Responsive
      textStyle: TextStyle(
        fontSize: R.textMD, // ✅ Responsive
        fontWeight: FontWeight.w600,
      ),
    );
  }

  /// Get secondary button style - Responsive
  static ButtonStyle getSecondaryButtonStyle() {
    return OutlinedButton.styleFrom(
      foregroundColor: AppColors.white,
      side: BorderSide(
        color: AppColors.secondaryOrange,
        width: 1,
      ), // ✅ Responsive
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          R.borderButtonValue,
        ), // ✅ Responsive
      ),
      padding: EdgeInsets.symmetric(
        horizontal: R.paddingMDValue, // ✅ Responsive
        vertical: R.paddingSMValue, // ✅ Responsive
      ),
      minimumSize: Size(
        double.infinity,
        R.adaptiveButtonHeight,
      ), // ✅ Responsive
      textStyle: TextStyle(
        fontSize: R.textMD, // ✅ Responsive
        fontWeight: FontWeight.w600,
      ),
    );
  }

  /// Get social button style - Responsive
  static ButtonStyle getSocialButtonStyle({Color? backgroundColor}) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? Colors.white.withOpacity(0.1),
      foregroundColor: AppColors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(R.borderBase), // ✅ Responsive
        side: BorderSide(
          color: Colors.white.withOpacity(0.2),
          width: 1, // ✅ Responsive
        ),
      ),
      padding: EdgeInsets.all(R.paddingMDValue), // ✅ Responsive
      minimumSize: Size(60, 60), // ✅ Responsive
    );
  }

  /// Get input decoration for forms - Responsive
  static InputDecoration getInputDecoration({
    required String hintText,
    IconData? prefixIcon,
    IconData? suffixIcon,
    VoidCallback? onSuffixIconPressed,
    bool isDense = true,
  }) {
    return InputDecoration(
      hintText: hintText,
      isDense: isDense,
      hintStyle: TextStyle(
        color: Colors.white.withOpacity(0.5),
        fontSize: R.textSM,
      ),
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      prefixIcon: prefixIcon != null
          ? Icon(
              prefixIcon,
              color: Colors.white.withOpacity(0.7),
              size: R.iconBase, // ✅ Responsive icon size
            )
          : null,
      suffixIcon: suffixIcon != null
          ? IconButton(
              icon: Icon(
                suffixIcon,
                color: Colors.white.withOpacity(0.7),
                size: R.iconBase, // ✅ Responsive icon size
              ),
              onPressed: onSuffixIconPressed,
            )
          : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: Colors.white.withOpacity(0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: AppColors.primaryOrange, width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: AppColors.error),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: AppColors.error),
      ),
    );
  }

  // =================== Adaptive Theme Methods ===================

  /// Get adaptive text style based on device
  static TextStyle getAdaptiveTextStyle({
    required double baseFontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontSize: baseFontSize,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? AppColors.white,
    );
  }

  /// Get adaptive padding based on device
  static EdgeInsets getAdaptivePadding({
    double all = 0,
    double horizontal = 0,
    double vertical = 0,
  }) {
    if (all > 0) {
      return EdgeInsets.all(all); // ✅ Responsive
    }
    return EdgeInsets.symmetric(
      horizontal: horizontal, // ✅ Responsive
      vertical: vertical, // ✅ Responsive
    );
  }

  /// Get adaptive border radius
  static BorderRadius getAdaptiveBorderRadius(double radius) {
    return BorderRadius.circular(radius); // ✅ Responsive
  }

  /// Get adaptive button height based on device
  static double getAdaptiveButtonHeight() {
    return R.adaptiveButtonHeight; // ✅ Uses responsive logic
  }

  /// Get adaptive icon size based on context
  static double getAdaptiveIconSize(String size) {
    switch (size) {
      case 'small':
        return R.iconSM;
      case 'base':
        return R.iconBase;
      case 'large':
        return R.iconLG;
      case 'xl':
        return R.iconXL;
      default:
        return R.iconBase;
    }
  }
}
