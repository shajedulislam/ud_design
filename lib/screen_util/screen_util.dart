import 'package:flutter/material.dart';

class ScreenUtil {
  static ScreenUtil _instance;
  static const Size defaultSize = Size(1080, 1920);

  Size uiSize = defaultSize;

  bool allowFontScaling = false;

  static double _pixelRatio;
  static double _screenWidth;
  static double _screenHeight;
  static double _statusBarHeight;
  static double _bottomBarHeight;
  static double _textScaleFactor;

  ScreenUtil._();

  factory ScreenUtil() {
    assert(
      _instance != null,
      '\nEnsure to initialize ScreenUtil before accessing it.\nPlease execute the init method : ScreenUtil.init()',
    );
    return _instance;
  }

  static void init(
    BuildContext context, {
    Size designSize = defaultSize,
    bool allowFontScaling = false,
  }) {
    _instance ??= ScreenUtil._();
    _instance
      ..uiSize = designSize
      ..allowFontScaling = allowFontScaling;
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _pixelRatio = mediaQuery.devicePixelRatio;
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _statusBarHeight = mediaQuery.padding.top;
    _bottomBarHeight = mediaQuery.padding.bottom;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  double get textScaleFactor => _textScaleFactor;

  double get pixelRatio => _pixelRatio;

  double get screenWidth => _screenWidth;

  double get screenHeight => _screenHeight;

  double get screenWidthPx => _screenWidth * _pixelRatio;

  double get screenHeightPx => _screenHeight * _pixelRatio;

  double get statusBarHeight => _statusBarHeight;

  double get bottomBarHeight => _bottomBarHeight;

  double get scaleWidth => _screenWidth / uiSize.width;

  double get scaleHeight => _screenHeight / uiSize.height;

  double get scaleText => scaleWidth;

  double setWidth(num width) => width * scaleWidth;

  double setHeight(num height) => height * scaleHeight;

  double setSp(num fontSize, {bool allowFontScalingSelf}) =>
      allowFontScalingSelf == null
          ? (allowFontScaling
              ? (fontSize * scaleText)
              : ((fontSize * scaleText) / _textScaleFactor))
          : (allowFontScalingSelf
              ? (fontSize * scaleText)
              : ((fontSize * scaleText) / _textScaleFactor));
}
