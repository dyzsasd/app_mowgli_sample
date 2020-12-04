import 'package:flutter/cupertino.dart';

class ImageUtils {
  const ImageUtils._();

  static double getImageWidth(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width * mediaQuery.devicePixelRatio;
  }
}

extension BuildContextImageExtensions on BuildContext {
  double get imagesWidth => ImageUtils.getImageWidth(this);
}
