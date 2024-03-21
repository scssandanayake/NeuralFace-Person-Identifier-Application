import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillGray => BoxDecoration(
        color: appTheme.gray50,
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );

  // Gradient decorations
  static BoxDecoration get gradientTealToLime => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment(0.5, 0),
      end: Alignment(1, 0.59),
      colors: [
        appTheme.teal200,
        appTheme.lime100,
      ],
    ),
  );

  static BoxDecoration get gradientLimeToTeal => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(1, 0),
          end: Alignment(0, 0.99),
          colors: [
            appTheme.lime100,
            theme.colorScheme.onPrimary,
            appTheme.teal200,
          ],
        ),
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration();
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderTL30 => BorderRadius.vertical(
    top: Radius.circular(30.h),
  );

  // Circle borders
  static BorderRadius get circleBorder16 => BorderRadius.circular(
        16.h,
      );

  // Rounded borders
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
