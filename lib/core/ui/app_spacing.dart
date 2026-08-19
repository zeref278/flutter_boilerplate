import 'package:flutter/material.dart';

/// The app's spacing scale.
///
/// [space2]..[space48] are the raw logical-pixel tokens; use them for padding,
/// insets, and radii. The `horizontalSpacing*` / `verticalSpacing*` widgets are
/// gaps derived from those same tokens, so a screen never mixes two scales.
class AppSpacing {
  AppSpacing._();

  static const double space2 = 2;
  static const double space4 = 4;
  static const double space6 = 6;
  static const double space8 = 8;
  static const double space10 = 10;
  static const double space12 = 12;
  static const double space16 = 16;
  static const double space20 = 20;
  static const double space24 = 24;
  static const double space32 = 32;
  static const double space48 = 48;

  static const horizontalSpacing2 = SizedBox(width: space2);
  static const horizontalSpacing4 = SizedBox(width: space4);
  static const horizontalSpacing6 = SizedBox(width: space6);
  static const horizontalSpacing8 = SizedBox(width: space8);
  static const horizontalSpacing10 = SizedBox(width: space10);
  static const horizontalSpacing12 = SizedBox(width: space12);
  static const horizontalSpacing16 = SizedBox(width: space16);
  static const horizontalSpacing20 = SizedBox(width: space20);
  static const horizontalSpacing24 = SizedBox(width: space24);
  static const horizontalSpacing32 = SizedBox(width: space32);
  static const horizontalSpacing48 = SizedBox(width: space48);

  static const verticalSpacing2 = SizedBox(height: space2);
  static const verticalSpacing4 = SizedBox(height: space4);
  static const verticalSpacing6 = SizedBox(height: space6);
  static const verticalSpacing8 = SizedBox(height: space8);
  static const verticalSpacing10 = SizedBox(height: space10);
  static const verticalSpacing12 = SizedBox(height: space12);
  static const verticalSpacing16 = SizedBox(height: space16);
  static const verticalSpacing20 = SizedBox(height: space20);
  static const verticalSpacing24 = SizedBox(height: space24);
  static const verticalSpacing32 = SizedBox(height: space32);
  static const verticalSpacing48 = SizedBox(height: space48);
}
