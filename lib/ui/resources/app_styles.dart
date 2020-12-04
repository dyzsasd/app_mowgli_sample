import 'package:flutter/rendering.dart';
import 'package:mowgli/ui/resources/app_colors.dart';

class AppTextStyles {
  static const double _h1FontSize = 22.0;
  static const double _h2FontSize = 18.0;
  static const double _h3FontSize = 16.0;
  static const double _h4FontSize = 14.0;
  static const double _h5FontSize = 12.0;
  static const double _pFontSize = 12.0;

  static TextStyle get h1 => TextStyle(
        fontSize: _h1FontSize,
        fontWeight: FontWeight.bold,
        color: AppColors.text,
      );

  static TextStyle get h1LowHeight => h1.copyWith(
        height: 0.8,
      );

  static TextStyle get h2 => TextStyle(
        fontSize: _h2FontSize,
        fontWeight: FontWeight.w500,
        color: AppColors.text,
      );

  static TextStyle get h2Medium => h2;

  static TextStyle get h2Bold => h2.copyWith(
        fontWeight: FontWeight.bold,
      );

  static TextStyle get h2Button => h2.copyWith(
        color: AppColors.white,
      );

  static TextStyle get h3 => TextStyle(
        fontSize: _h3FontSize,
        fontWeight: FontWeight.w500,
        color: AppColors.text,
      );

  static TextStyle get h3Bold => h3.copyWith(
        fontWeight: FontWeight.bold,
      );

  static TextStyle get h3Medium => h3;

  static TextStyle get h3PrimaryDark => h3.copyWith(
        color: AppColors.primaryDark,
      );

  static TextStyle get h4 => TextStyle(
        fontSize: _h4FontSize,
        color: AppColors.text,
      );

  static TextStyle get h4Bold => h4.copyWith(
        fontWeight: FontWeight.bold,
      );

  static TextStyle get h4Medium => h4.copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle get h4W500 => h4.copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle get h4lightGrey => h4.copyWith(
        color: AppColors.text3,
      );

  static TextStyle get h4PrimaryDark => h4.copyWith(
        color: AppColors.primaryDark,
      );

  static TextStyle get h4PrimaryDarkW500 => h4.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.primaryDark,
      );

  static TextStyle get h4PrimaryDarkBold => h4.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.primaryDark,
      );

  static TextStyle get pW500 => TextStyle(
        fontSize: _pFontSize,
        fontWeight: FontWeight.w500,
        color: AppColors.text3,
      );

  static TextStyle get h5 => TextStyle(
        fontSize: _h5FontSize,
        fontWeight: FontWeight.w500,
        color: AppColors.text,
      );

  static TextStyle get h5Medium => h5;

  static TextStyle get h3MediumHight => TextStyle(
        fontSize: _h3FontSize,
        fontWeight: FontWeight.w500,
        color: AppColors.text,
      );
}
