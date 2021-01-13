import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'colors.dart';

class HSLTextStyles {


  static const TextStyle textSize16 = TextStyle(
    fontSize: 16,
  );

  static const TextStyle textSizeBold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textSizeBold18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle textWhite14 = TextStyle(
    fontSize: 14,
    color: Colors.white,
  );

  static const TextStyle textWhite16 = TextStyle(
    fontSize: 16,
    color: Colors.white,
  );

  static const TextStyle textWhiteBold28 = TextStyle(
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: Colors.white
  );

  static const TextStyle text14 = TextStyle(
      fontSize: 14,
      color: HSLColors.text,
      textBaseline: TextBaseline.alphabetic
  );

  static const TextStyle textDark14 = TextStyle(
      fontSize: 14,
      color: HSLColors.dark_text,
      textBaseline: TextBaseline.alphabetic
  );

}
