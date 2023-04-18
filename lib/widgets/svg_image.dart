import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgImage extends StatelessWidget {
  const SvgImage({Key? key, required this.imageLocation}) : super(key: key);
  final String imageLocation;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(imageLocation);
  }
}
