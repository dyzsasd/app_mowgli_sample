import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mowgli/ui/resources/app_images.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AppImages.placeholderImages, fit: BoxFit.cover);
  }
}
