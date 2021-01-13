import 'package:flutter/foundation.dart';

class Constant {

  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction  = kReleaseMode;

  static const String theme = 'AppTheme';
  static const String locale = 'locale';
}