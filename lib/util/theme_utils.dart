import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterstudy/res/resources.dart';
import 'package:flutterstudy/util/device_utils.dart';

class ThemeUtils {

  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color getDarkColor(BuildContext context, Color darkColor) {
    return isDark(context) ? darkColor : null;
  }

  static Color getIconColor(BuildContext context) {
    return isDark(context) ? HSLColors.dark_text : null;
  }

  static Color getKeyboardActionsColor(BuildContext context) {
    return isDark(context) ? HSLColors.dark_bg_color : Colors.grey[200];
  }

  /// 设置NavigationBar样式
  static void setSystemNavigationBarStyle(BuildContext context, ThemeMode mode) {
    /// 仅针对安卓
    if (Device.isAndroid) {
      bool _isDark = false;
      final ui.Brightness platformBrightness = MediaQuery.platformBrightnessOf(context);
      print(platformBrightness);
      if (mode == ThemeMode.dark || (mode == ThemeMode.system && platformBrightness == ui.Brightness.dark)) {
        _isDark = true;
      }
      print(_isDark);
      final SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: _isDark ? HSLColors.dark_bg_color : Colors.white,
        systemNavigationBarIconBrightness: _isDark ? Brightness.light : Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}

extension ThemeExtension on BuildContext {
  bool get isDark => ThemeUtils.isDark(this);
  Color get backgroundColor => Theme.of(this).scaffoldBackgroundColor;
  Color get dialogBackgroundColor => Theme.of(this).canvasColor;
}