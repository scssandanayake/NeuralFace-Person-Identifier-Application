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

  // Body text style
  static get bodyMediumBlack900 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );
  static get bodyMediumBlack900_1 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.black900,
      );
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 15.fSize,
      );
  static get bodyMediumOnSecondaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onSecondaryContainer,
        fontSize: 15.fSize,
      );
  static get bodyMediumSecondaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer.withOpacity(1),
      );
  static get bodyMediumSecondaryContainer_1 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.secondaryContainer.withOpacity(1),
      );
  // Title text style
  static get titleMediumBlack900 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.black900,
  );

  static get titleMediumPrimary => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
      );
  static get titleMediumPrimary16 => theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
      );
  static get titleSmallRobotoOnPrimary =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 14.fSize,
      );
  static get titleSmallRobotoWhiteA700 =>
      theme.textTheme.titleSmall!.roboto.copyWith(
        color: appTheme.whiteA700,
        fontSize: 14.fSize,
      );
  static get titleSmallff0acf83 => theme.textTheme.titleSmall!.copyWith(
        color: Color(0XFF0ACF83),
        fontSize: 14.fSize,
      );
  static get bodyLarge_1 => theme.textTheme.bodyLarge!;
  // Label text style
  static get labelLargeTeal600 => theme.textTheme.labelLarge!.copyWith(
    color: appTheme.teal600,
  );
  // Title text style
  static get titleMediumTeal600 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.teal600,
  );
  static get titleMediumWhiteA700 => theme.textTheme.titleMedium!.copyWith(
    color: appTheme.whiteA700,
  );
  static get titleMedium_1 => theme.textTheme.titleMedium!;

  // Body text style
  static get bodyMediumff000000 => theme.textTheme.bodyMedium!.copyWith(
    color: Color(0XFF000000),
  );


}

extension on TextStyle {
  TextStyle get aclonica {
    return copyWith(
      fontFamily: 'Aclonica',
    );
  }

  TextStyle get dMSans {
    return copyWith(
      fontFamily: 'DM Sans',
    );
  }

  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }
}
