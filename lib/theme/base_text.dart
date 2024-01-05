import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class BaseText {
  BaseText._();

  static TextStyle whiteTextStyle = GoogleFonts.dmSans(color: Colors.white);
  static TextStyle greyHomeTextStyle = GoogleFonts.dmSans(color: ColorName.grey2Color);

  static TextStyle blackTextStyle =
      GoogleFonts.dmSans(color: ColorName.blackColor);

  static TextStyle appTextStyle =
      GoogleFonts.dmSans(color: ColorName.mainColor);
}
