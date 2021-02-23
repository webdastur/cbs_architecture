// 🐦 Flutter imports:
import 'package:flutter/material.dart';

// 📦 Package imports:
import 'package:easy_localization/easy_localization.dart';
import 'package:google_fonts/google_fonts.dart';

// 🌎 Project imports:
import 'package:cbs_architecture/data/config/const/color_const.dart';
import 'package:cbs_architecture/data/config/const/size_const.dart';

class AppWidgets {
  static Widget text({
    String text,
    Color color = ColorConst.BLACK,
    double fontSize = SizeConst.FONT_16,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.w400,
    EdgeInsets padding = const EdgeInsets.all(0),
    TextAlign textAlign = TextAlign.start,
    int maxLines = 3,
    fontStyle = FontStyle.normal,
  }) {
    return Padding(
      padding: padding,
      child: Text(
        text ?? "",
        style: GoogleFonts.roboto(
          color: color,
          fontSize: fontSize,
          decoration: decoration,
          fontWeight: fontWeight,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  static Widget textLocale({
    @required String localeKey,
    Color color = ColorConst.BLACK,
    double fontSize = SizeConst.FONT_16,
    TextDecoration decoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.w400,
    EdgeInsets padding = const EdgeInsets.all(0),
    TextAlign textAlign = TextAlign.start,
    int maxLines = 3,
  }) {
    return Padding(
      padding: padding,
      child: Text(
        localeKey ?? "",
        style: GoogleFonts.roboto(
          color: color,
          fontSize: fontSize,
          decoration: decoration,
          fontWeight: fontWeight,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ).tr(),
    );
  }
}
