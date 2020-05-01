import 'package:flutter/material.dart';
import 'dart:ui';

class Adapt {
  static Adapt instance = Adapt();
  static MediaQueryData mediaQuery = MediaQueryData.fromWindow(window);
  static double _width = mediaQuery.size.width;
  static double _height = mediaQuery.size.height;
  static double _topbarH = mediaQuery.padding.top;
  static double _botbarH = mediaQuery.padding.bottom;
  static double _pixelRatio = mediaQuery.devicePixelRatio;
  static double _textScaleFactor = mediaQuery.textScaleFactor;
  // Whether to allow font scaling
  static bool _allowFontScaling = false;
  // Design drawing size
  static double _uiwidth = 375.0;
  static double _uiheight = 812.0;

  // Custom initialization
  /// @param [allowFontScaling] Whether to follow the system for font scaling
  /// @param [uiwidth] Design width px
  /// @param [uiheight] Design height px

  void init(BuildContext context) {
    mediaQuery = MediaQuery.of(context);
    _width = mediaQuery.size.width;
    _height = mediaQuery.size.height;
    _topbarH = mediaQuery.padding.top;
    _botbarH = mediaQuery.padding.bottom;
    _pixelRatio = mediaQuery.devicePixelRatio;
    _textScaleFactor = mediaQuery.textScaleFactor;
  }

  static Adapt getInstance() {
    return instance;
  }

  // Set font size px
  static px(number) {
    return _allowFontScaling
        ? (number * scaleWidth) / _textScaleFactor
        : number * scaleWidth;
  }

  static onepx() {
    return 1 / _pixelRatio;
  }

  /// The ratio of the actual dp to the design draft px
  static get scaleWidth => _width / _uiwidth;

  static get scaleHeight => _height / _uiheight;

  /// The vertical extent of this size. px
  static double get screenW => _width * _pixelRatio;

  /// The vertical extent of this size. px
  static double get screenHeight => _height * _pixelRatio;

  static padTopH() {
    return _topbarH;
  }

  double setPx(number) {
    return _allowFontScaling
        ? (number * scaleWidth) / _textScaleFactor
        : number * scaleWidth;
  }

  double get getPadTopH => _topbarH;

// Bottom safety zone distance
  static padBotH() {
    return _botbarH;
  }

  static width(double width) => width * scaleWidth;

  static height(double height) => height * scaleWidth;
}
