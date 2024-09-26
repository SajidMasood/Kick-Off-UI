import 'package:flutter/material.dart';
import 'package:kick/utils/constants/app_colors.dart';
import 'package:kick/utils/constants/size_utils.dart';

class TTextTheme {
  TTextTheme._();

  /// Customizable Light Text Theme
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      color: AppColors.lightGreen800,
      fontSize: 32.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
    ),
    headlineMedium: TextStyle(
      color: AppColors.onPrimaryContainer,
      fontSize: 24.fSize,
      fontFamily: 'PT Sans',
      fontWeight: FontWeight.w700,
    ),
    headlineSmall: TextStyle(
      color: AppColors.onPrimaryContainer,
      fontSize: 24.fSize,
      fontFamily: 'PT Sans',
      fontWeight: FontWeight.w700,
    ),
    bodyMedium: TextStyle(
      color: AppColors.gray50001,
      fontSize: 15.fSize,
      fontFamily: 'PT Sans',
      fontWeight: FontWeight.w400,
    ),
    bodySmall: TextStyle(
      color: AppColors.black900,
      fontSize: 12.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
    ),
    displayMedium: TextStyle(
      color: AppColors.primary,
      fontSize: 40.fSize,
      fontFamily: 'PT Sans',
      fontWeight: FontWeight.w700,
    ),
    labelLarge: TextStyle(
      color: AppColors.black900,
      fontSize: 13.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      color: AppColors.primary,
      fontSize: 10.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    ),
    titleLarge: TextStyle(
      color: AppColors.black900,
      fontSize: 20.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w500,
    ),
    titleMedium: TextStyle(
      color: AppColors.onPrimaryContainer,
      fontSize: 18.fSize,
      fontFamily: 'Inter',
      fontWeight: FontWeight.w700,
    ),
    titleSmall: TextStyle(
      color: AppColors.gray500,
      fontSize: 15.fSize,
      fontFamily: 'PT Sans',
      fontWeight: FontWeight.w700,
    ),
  );

  ///
}
