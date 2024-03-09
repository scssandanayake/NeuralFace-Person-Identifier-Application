import 'package:flutter/material.dart';
import 'package:person_identifier_application/core/utils/size_utils.dart';
import 'package:person_identifier_application/theme/theme_helper.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Headline text style
  static get headlineSmallDMSansBlack900 =>
      theme.textTheme.headlineSmall!.dMSans.copyWith(
        color: appTheme.black900,
        fontWeight: FontWeight.w500,
      );
  // Title text style
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
        color: appTheme.black900,
      );
  static get titleMediumOnPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
}

extension on TextStyle {
  TextStyle get dMSans {
    return copyWith(
      fontFamily: 'DM Sans',
    );
  }

  TextStyle get aclonica {
    return copyWith(
      fontFamily: 'Aclonica',
    );
  }
}
