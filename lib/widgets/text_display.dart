
import 'package:flutter/material.dart';

import '../i18n/application_localizations.dart';
import '../utils/app_color.dart';

class AppTextDisplay extends StatelessWidget {
  final Color? color;
  final Color? backgroundColor;

  final double? fontSize;
  final String? text;
  final String? translation;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final TextStyle? style;
  final TextAlign? textAlign;
  final bool? isUpper;
  final bool? softWrap;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final double? wordSpacing;

  const AppTextDisplay(
      {Key? key,
      this.color = AppColor.blackColor,
      this.backgroundColor,
      this.fontSize = 14.0,
      this.text,
      this.fontFamily = 'ReportoRegular',
      this.decoration,
      this.translation,
      this.overflow = TextOverflow.ellipsis,
      this.style,
      this.softWrap = false,
      this.maxLines = 3,
      this.textAlign = TextAlign.center,
      this.fontWeight = FontWeight.normal,
      this.wordSpacing = 1,
      this.isUpper = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
/*    if (style != null) {
      double fontSize = style.fontSize!;
      style = style.copyWith(fontSize: fontSize);
    }*/
    return Text(
      translation != null && translation!.isNotEmpty
          ? ApplicationLocalizations.of(context)!.translate(translation!)!
          : text ?? '',
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
      softWrap: softWrap,
      style: style ?? TextStyle(
              backgroundColor: backgroundColor,
              decoration: decoration,
              color: color,
              fontSize: fontSize,
              wordSpacing: wordSpacing,
              fontFamily: fontFamily,
              fontWeight: fontWeight),
    );
  }
}
