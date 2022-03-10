import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors_const.dart';

class TextStylesConst {
  static const titleHome = TextStyle(
    color: AppColorsConst.whiteText,
    fontSize: 40,
  );
  static const subTitleHome = TextStyle(
    color: AppColorsConst.whiteText,
    fontSize: 24,
  );

  static final inputTextField = GoogleFonts.beVietnamPro(
    color: AppColorsConst.whiteText,
  );

  static final movieTitleHome = GoogleFonts.beVietnamPro(
    color: AppColorsConst.whiteText,
    fontSize: 21,
  );
  static final movieCategoryChip = GoogleFonts.beVietnamPro(
    color: AppColorsConst.primary,
    fontSize: 9,
    fontWeight: FontWeight.bold
  );
    static final movieInfo = GoogleFonts.beVietnamPro(
    color: AppColorsConst.whiteText,
    fontSize: 15,
  );
}
