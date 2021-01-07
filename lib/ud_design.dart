library ud_design;

import 'package:flutter/material.dart';
import 'package:ud_design/enums.dart';
import 'package:ud_design/values.dart';
import 'font_responsiveness.dart';

export 'package:ud_design/values.dart';
export 'package:ud_design/enums.dart';

/// UdDesign will help you making responsive application in many ways!
class UdDesign {
  static bool _init = false;
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double _blockSizeHorizontal;
  static double _blockSizeVertical;
  static UdDeviceType deviceType;
  static Orientation orientation;

  ///returns device type based on screen width
  static UdDeviceType getDeviceType() {
    if (screenWidth <= 480) {
      return UdDeviceType.mobile;
    } else if (screenWidth > 480 && screenWidth <= 850) {
      return UdDeviceType.tablet;
    }
    // else if (screenWidth > 600 && screenWidth <= 768) {
    //   return UdDeviceType.tabletNormal;
    // } else if (screenWidth > 768 && screenWidth <= 850) {
    //   return UdDeviceType.tabletLarge;
    // }
    else {
      return UdDeviceType.desktop;
    }
    //desktop will be added later
  }

  ///For responsiveness you can use this function by passing how much screen portion you want to use in horizontal (X) axis in the range of `0% - 100%`.
  static double blocksXaxis(double blocks) {
    assert(
      _init,
      "\nYou must call UdDesign.init() and pass context in a Widget build function and it should be inside MaterialApp, Not Before MaterialApp.\n",
    );
    return _blockSizeHorizontal * blocks;
  }

  ///For responsiveness you can use this function by passing how much screen portion you want to use in vertical (Y) axis in the range of `0% - 100%`.
  static double blocksYaxis(double blocks) {
    assert(
      _init,
      "\nYou must call UdDesign.init() and pass context in a Widget build function and it should be inside MaterialApp, Not Before MaterialApp.\n",
    );
    return _blockSizeVertical * blocks;
  }

  ///Flutter does not have exact solution to use pixel values for responsiveness but we tried to make one and it works nice. You can try out by passing pixel values.
  static double pixels(double blocks) {
    assert(
      _init,
      "\nYou must call UdDesign.init() and pass context in a Widget build function and it should be inside MaterialApp, Not Before MaterialApp.\n",
    );
    return _blockSizeHorizontal * blocks * _pixelAdditionByDevice();
  }

  //used to make the pixel unit perfect by getting this value based on device
  static num _pixelAdditionByDevice() {
    var value;
    switch (deviceType) {
      case UdDeviceType.mobile:
        value = 0.267;
        break;
      case UdDeviceType.tablet:
        value = 0.197;
        break;
      default:
        value = 0.267;
        break;
    }
    //tab & desktop px addition will be added later
    return value;
  }

  /// To make responsive font size, use this function
  static double fontSize(double size) {
    assert(
      _init,
      "\nYou must call UdDesign.init() and pass context in a Widget build function and it should be inside MaterialApp, Not Before MaterialApp.\n",
    );

    switch (deviceType) {
      case UdDeviceType.mobile:
        return FontResponsiveness().setSp(size);
        break;
      case UdDeviceType.tablet:
        return FontResponsiveness().setSp(size * 1.5);
        break;
      default:
        return FontResponsiveness().setSp(size);
        break;
    }
  }

  /// You must call this function in a [ Widget build ] function and it should be inside [ MaterialApp ]. Not Before [ MaterialApp ].
  static void init(BuildContext context) {
    _init = true;
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    _blockSizeHorizontal = screenWidth / 100;
    _blockSizeVertical = screenHeight / 100;
    orientation = _mediaQueryData.orientation;

    if (screenWidth <= 480) {
      deviceType = UdDeviceType.mobile;
    } else if (screenWidth > 480 && screenWidth <= 850) {
      deviceType = UdDeviceType.tablet;
    } else if (screenWidth > 480 &&
        screenWidth <= 850 &&
        UdDesign.orientation == Orientation.landscape) {
      deviceType = UdDeviceType.tablet;
    }
    //else if (screenWidth > 600 && screenWidth <= 768) {
    //   deviceType = UdDeviceType.tablet;
    // } else if (screenWidth > 768 && screenWidth <= 850) {
    //   deviceType = UdDeviceType.tablet;
    // }
    else {
      deviceType = UdDeviceType.desktop;
    }

    double defaultScreenWidth;
    double defaultScreenHeight;

    if (deviceType == UdDeviceType.mobile) {
      defaultScreenWidth = ProjectValues.screen_width_mobileAll;
      defaultScreenHeight = ProjectValues.screen_height_mobileAll;
    } else if (deviceType == UdDeviceType.tablet) {
      defaultScreenWidth = ProjectValues.screen_width_tabletAll;
      defaultScreenHeight = ProjectValues.screen_height_tabletAll;
    }

    FontResponsiveness.init(
      context,
      designSize: Size(defaultScreenWidth, defaultScreenHeight),
    );
  }
}
